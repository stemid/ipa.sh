import json
from configparser import RawConfigParser

import user_agents
from bottle import route, default_app, debug, request, run, response, template
from bottle import TEMPLATE_PATH, static_file
from pygeoip import GeoIP
from dns import resolver, reversename

config = RawConfigParser()
config.readfp(open('ipash.cfg'))
config.read(['ipash_local.cfg'])

TEMPLATE_PATH = ['./templates', config.get('app', 'templates_path')]


@route('/css/<filename>')
def serve_css(filename):
    return static_file(
        filename,
        root=config.get('app', 'static_path') + '/css'
    )


@route('/')
def index():
    res_data = {}
    verbose = False
    prettyprint = False

    try:
        client_ip = request.remote_route[0]
    except:
        client_ip = request.environ['REMOTE_ADDR']
        pass

    args = request.query_string.split('&')
    if 'v' in args:
        verbose = True

    if 'pp' in args:
        prettyprint = True

    res_data['ip'] = client_ip

    try:
        ua = request.environ['HTTP_USER_AGENT']
        user_agent = user_agents.parse(ua)
        res_data['user_agent'] = str(user_agent)
    except Exception as e:
        user_agent = False
        pass

    if user_agent and not verbose:
        if user_agent.browser.family == 'Other':
            response.set_header('Content-type', 'text/plain')
            return res_data['ip'] + '\r\n'

    try:
        ip = GeoIP(config.get('app', 'geoip_database'))
        res_data['country'] = ip.country_name_by_addr(client_ip)
        res_data['city'] = ip.record_by_addr(client_ip)
        res_data['asn'] = ip.asn_by_addr(client_ip)
    except Exception as e:
        pass

    try:
        name = reversename.from_address(client_ip)
        answers = resolver.query(name, 'PTR')
        res_data['hostname'] = []
        for answer in answers:
            res_data['hostname'].append(str(answer).rstrip('.'))
    except Exception as e:
        pass

    if user_agent and verbose:
        if user_agent.browser.family == 'Other':
            response.set_header('Content-type', 'application/json')
            if prettyprint:
                return json.dumps(
                    res_data,
                    sort_keys=True,
                    indent=4,
                    separators=(',', ': ')
                ) + '\r\n'
            return json.dumps(res_data)

    return template(
        'index',
        ua_info=res_data,
        page_title='Your IP-address is: ' + res_data['ip'],
        verbose=verbose
    )

if __name__ == '__main__':
    run(
        host=config.get('app', 'host'),
        port=config.get('app', 'port')
    )
    debug(config.get('app', 'debug'))
else:
    application = default_app()

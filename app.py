import json
from configparser import RawConfigParser

import user_agents
from bottle import route, default_app, debug, request, run, response, template
from bottle import TEMPLATE_PATH, static_file
from ipwhois import IPWhois

config = RawConfigParser()
config.readfp(open('ipash.cfg'))
config.read(['ipash_local.cfg'])

TEMPLATE_PATH = ['./views', config.get('app', 'templates_path')]


@route('/css/<filename>')
def serve_static(filename):
    return static_file(
        filename,
        root=config.get('app', 'static_path') + '/css'
    )


@route('/')
def index():
    res_data = {}
    try:
        client_ip = request.remote_route[0]
    except:
        client_ip = request.environ['REMOTE_ADDR']
        pass

    res_data['ip'] = client_ip

    if request.query_string == 'v':
        try:
            ua = request.environ['HTTP_USER_AGENT']
            user_agent = user_agents.parse(ua)
            res_data['user_agent'] = str(user_agent)
        except Exception as e:
            user_agent = False
            pass

        try:
            whois = IPWhois(client_ip)
            whois_res = whois.lookup()
            res_data['whois'] = whois_res
        except Exception as e:
            if not user_agent:
                response.status = 500
                return json.dumps({'error': str(e)})

        response.set_header('Content-type', 'application/json')
        return json.dumps(res_data)

    if user_agent:
        if user_agent.browser.family == 'Other':
            response.set_header('Content-type', 'text/plain')
            return res_data['ip'] + '\r\n'

    return template('index', 
                    ua_info=res_data,
                    page_title='Your IP-address is ' + res_data['ip']
                   )

if __name__ == '__main__':
    run(
        host=config.get('app', 'host'),
        port=config.get('app', 'port')
    )
    debug(config.get('app', 'debug'))
else:
    application = default_app()

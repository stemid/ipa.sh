% rebase('base.tpl', page_title=page_title, verbose=verbose)

<table class="ip-table">
  <tr>
    <th>IP-Address</th>
    <td>{{ua_info.get('ip')}}</td>
  </tr>
  <tr>
    <th>User Agent</th>
    <td>{{ua_info.get('user_agent')}}</td>
  </tr>
  <tr>
    <th>ASN (ISP)</th>
    <td>{{ua_info.get('asn')}}</td>
  </tr>
  % if 'city' in ua_info.keys():
  <tr>
    <th>Country</th>
    <td>{{ua_info['city']['country_name']}}</td>
  </tr>
  % end
</table>

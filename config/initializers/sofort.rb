require 'sofort'
require 'sofort/client'

Sofort.setup do |config|

  config.base_url = 'https://api.sofort.com/api/xml'
  config.user_id = '156982'
  config.api_key = '9eb3aa4e1a186386a43347ac8e5a81eb'
  config.abort_url = ''
  config.success_url = ''
  config.notification_url = ''
  config.language_code = ''
  config.email_customer = 'info@smilemeuponline.com'
  config.notification_email = ''
  config.country_code = 'DE'
  config.currency_code = 'EUR'
  config.reason = 'Reason'
  config.user_variable = 'Variable 0'
  config.project_id = '444098'

end
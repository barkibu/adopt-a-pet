Airbrake.configure do |config|
  config.api_key = ENV['MAILER_SENDER']
  config.host = 'api.rollbar.com'
  config.secure = true
end

Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
  config.host = 'api.rollbar.com'
  config.secure = true
end

require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"))
)

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.adopt-a-pet.com' }
  config.action_mailer.delivery_method   = :postmark
  config.action_mailer.postmark_settings = { api_key: ENV['POSTMARK_API_KEY'] }
end

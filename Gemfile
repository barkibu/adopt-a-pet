source 'https://rubygems.org'

ruby "2.2.5"

gem 'rollbar'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'i18n-tasks'
gem 'jquery-rails'
gem 'neat'
gem 'normalize-rails'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '~> 4.1'
gem 'recipient_interceptor'
gem 'simple_form'
gem 'uglifier'
gem 'unicorn'
gem 'haml-rails'
gem 'devise'
gem 'devise-async'
gem 'devise-i18n'
gem 'upmin-admin'
gem 'paperclip'
gem 'aws-sdk'
gem 'draper'
gem 'meta-tags'
gem 'magnific-popup-rails'
gem 'delayed_paperclip'
gem 'sitemap_generator'
gem 'kaminari'
gem 'pundit'
gem 'omniauth-facebook'

group :development do
  gem 'bundler-audit'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'meta_request'
  gem 'better_errors'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'codeclimate-test-reporter', require: nil
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
end

group :staging, :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

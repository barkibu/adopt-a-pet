source "https://rubygems.org"

ruby "2.1.2"

gem "airbrake"
gem "bourbon"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat"
gem "normalize-rails"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.6"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "simple_form"
gem "uglifier"
gem "unicorn"
gem 'haml-rails'
gem 'devise'
gem "devise-async"
gem 'devise-i18n'
gem 'postmark-rails'
gem 'paperclip'
gem 'aws-sdk'
gem 'draper'
gem 'meta-tags'
gem 'magnific-popup-rails'
gem 'delayed_paperclip'
gem 'sitemap_generator'
gem 'kaminari'
gem 'pundit'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails"
  gem 'ffaker'
  gem 'meta_request'
  gem 'better_errors'
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
  gem 'simplecov', require: false
end

group :staging, :production do
  gem "newrelic_rpm"
  gem 'rails_12factor'
end

source "https://rubygems.org"

ruby "2.5.1"

gem "autoprefixer-rails"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rails", "~> 5.0.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "rubocop"
gem "title"
gem "uglifier"
gem "font-awesome-rails"
gem "clearance"
gem "paperclip"
gem "kaminari"
gem "ancestry"
gem "searchkick"
gem "rails_admin"
gem "sendgrid-ruby"
gem "twilio-ruby", "~> 4.11.1"
gem "rufus-scheduler"
gem "activejob_backport"
gem "mailgun-ruby"
gem "friendly_id", "~> 5.1.0"
gem "aws-sdk"

gem "letter_avatar"
gem "bookmark_system"
gem "country_select"
gem "ice_cube"
gem "schedulable", git: "https://github.com/warmlyyours/schedulable"
gem "recurring_select", git: "https://github.com/sahild/recurring_select"
gem "attendable", github: "rexblack/attendable"
gem "social-share-button"

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry"
  gem "rspec-rails", "~> 3.5"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
  gem "listen"
end

group :test do
  # gem "capybara-webkit"
  gem "database_cleaner"
  # gem "formulaic"
  gem "launchy"
  # gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  # gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end

gem "high_voltage"
gem "refills", group: [:development, :test]
gem "rails_12factor", group: :production

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4 '

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'human_enum_name'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-status'
gem 'sidekiq-failures'
gem 'foreman'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'kaminari'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'carrierwave'
# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
# Pry is a powerful alternative to the standard IRB shell for Ruby.
gem 'pry-rails', :group => :development
# Devise is a flexible authentication solution for Rails based on Warden. It:
gem 'devise'
gem 'devise-i18n'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'bootstrap', '>= 5.0.2'
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher

gem 'sprockets', '~> 4'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'rack-cors'
gem 'apexcharts'
# use to run json in apexcharts
gem 'functionable-json'
gem 'groupdate'
gem "chartkick"

gem 'momentjs-rails'
gem 'annotate'

gem 'stamp' #date
group :development, :test do
  gem 'pry-byebug'

  # Simple, multi-client and secure token-based authentication for Rails.
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

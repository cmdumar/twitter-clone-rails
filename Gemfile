source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Rubocop Linter
gem 'rubocop', '~>0.81.0'

# Bootstrap
gem 'bootstrap', '~> 5.0.0.alpha1'
gem 'jquery-rails'

# Font Awesome
gem 'font-awesome-rails'

# Simple forms
gem 'simple_form', '~> 5.0', '>= 5.0.3'

# Devise
gem 'devise'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Active Storage Validation
gem 'active_storage_validations', '~> 0.9.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # The RSpec testing framework
  gem 'rspec-rails'

  # Capybara, the library that allows us to interact with the browser using Ruby
  gem 'capybara'

  # The following gems aids with the nuts and bolts
  # of interacting with the browser.
  gem 'webdrivers'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Provides a better error page for Rails and other Rack apps. Includes source code inspection,
  # a live REPL and local/instance variable inspection for all stack frames.
  gem 'better_errors', '~> 2.8', '>= 2.8.3'
  gem 'bullet', '~> 6.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'rspec'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'shoulda-matchers', '~> 4.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

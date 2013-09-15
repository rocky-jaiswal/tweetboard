source 'https://rubygems.org'

gem 'rails', '3.2.14'

gem 'devise'
gem 'simple_form'
gem 'figaro'
gem 'multi_json'
gem 'twitter', :git => 'https://github.com/sferik/twitter.git'

platform :jruby do
  gem 'activerecord-jdbcpostgresql-adapter'
end

platform :ruby do
  gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'
  gem 'zurb-foundation'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'font-awesome-rails'
end

group :development, :test do
  gem 'thin'
  gem 'rspec-rails', '~> 2.0'
  gem 'sqlite3'
end

group :development do
  gem 'quiet_assets'
end

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver'
  gem 'database_cleaner', '< 1.1.0'
  gem 'launchy'
end

gem 'capistrano'

# To use debugger
# gem 'debugger'

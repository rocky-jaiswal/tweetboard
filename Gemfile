source 'https://rubygems.org'

gem 'rails', '3.2.17'

gem 'devise', '3.0.3'
gem 'simple_form'
gem 'figaro'
gem 'multi_json'
gem 'twitter', '5.7.1'
gem 'activerecord-jdbcpostgresql-adapter'
gem 'puma'

group :development do
  gem 'quiet_assets'
end

group :development, :test do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'rspec-rails', '~> 2.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'selenium-webdriver'
  gem 'database_cleaner', '< 1.1.0'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
end

gem 'capistrano', '2.15.4'

ruby '1.9.3', engine: 'jruby', engine_version: '1.7.10'

# To use debugger
# gem 'debugger'

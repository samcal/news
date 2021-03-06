source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'


# Use Active Model Serializers for API
gem 'active_model_serializers'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use Twitter Bootstrap for default styling
gem 'bootstrap-sass'

# Frienly Id for nice-looking article URLs
gem 'friendly_id'

# Paperclip for attaching images
gem "paperclip", "~> 3.0"
gem 'aws-sdk'

# Redcarpet for Markdown rendering
gem 'redcarpet'

# Devise and CanCan for authentication
gem "devise"
gem "cancan"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Add pagination for the articles
gem 'will_paginate', '~> 3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'rspec-rails', '~> 3.0.0.beta', :group => [:test, :development]

group :development do
  gem 'terminal-notifier-guard'
  gem 'guard-livereload', require: false
  gem "rack-livereload"
  gem 'sqlite3'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'simplecov', :require => false
  gem 'rspec', '~> 3.0.0.beta2'
  gem 'guard-rspec', "~> 4.2.8", require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'    # required by heroku
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


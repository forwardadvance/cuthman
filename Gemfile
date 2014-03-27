source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

gem "cuthman_rails", :path => "./vendor/gems/cuthman_rails"

gem "paperclip"
gem 'aws-sdk'
gem 'RedCloth'
gem "haml"
gem 'delayed_job'
gem 'delayed_job_active_record'
gem "font-awesome-rails"

gem "factory_girl_rails"
gem 'rspec-rails'

gem 'jquery-turbolinks'
gem 'tinymce-rails'

group :development do
  gem "letter_opener"
end

group :test, :development do
  gem 'debugger'
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem "pg"
  gem "thin"
  gem 'aws-sdk'
  gem 'airbrake'
end

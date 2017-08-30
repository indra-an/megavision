source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'sqlite3'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'turbolinks', '~> 5'
gem 'closure-compiler'
gem 'devise'
gem 'carrierwave'
gem "recaptcha", require: 'recaptcha/rails'

gem "roo"
gem "roo-xls"
gem "writeexcel"
gem 'prawn'
gem 'prawn-rails'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'capistrano', '3.5.0'
  gem 'capistrano-rvm'
  gem 'capistrano-nginx'
  gem 'capistrano3-puma'
  gem 'capistrano-rails'
  gem 'capistrano-rails-db'
  gem 'capistrano-rails-console'
  gem 'capistrano-upload-config'
  gem 'sshkit-sudo'

  gem "better_errors"
  gem "binding_of_caller"
  gem "annotate"
  gem "bullet"

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

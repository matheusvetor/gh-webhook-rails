# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.4'

gem 'rails', '~> 5.2.0'

gem 'puma'

gem 'pg', '>= 0.18', '< 2.0'

gem 'sassc-rails'

gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fasterer'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'rubycritic', require: false
end

group :development do
  gem 'bullet'
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'simplecov', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

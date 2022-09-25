source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'faraday'

gem 'figaro'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
end

group :development do
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

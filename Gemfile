source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0', '>= 7.0.4.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.6'

# Use Puma as the app server
gem 'puma', '~> 6.0', '>= 6.0.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.11', '>= 2.11.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 5.0', '>= 5.0.6'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1', '>= 3.1.18'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.16', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# TODO: add rack-mini-profiler
# TODO: sentry / datadog / sumologic
# TODO: bullet - detects N+1 queries and will yell at you in logs
# TODO: rubocop-okakase - this is to help you IDE enforce coding standards
# TODO: lograge

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # TODO: gem "faker" for random and powerful test/development data

  gem 'pry-byebug', '~> 3.10', '>= 3.10.1'

  gem 'letter_opener', '~> 1.8', '>= 1.8.1'

  gem 'did_you_mean', '~> 1.6', '>= 1.6.3'

  # TODO: Add Annotate - not having to jump to schema.rb is a major time saver, you should always have full context on a model's columns/indexes where it's useful, in the model file
end

group :development do
  # TODO: Add me now good god what have we done! 💥 gem "strong-migrations"

  gem 'rexml', '~> 3.2', '>= 3.2.5'

  gem 'rubycritic', '~> 4.7', require: false

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'simplecov', '~> 0.22.0', require: false
end

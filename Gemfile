source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# https://github.com/faker-ruby/faker
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'

# https://github.com/twbs/bootstrap-rubygem
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails'

# https://github.com/TrestleAdmin/trestle
gem 'trestle'

# https://github.com/interdiscipline/lockup
# gem 'lockup' # doesn't seem to play nice with Trestle

# https://github.com/lml/commontator
# gem 'commontator'

# https://github.com/activerecord-hackery/ransack
gem 'ransack'

# https://github.com/marcelolx/bootstrap-icons
gem 'bootstrap-icons-helper'

# https://github.com/jhund/filterrific
# gem 'filterrific'
# gem 'filterrific', git: 'https://github.com/lucashaley/filterrific'

# https://github.com/ankane/chartkick
gem 'chartkick'

# https://github.com/fjuan/activerecord_reset_pk_sequence
gem 'activerecord_reset_pk_sequence'

gem 'mail'

# https://github.com/jonhue/acts_as_favoritor
# gem 'acts_as_favoritor' # over engineered, broken

# https://rubocop.org/
gem 'rubocop', require: false
# https://github.com/rubocop/rubocop-rails
gem 'rubocop-rails', require: false

# https://github.com/pmviva/bookmark_system
# gem 'bookmark_system', '~> 0.2.0' # Doesn't work with 7.0.1

# https://brakemanscanner.org/docs/install/
# gem "brakeman"

# https://github.com/ilyakatz/data-migrate
gem 'data_migrate'

# https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail'

# https://github.com/afomera/trix
# gem 'trix-rails', require: 'trix'

# https://github.com/Iwark/bootstrap-markdown-editor-rails
gem 'ace-rails-ap'
gem 'bootstrap-markdown-editor-rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'sqlite3', '~> 1.4'

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================

# Specify the Refinery CMS core:
gem 'refinerycms',              '= 0.9.9'
gem 'refinerycms-generators',   '~> 0.9'

group :test do

  # Autotest
  gem 'ZenTest'
  gem 'autotest'
  gem 'autotest-inotify'
  gem 'autotest-rails'
  gem 'rb-inotify'
  gem 'autotest-notification'
  gem 'redgreen'

end

group :development do

	gem 'heroku'
    gem 'mongrel'

end

group :development, :test do
  # RSpec
  gem 'rspec-rails',            '= 2.3'

  # Cucumber
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'gherkin'
  gem 'spork' unless Bundler::WINDOWS
  gem 'rack-test',              '~> 0.5.6'
  gem 'json_pure'

  # Factory Girl
  gem 'factory_girl'
  gem "#{'j' if RUBY_PLATFORM == 'java'}ruby-prof" unless defined?(RUBY_ENGINE) and RUBY_ENGINE == 'rbx'

  # other
	gem 'tzinfo'
	gem 'mail'
	gem 'columnize'
	gem 'thor'
	gem 'taps'
end

# END REFINERY CMS ============================================================

# USER DEFINED
gem 'haml'

# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-portfolio',  '~> 0.9'
# gem 'refinerycms-theming',    '~> 0.9'

gem 'refinerycms-inquiries',    '~> 0.9'
gem 'refinerycms-page-images', '~> 1.0.2'
gem 'refinerycms-news', :git => 'git://github.com/dsaronin/refinerycms-news', :branch => 'master'
gem 'refinerycms-blog', :git => 'git://github.com/dsaronin/refinerycms-blog', :branch => 'master'
gem 'refinerycms-galleries', :require => 'galleries', :git => 'git://github.com/dsaronin/refinerycms-galleries', :branch => 'master'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '~> 0.9'

# Figure out how to get RMagick:
rmagick_options = {:require => false}
rmagick_options.update({
  :git => 'git://github.com/refinerycms/rmagick.git',
  :branch => 'windows'
}) if Bundler::WINDOWS

# Specify a version of RMagick that works in your environment:
gem 'rmagick',                  '~> 2.12.0', rmagick_options

gem 'authlogic'

# END USER DEFINED

source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :linux do
  gem 'pg'
end

group :mac do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================

# freeze specific gems for legacy refinery 0.9.9 ******************************
gem 'babosa', '=0.2.2'
gem 'dragonfly', '=0.8.2'
gem 'friendly_id_globalize3', '=3.2.1'
gem 'globalize3', '=0.1.0.beta'
gem 'i18n', '=0.5.0'
gem 'truncate_html', '=0.5.0'
gem 'warden', '=1.0.3'
gem 'xml-simple', '=1.0.12'
gem 'devise', '=1.1.8'

# *****************************************************************************

# Specify the Refinery CMS core:
gem 'refinerycms',              '= 0.9.9'
gem 'refinerycms-generators',   '= 0.9.9.1'


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

group :development, :test do
  gem 'heroku'
  gem 'mongrel'

  # RSpec
  gem 'rspec-rails',            '= 2.3'

  # Cucumber
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'gherkin'
  gem 'spork', "~>0.8.5" unless Bundler::WINDOWS
  gem 'rack-test', '~> 0.5.6'
  gem 'json_pure'

  # Factory Girl
  gem 'factory_girl'
  gem "#{'j' if RUBY_PLATFORM == 'java'}ruby-prof" unless defined?(RUBY_ENGINE) and RUBY_ENGINE == 'rbx'

  # other
gem 'tzinfo', '=0.3.25'    # TODO: pull freeze in 1.0 upgrade
gem 'mail', '=2.2.15'     # TODO: pull freeze in 1.0 upgrade
  gem 'columnize'
  gem 'thor'
  gem 'taps'
end
# END REFINERY CMS ============================================================

# USER DEFINED
gem 'haml'
gem 'sass'

#  gem 'dalli'   # used for heroku memcache

# Specify additional Refinery CMS Engines here (all optional):
# gem 'refinerycms-portfolio',  '~> 0.9'
# gem 'refinerycms-theming',    '~> 0.9'

gem 'refinerycms-inquiries',    '= 0.9.9.9'
gem 'refinerycms-page-images', '= 1.0.3'
gem 'refinerycms-news', :git => 'git://github.com/dsaronin/refinerycms-news', :branch => 'master'
gem 'refinerycms-blog', :git => 'git://github.com/dsaronin/refinerycms-blog', :branch => 'master'
gem 'refinerycms-galleries', :require => 'galleries', :git => 'git://github.com/dsaronin/refinerycms-galleries', :branch => 'master'

# gem 'banner-rotator', :git => 'git@github.com:AlexisMasters/banner-rotator.git', :branch => 'master'
# gem 'banner-rotator', :git => 'git://github.com/dsaronin/banner-rotator.git', :branch => 'master'

# Add i18n support (optional, you can remove this if you really want to).
gem 'refinerycms-i18n',         '= 0.9.9.7'

# Figure out how to get RMagick:
rmagick_options = {:require => false}
rmagick_options.update({
  :git => 'git://github.com/refinerycms/rmagick.git',
  :branch => 'windows'
}) if Bundler::WINDOWS

# Specify a version of RMagick that works in your environment:
gem 'rmagick',                  '~> 2.12.0', rmagick_options

gem 'authlogic'
gem "recaptcha", :require => "recaptcha/rails"

# END USER DEFINED

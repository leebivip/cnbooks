require 'rubygems'

# next ines needed to fix following exception when running under ruby 1.9.2
# couldn't parse YAML at line 7 column 0 (Psych::SyntaxError)
unless RUBY_VERSION =~ /1\.8\.7/
  require 'yaml'
  YAML::ENGINE.yamler= 'syck'
end

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

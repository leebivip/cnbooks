# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

#  module ::Gardenia
#    class Application
#      include ::Rake::DSL if defined? ::Rake::DSL
#    end
#  end
#   
#  module ::RakeFileUtils
#    extend ::Rake::FileUtilsExt if defined? ::Rake::FileUtilsExt
#  end

Gardenia::Application.load_tasks

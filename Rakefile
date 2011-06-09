# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

unless `rake --version` =~ /0\.9\.0/
  
  module ::Gardenia
    class Application
      include Rake::DSL
    end
  end
   
  module ::RakeFileUtils
    extend Rake::FileUtilsExt
  end
  
end

Gardenia::Application.load_tasks

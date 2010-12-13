# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Refinery::Application.initialize!
RefinerySetting.set(:version,'0.1-4')
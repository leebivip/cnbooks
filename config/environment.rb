# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Refinery::Application.initialize!
RefinerySetting.set(:gardenia_version,'0.2-3') if RefinerySetting.table_exists?
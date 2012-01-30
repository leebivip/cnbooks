# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gardenia::Application.initialize!
RefinerySetting.set(:gardenia_version,'0.5-2') if RefinerySetting.table_exists?

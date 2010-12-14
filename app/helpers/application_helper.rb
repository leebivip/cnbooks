# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
  include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.

# -----------------------------------------------------------------------------  
# choose_body_floats -- dynamically choose float for body content sides of page
# this allows admin to change refinery setting (:gardenia_main_content_side)
# to make the sides switch selectable .. but that means we must dynamically 
# set the css float style for the sections
# -----------------------------------------------------------------------------  
  def choose_body_floats( section )
    main_is_left = (RefinerySetting.get(:gardenia_main_content_side) =~ /left/i)
    case section
      when :body_content_title,:body_content_left  then (main_is_left ? 'left' : 'right' )
      when :body_content_right then  (main_is_left ? 'right' : 'left' )
    else
      'right'
    end  # case
      
  end
# -----------------------------------------------------------------------------
# select_outer_div -- returns the outer div for properly selecting content sides of page
# -----------------------------------------------------------------------------  
  def select_outer_div( section )
    return "<div id = '#{section == :body_content_left ?  "main_content" : "sidebar_content" }' style = 'float: #{choose_body_floats( section )};'>"    
  end
# -----------------------------------------------------------------------------  
# -----------------------------------------------------------------------------  
end

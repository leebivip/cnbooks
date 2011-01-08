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
# prep_dom_section -- prepatory stuff for an individual section; returns dom_id
# preps the fall back stuff
# ----------------------------------------------------------------------------- 
  def prep_dom_section(section, need_fallback )
    section[:html] = ( content_for( section[:yield] ) ) # renders here
    
    if section[:html].blank? and need_fallback and
        section.keys.include?(:fallback) and
        section[:fallback].present?
        
      section[:html] = section[:fallback].to_s.html_safe
      
    end  # if

    return ( section[:id] ||= section[:yield].to_s.downcase )  # dom_id
  end
# -----------------------------------------------------------------------------  
# prepare_content_page -- replaces *ALL* the erb/haml code on shared/content_page
# args: assumed to be local variables prior to invoking the view?
# expected (from controller?)
#   @page
# RESULTS & SIDE EFFECTS:
#   @sections -- array of section hashes (used by calling view)
#   @class_list -- list of css classes required
# -----------------------------------------------------------------------------  
  def prepare_content_page(show_empty_sections, remove_automatic_sections , hide_sections)
  
    need_fallback = (!show_empty_sections and !remove_automatic_sections)
    
    @sections = [ 
        {:yield => :body_content_right, :fallback => (@page.present? ? @page[Page.default_parts.second.to_sym] : nil)},
        {:yield => :body_content_title, :fallback => page_title, :id => 'body_content_page_title', :title => true},
        {:yield => :body_content_left, :fallback => (@page.present? ? @page[Page.default_parts.first.to_sym] : nil)},
      ]
    
    # if there is no title, then the order of sections presented to browser must reverse, otherwise
    # things won't float correctly .. yeah, I know this repetitive code looks like a kludge below .. maybe clean up someday?
    
#    if content_for(:body_content_title).blank? || RefinerySetting.get(:gardenia_disable_repeat_title)
#      @sections.concat [ 
#        {:yield => :body_content_left, :fallback => (@page.present? ? @page[Page.default_parts.first.to_sym] : nil)},
#        {:yield => :body_content_right, :fallback => (@page.present? ? @page[Page.default_parts.second.to_sym] : nil)},
#      ]
#    else
#      @sections.concat [ 
#        {:yield => :body_content_right, :fallback => (@page.present? ? @page[Page.default_parts.second.to_sym] : nil)},
#        {:yield => :body_content_title, :fallback => page_title, :id => 'body_content_page_title', :title => true},
#        {:yield => :body_content_left, :fallback => (@page.present? ? @page[Page.default_parts.first.to_sym] : nil)},
#      ]
#    end
  
    @sections.delete_if{ |section| hide_sections.include?( section[:yield] ) }
    
    if @page.present? && Page.default_parts.size > 2  # need any sidebar boxes?
      
      sidebar_sections = Page.default_parts[2,Page.default_parts.size - 2].inject([]) do |list, part|
        list << {:yield => part.to_sym, :fallback => @page[part.to_sym] }
      end  # do each page part
        
      sidebar_sections.reject{ |section| hide_sections.include?( section[:yield] ) }
      
    else
      
      sidebar_sections = []   # no further sidebar sections
          
    end  # if..else for sidebars
    
    css = []
  
    @sections.each do |section|

      dom_id = prep_dom_section(section, need_fallback )
      
      unless section[:html].blank?
      # see application_helper.rb for select_outer_div and choose_body_floats
    
        if section[:title]
          section[:html] = "<div id = 'body_content_title' style = 'float: #{choose_body_floats( section[:yield] )};'> <h1 id='#{dom_id}'>#{section[:html]}</h1> </div>"
        else
          section[:html] = "#{select_outer_div( section[:yield] )} <div class='clearfix' id='#{dom_id}'>#{section[:html]} </div> "
          
            # if this is the sidebar area, then also insert subsidiary boxes to sidebar
          if section[:yield] == :body_content_right
            sidebar_sections.each do |sub_section|
              sub_dom_id = prep_dom_section(sub_section, need_fallback )
              unless sub_section[:html].blank?
                section[:html] << "<div class='sidebar_box clearfix' id='#{sub_dom_id}'>#{sub_section[:html]} </div> "
              end  # sub_section unless
            end  # each sub_section
          end # special sidebar handling
          
          section[:html] << "</div>" # attach trailing div closure
        end  # innermost unless .. else
        
      else
        css << "no_#{dom_id}"
      end  # outermost unless .. else
      
    end   # do each section
    
    @class_list = "clearfix#{" #{css.join(' ')}" if css.any?}"

  end


# -----------------------------------------------------------------------------  
# -----------------------------------------------------------------------------  
end # class helpers

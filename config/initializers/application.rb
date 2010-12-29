# initialize all gardenia-expected settings
# format is: [variable, default]
 if RefinerySetting.table_exists?
  [
    [:gardenia_version,'0.1-0'],
    [:gardenia_hf_stretch,false],
    [:gardenia_nav_search,false],
    [:gardenia_side_search,false],
    [:gardenia_main_content_side,'left'],
    [:gardenia_parts_allow_widgets, %w(Widgets)],
    [:gardenia_disable_repeat_title, false],
  ].each{|setting,default| RefinerySetting.set(setting,default) if RefinerySetting.get(setting).nil?}
  
  parts_list = RefinerySetting.get(:default_page_parts)
  unless parts_list.include?('Recent Posts')
    parts_list << 'Recent Posts'
    RefinerySetting.set(:default_page_parts, parts_list)
  end
 end

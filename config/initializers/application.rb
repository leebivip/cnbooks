# initialize all gardenia-expected settings
# format is: [variable, default]
[
  [:site_name, 'Gardenia'],
  [:gardenia_version,'0.1-0'],
  [:gardenia_hf_stretch,false],
  [:gardenia_nav_search,false],
  [:gardenia_side_search,false],
  [:gardenia_main_content_side,'left'],
  [:gardenia_parts_allow_widgets, %w(Widgets)],
].each{|setting,default| RefinerySetting.set(setting,default) if RefinerySetting.get(setting).nil?}

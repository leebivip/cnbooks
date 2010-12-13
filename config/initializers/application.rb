# initialize all gardenia-expected settings
# format is: [variable, default]
[
  [:version,'0.1-0'],
  [:sf_stretch,false],
].each{|setting,default| RefinerySetting.set(setting,default) if RefinerySetting.get(setting).nil?}

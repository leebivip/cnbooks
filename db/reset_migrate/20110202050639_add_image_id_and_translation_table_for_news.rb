class AddImageIdAndTranslationTableForNews < ActiveRecord::Migration

  def self.up
    add_column   :news_items, :image_id, :integer
    add_column   :news_items, :external_url, :string 
    
    NewsItem.create_translation_table! :title => :string, :body => :text, :external_url => :string
  end

  def self.down
    NewsItem.drop_translation_table!

    remove_column   :news_items, :image_id
    remove_column   :news_items, :external_url
  end

end

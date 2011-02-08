class CreateNewsItems < ActiveRecord::Migration

  def self.up
    create_table :news_items, :id => true do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date
      t.timestamps
    end

    add_index :news_items, :id

# gardenia 0.9.8.9 > 0.9.9 alteration (here and below)
#    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_news"})

# gardenia 0.9.8.9 > 0.9.9 alteration (here and below)
#    Page.delete_all({:link_url => "/news"})

    drop_table :news_items
  end

end

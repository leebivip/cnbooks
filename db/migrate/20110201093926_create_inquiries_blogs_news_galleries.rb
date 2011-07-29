class CreateInquiriesBlogsNewsGalleries < ActiveRecord::Migration
  def self.up
    unless ::Inquiry.table_exists?

      create_table ::Inquiry.table_name, :force => true do |t|
        t.string   "name"
        t.string   "email"
        t.string   "phone"
        t.text     "message"
#        t.integer  "position"
#        t.boolean  "open",       :default => true
        t.datetime "created_at"
        t.datetime "updated_at"
        t.boolean  "spam",       :default => false
      end

      add_index ::Inquiry.table_name, :id

    end  # unless

    # todo: remove at 1.0
    create_table ::InquirySetting.table_name, :force => true do |t|
      t.string   "name"
      t.text     "value"
      t.boolean  "destroyable"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless ::InquirySetting.table_exists?

    create_table :news_items, :id => true do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date
      t.timestamps
    end

    add_index :news_items, :id

    ::Page.reset_column_information if defined?(::Page)

    create_table :blog_posts, :id => true do |t|
      t.string :title
      t.text :body
      t.boolean :draft
      t.datetime :published_at
      t.timestamps
    end

    add_index :blog_posts, :id

    create_table :blog_comments, :id => true do |t|
      t.integer :blog_post_id
      t.boolean :spam
      t.string :name
      t.string :email
      t.text :body
      t.string :state
      t.timestamps
    end

    add_index :blog_comments, :id

    create_table :blog_categories, :id => true do |t|
      t.string :title
      t.timestamps
    end

    add_index :blog_categories, :id

    create_table :blog_categories_blog_posts, :id => false do |t|
      t.integer :blog_category_id
      t.integer :blog_post_id
    end

    create_table :galleries do |t|
      t.string :name
      t.text   :body
      t.integer :position

      t.timestamps
    end

    add_index :galleries, :id

    create_table :gallery_entries do |t|
      t.string  :name
      t.text    :body
      t.integer :image_id
      t.integer :position
      t.integer :gallery_id
      t.integer :entry_type, :default => 0
      t.timestamps
    end

    add_index :gallery_entries, :id


  end  # up
  
# *****************************************************************************

  def self.down
     drop_table ::Inquiry.table_name
     # todo: remove at 1.0
     drop_table ::InquirySetting.table_name
     
     ::Page.delete_all({
       :link_url => ("/contact" || "/contact/thank_you")
     }) if defined?(::Page)

    UserPlugin.destroy_all({:name => "refinerycms_news"})

    drop_table :news_items

    UserPlugin.destroy_all({:name => "refinerycms_blog"})

    drop_table :blog_posts
    drop_table :blog_comments
    drop_table :blog_categories
    drop_table :blog_categories_blog_posts

    UserPlugin.destroy_all({:name => "galleries"})

    drop_table :galleries
    drop_table :gallery_entries

  end  #  down
  
end
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110207230042) do

  create_table "blog_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_categories", ["id"], :name => "index_blog_categories_on_id"

  create_table "blog_categories_blog_posts", :id => false, :force => true do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
  end

  create_table "blog_comments", :force => true do |t|
    t.integer  "blog_post_id"
    t.boolean  "spam"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_comments", ["id"], :name => "index_blog_comments_on_id"

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_posts", ["id"], :name => "index_blog_posts_on_id"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["id"], :name => "index_galleries_on_id"

  create_table "gallery_entries", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "image_id"
    t.integer  "position"
    t.integer  "gallery_id"
    t.integer  "entry_type", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_entries", ["id"], :name => "index_gallery_entries_on_id"

  create_table "image_pages", :id => false, :force => true do |t|
    t.integer "image_id"
    t.integer "page_id"
    t.integer "position"
    t.text    "caption"
  end

  add_index "image_pages", ["image_id"], :name => "index_image_pages_on_image_id"
  add_index "image_pages", ["page_id"], :name => "index_image_pages_on_page_id"

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "spam",       :default => false
  end

  create_table "inquiry_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_item_translations", :force => true do |t|
    t.integer  "news_item_id"
    t.string   "locale"
    t.string   "external_url"
    t.text     "body"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_item_translations", ["news_item_id"], :name => "index_news_item_translations_on_news_item_id"

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.string   "external_url"
  end

  add_index "news_items", ["id"], :name => "index_news_items_on_id"

  create_table "page_part_translations", :force => true do |t|
    t.integer  "page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_part_translations", ["page_part_id"], :name => "index_page_part_translations_on_page_part_id"

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta_description"
    t.string   "browser_title"
    t.string   "meta_keywords"
  end

  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "user_plugins", ["name"], :name => "index_user_plugins_on_title"
  add_index "user_plugins", ["user_id", "name"], :name => "index_unique_user_plugins", :unique => true

end

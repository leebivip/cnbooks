class SeedPageTranslations < ActiveRecord::Migration
  def self.up
    load(Rails.root.join('db', 'seeds', 'pages_for_inquiries.rb').to_s)
    load(Rails.root.join('db', 'seeds', 'galleries.rb'))
    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
    load(Rails.root.join('db', 'seeds', 'refinerycms_blog.rb').to_s)
  end

  def self.down
     Page.delete_all({:link_url => ("/contact" || "/contact/thank_you")})
     Page.delete_all({:link_url => "/galleries"})
     Page.delete_all({:link_url => "/news"})
     Page.delete_all({:link_url => "/blog"})
  end
end
class TranslateCustomTitleOnPages < ActiveRecord::Migration
  def self.up
    unless ::Page.translation_class.column_names.map(&:to_sym).include?(:custom_title)
      add_column ::Page.translation_class.table_name, :custom_title, :string

      say_with_time("Re-save custom_title") do
        ::Page.all.each do |page|
          say "updating custom_title field for page##{page.id} using: #{page.untranslated_attributes['custom_title'] || '**nil**'}"
          page.update_attribute(:custom_title, page.untranslated_attributes['custom_title'])
        end
      end
    else
      say "Nothing done, ::Page.translation_class table already includes a custom_title field"
    end

    ::Page.translation_class.reset_column_information
  end

  def self.down
    say_with_time("Re-save custom_title") do
      ::Page.all.each do |page|
        if page.attributes['custom_title'].nil?
          say "Nothing done, page##{page.id} custom_title field is nil"
        else
          say "updating custom_title field for page #{page.id}"
          ::Page.update_all({
            :custom_title => page.attributes['custom_title']
          }, {
            :id => page.id.to_s
          })
        end
      end
    end

    remove_column ::Page.translation_class.table_name, :custom_title

    ::Page.translated_attribute_names.delete(:custom_title)

    ::Page.translation_class.reset_column_information
  end
end
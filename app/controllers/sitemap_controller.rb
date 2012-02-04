class SitemapController < ApplicationController   #::Refinery::FastController

  # layout nil

  def index
    @pages = Page.where(:parent_id => nil).all
    @locales = if ::Refinery.i18n_enabled?
                 ::Refinery::I18n.frontend_locales
               else
                 [::I18n.locale]
               end

    respond_to do |format|

      format.html do
        # render :layout => 'application'
      end  # html format

      format.xml do
        headers['Content-Type'] = 'application/xml'
      end  # xml format

    end  # all formats
  end

end

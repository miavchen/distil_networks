
require 'page_handlers/default'

module AutomationFramework
  class AnonymousPage < BasicPageHandler
    def self.can_handle?(page)
      super(page,"")
    end

    def search
      {:name => 'q'}
    end

    def search_form
      {:class => 'search-form'}
    end

    def shopify_cookie
      '_shopify_s'
    end
  end
end

require 'page_handlers/default'

module AutomationFramework
  class SearchPage < BasicPageHandler
    def self.can_handle?(page)
      uri = URI.parse(page.current_url)
      uri.host =~ /\.swedishfurnitureparts\.com$/ and
          uri.path =~ /\/search/
    end

    def search_results
      {:class => 'item'}
    end

    def product
      {:css => 'ul.search-results a[href$="/products/ikea-cam-lock-nut-103114"]'}
    end
  end
end

require 'page_handlers/default'

module AutomationFramework
  class ProductsPage < BasicPageHandler
    def self.can_handle?(page)
      uri = URI.parse(page.current_url)
      uri.host =~ /\.swedishfurnitureparts\.com$/ and
          uri.path =~ /\/products/
    end

    def add_to_cart
      {:name => 'add'}
    end
  end
end

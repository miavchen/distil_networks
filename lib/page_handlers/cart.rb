require 'page_handlers/default'

module AutomationFramework
  class CartPage < BasicPageHandler
    def self.can_handle?(page)
      uri = URI.parse(page.current_url)
      uri.host =~ /\.swedishfurnitureparts\.com$/ and
          uri.path =~ /\/cart/
    end

    def quantity
      {:name => 'updates[399596849]'}
    end

    def update_cart
      {:id => 'update-cart'}
    end

    def checkout
      {:id => 'checkout'}
    end
  end
end

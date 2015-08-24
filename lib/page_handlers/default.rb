module AutomationFramework
	class PageHandler
 		def self.can_handle?(page)
			return true
 		end

 		def initialize(page, logger = LogFacade.new)
			@page = page
			@logger = logger
 		end
 	end

 	class HeaderlessPageHandler < PageHandler
 		def self.can_handle?(page, handle = nil)
			uri = URI.parse(page.current_url)
			uri.host =~ /\.swedishfurnitureparts\.com$/ and (handle == nil or uri.path == "/#{handle}")
		end

 		def initialize(page, logger = LogFacade.new)
 			super(page, logger)
		end
 	end

	class BasicPageHandler < HeaderlessPageHandler

 		def initialize(page, logger = LogFacade.new)
			super(page, logger)
    end
  end
end


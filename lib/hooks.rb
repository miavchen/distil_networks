

require 'rubygems'
require 'selenium-webdriver'
require 'helper'
require 'observer'
require 'test/unit/assertions'
include Test::Unit::Assertions
module AutomationFramework

  class TestEngine
    attr_accessor :browser
    def initialize(*args)
      @connection=args[0]
      @connection[:url] = get_url(@connection[:env])
      @log=Logger.new(STDOUT)
      @log.warn(@connection)
      init_browser
      init_handlers
    end
    def get_url(env)
      if env == "production"
        url = "http://www.swedishfurnitureparts.com"
      end
    end
    def init_browser
      @browser = Selenium::WebDriver.for :firefox
    end
    private :init_browser
    def init_handlers
      @page_handlers = page_handlers
      @log.debug("Loaded #{@page_handlers.size} page handlers")
    end
    private :init_handlers
    def get_handler
      handler_class = @page_handlers.detect{|h| h.can_handle?(@browser)}
      @log.debug("Using page handler #{handler_class}")
      handler_class.send(:new, @browser, @log)
    end

    def page_handlers
      all_handlers = ObjectSpace.enum_for(:each_object,
                                          class << PageHandler
                                            self
                                          end).to_a - [ BasicPageHandler, HeaderlessPageHandler, PageHandler ]
      all_handlers.push BasicPageHandler
      all_handlers.push HeaderlessPageHandler
      all_handlers.push PageHandler
      all_handlers
    end
    private :page_handlers
    alias :pre_taf_method_missing :method_missing
    def method_missing(m, *args, &block)
      @handler = get_handler # unless @handler

      if @handler.respond_to? m
        @log.debug("Delegating '#{m}' to the page handler")
        @handler.send(m, *args, &block)
      elsif @browser.respond_to? m
        @log.debug("Delegating '#{m}' to the browser object")
        @browser.send(m, *args, &block)
      else
        @log.error("Unknown method #{m} cannot be handled by TestEngine")
      end
    end

    #Overrwrite some of the methods to be send to selenium

    def open(url)
      @browser.navigate.to "#{url}"
    end

    def click(identifier)
      @browser.find_element(identifier.keys[0], identifier.values[0]).click
    end

    def type(identifier, text)
      @browser.find_element(identifier.keys[0], identifier.values[0]).send_keys "#{text}"
    end

    def submit(identifier)
      @browser.find_element(identifier.keys[0], identifier.values[0]).submit
    end

    def maximize
      @browser.manage.window.maximize
    end

    def get_count(identifier)
      count = @browser.find_elements(identifier.keys[0], identifier.values[0]).count
      return count
    end

    def clear_text(identifier)
      @browser.find_element(identifier.keys[0], identifier.values[0]).clear
    end

  end

end



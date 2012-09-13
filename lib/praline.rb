require 'selenium-webdriver'

module Praline
    def self.browser
        if @browser.nil?
            @browser = Selenium::WebDriver.for(:firefox)
        end
        
        @browser
    end
    
    def self.kill_browser
        if not @browser.nil?
            @browser.quit
            @browser = nil
        end
    end
    
    def open(url)
        Praline::browser.get(url)
    end
    
    def input(name, value)
        Praline::browser.find_element(:name, name).send_keys(value)
    end
    
    def title
        Praline::browser.title
    end
    
    def h1
        Praline::browser.find_element(:xpath, "//h1")
    end
    
    def options(select_name)
        select = Praline::browser.find_element(:name, select_name)
        options = select.find_elements(:tag_name, 'option')
        options.map {|option| option.text }
    end
    
    def follow(link_text)
        Praline::browser.find_element(:link, link_text).click
    end
    
    def submit(form_name)
        Praline::browser.find_element(:name, form_name).submit
    end
    
    def kill_browser
        Praline::kill_browser
    end
end
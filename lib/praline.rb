# Copyright (c) 2012 Antoine d'Otreppe <a.dotreppe@aspyct.org>
# (short -> that's the MIT license)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'selenium-webdriver'

# @author Antoine d'Otreppe
module Praline
    # Load the given URL in the browser
    # @param [String] url the url to open
    def open(url)
        Praline::browser.get(url)
    end
    
    # Fill an input with the given text.
    # Also works with <select> and checkbox elements
    # @param [String] name the html name attribute of the target input
    # @param [String] value the text to be put
    def input(name, value)
        Praline::browser.find_element(:name, name).send_keys(value)
    end
    
    # Get the current page title
    # @return [String] the contents of the <title> tag of the current page
    def title
        Praline::browser.title
    end
    
    # Get the text of the <h1> of the current page.
    # Will fail if there are several such tags
    # @return [String] the text of the single <h1> tag of the current page
    def h1
        Praline::browser.find_element(:xpath, "//h1")
    end
    
    # Get the options' text from a specified select
    # @param [String] select_name name of the select you want to poll
    # @return [Array] array of the text values of the options in this select
    def options(select_name)
        select = Praline::browser.find_element(:name, select_name)
        options = select.find_elements(:tag_name, 'option')
        options.map {|option| option.text }
    end
    
    # Follow the specified link
    # @param [String] link_text the text of the link to follow
    def follow(link_text)
        Praline::browser.find_element(:link, link_text).click
    end
    
    # Submit the specified form
    # @param [String] form_name the html name of the form to submit
    def submit(form_name)
        Praline::browser.find_element(:name, form_name).submit
    end
    
    # Get the WebDriver itself, for in-depth manipulation
    # @return [Selenium::WebDriver::Driver] the driver
    def browser
        Praline::browser
    end
    
    # Kill the browser.
    # Call this when you are done with your script
    def kill_browser
        Praline::kill_browser
    end
    
    private
    
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
end
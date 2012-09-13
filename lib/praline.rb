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
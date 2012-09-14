Praliné
=======

Why use it?
-----------

If you ever developed a web application, or any website actually, you know how tedious it is to test it again and again each time you do a simple modification.

Automated testing is here to help. Along with the unit tests, you can set up functional testing. The goal is to replace your actions on a webpage or form by a script. Faster, better, less boring, you will definitely love it!

Since you're here, you probably heard about selenium before, and more specifically of `selenium-webdriver`. Praliné does not attempt to replace it. Praliné is an attempt to bring the selenium-webdriver API to the human-friendliness of `rspec`.

So, using Praliné, you can express test cases in a near-english language. Fill forms, submit them, check the title and contents of pages. Automate your tests now, you'll love it!

Documentation
-------------

See here for now: http://rubydoc.info/gems/praline/frames

Quick start
-----------

Start by installing the [Praliné gem from rubygems](https://rubygems.org/gems/praline).

```bash
gem install praline
```

Now create an rspec file with your favorite editor. Have a look at the example below for directions. For more examples, have a look at the [demo files in the git repository](https://github.com/aspyct/praline/tree/master/demo).

```ruby
require 'praline'
include Praline

home = 'http://nakedman.aspyct.org'

describe "naked_man" do
    describe "Search feature" do
        it "accepts input like '<section> <page>'" do
            open home
            input :q, "2 read"
            submit :search_form
            title.should match /read\(2\)/
        end
    end
    
    describe "Home page" do
        it "allows the selection between linux and darwin" do
            open home
            oses = options :os
            oses.should have(2).things
            oses.should include "darwin"
            oses.should include "linux"
        end
    end
     
    after(:all) do
        kill_browser
    end
end
```

License
-------

That's MIT, meaning you can use this for commercial works. But please be kind and mention me :)

Contact
-------

The name's Antoine d'Otreppe
- a.dotreppe@aspyct.org
- [@aspyct](https://twitter.com/aspyct) on twitter
- http://aspyct.org



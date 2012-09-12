require 'webmate'
include WebMate

home = 'http://nakedman.aspyct.org'

describe "naked_man" do
    describe "Search feature" do
        it "accepts input like '<section> <page>'" do
            open home
            input :q, "2 read"
            submit :search_form
            title.should match /read\(2\)/
        end
        
        it "accepts input like '<page> <section>'" do
            open home
            input :q, "read 2"
            submit :search_form
            title.should match /read\(2\)/
        end
        
        it "accepts input like '<page>(<section>)'" do
            open home
            input :q, "read(2)"
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

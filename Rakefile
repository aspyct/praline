gem_name = "praline"

desc "Build the gem"
task :build => [:dependent, :tasks] do
    
end

desc "Install the gem locally"
task :install => [:build] do
    system "rvm do all gem install #{gem_name}"
end

desc "Push the gem to rubygems.org"
task :push => [:build] do
    
end

desc "Build the documentation"
task :doc do
    
end

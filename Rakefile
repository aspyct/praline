gem_name = "praline"
gemspec = "#{gem_name}.gemspec"

desc "Build the gem"
task :build do
    system "gem build #{gemspec}"
end

desc "Install the gem locally"
task :install => [:build] do
    system "rvm all do gem install #{gem_name}"
end

desc "Build the documentation"
task :doc do
    
end

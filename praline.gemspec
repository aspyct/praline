Gem::Specification.new do |s|
    s.name = 'praline'
    s.version = '0.1.3'
    s.date = '2012-09-14'
    s.summary = 'Web functional testing tools for rspec'
    s.description = 'Praliné is a functional web testing tool built to work with rspec. It uses selenium-webdriver to command a browser and execute your test scenarios written in a human friendly language.'
    s.authors = ["Antoine d'Otreppe"]
    s.email = 'a.dotreppe@aspyct.org'
    s.files = ['lib/praline.rb']
    s.homepage = 'https://github.com/aspyct/praline'
    s.add_runtime_dependency 'selenium-webdriver', '~> 2.25.0'
    s.license = 'MIT'
end
DAISY_DATE_GEMSPEC = Gem::Specification.new do |s|
  s.name = 'daisy_date'
  s.version = '1.0.0'
  s.platform = Gem::Platform::RUBY
  s.summary = "Daisy style month/day/year date parsing for ruby 1.9"
  s.description = s.summary
  s.author = "Jeremy Evans && Desmond Bowe && Steve Ellis && Joe Moore && James Somers"
  s.email = "daisybill@googlegroups.com"
  s.homepage = "https://github.com/pivotal-toadstool/daisy_date"
  s.files = %w(MIT-LICENSE CHANGELOG README.rdoc Rakefile) + Dir["{spec,lib}/**/*.rb"]
end

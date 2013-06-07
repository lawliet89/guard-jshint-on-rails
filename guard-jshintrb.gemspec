# -*- encoding: utf-8 -*-s

Gem::Specification.new do |s|
  s.name        = "guard-jshintrb"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yong Wen Chua", "Johnson Liang", "Andrew Liu", "Ryan Sonnek"]
  s.email       = ["johnsonliang7@gmail.com", "ryan@codecrate.com"]
  s.homepage    = "https://github.com/lawliet89/guard-jshintrb"
  s.summary     = %q{Guard Javascript changes to ensure JSHint complience}
  s.description = %q{Guard Javascript changes, ensuring JSHint complience}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard', '>= 1.0.0'
  s.add_dependency 'jshintrb', '>= 0.2.4'
end

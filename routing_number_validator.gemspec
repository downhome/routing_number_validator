# coding: utf-8
Gem::Specification.new do |s|
  s.name          = "routing_number_validator"
  s.version       = "0.1.3"
  s.authors       = ["Maher Hawash"]
  s.email         = ["gmhawash@gmail.com"]

  s.summary       = "bank routing number validation"
  s.description   = "bank routing number validation"
  s.homepage      = %q{https://github.com/tippenein/routing_number_validator}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency("rspec", ">= 0")
  s.add_dependency("activemodel", ">= 0")

end

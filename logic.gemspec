require 'rake'

Gem::Specification.new do |s|
  s.name = 'logic'
  s.version = '0.1.2'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Bryan Ash']
  s.description = %q{Produces truth table and MC/DC test case pairs from parsed logic statement}
  s.email = %q{}
  s.bindir = 'bin'
  s.executables = ['logic']
  s.extra_rdoc_files = [ "LICENSE", "README.rdoc" ]
  s.files = FileList['lib/**/*', 'bin/*', '[A-Z].*', 'feature/**/*', 'spec/**/*'].to_a
  s.rdoc_options = ["--charset=UTF-8"]
  s.summary = %q{Taking the pain out of MC/DC testing}

  if s.respond_to? :specification_version then
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treetop>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<polyglot>, [">= 0.2.9"])
    else
      s.add_dependency(%q<treetop>, [">= 1.4.2"])
      s.add_dependency(%q<polyglot>, [">= 0.2.9"])
    end
  else
    s.add_dependency(%q<treetop>, [">= 1.4.2"])
    s.add_dependency(%q<polyglot>, [">= 0.2.9"])
  end
end

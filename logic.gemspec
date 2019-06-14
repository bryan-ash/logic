Gem::Specification.new do |s|
  s.name = 'logic'
  s.version = '0.1.5'

  s.required_rubygems_version = '>= 1.3.6'
  s.authors = ['Bryan Ash']
  s.description = 'Produces truth table and MC/DC test case pairs from parsed logic statement'
  s.email = 'bryan.a.ash@gmail.com'
  s.bindir = 'bin'
  s.executables = ['logic']
  s.extra_rdoc_files = [ 'LICENSE', 'README.rdoc' ]
  s.files = Dir.glob(['lib/**/*', 'bin/*', '[A-Z].*', 'spec/**/*'])
  s.rdoc_options = ['--charset=UTF-8']
  s.summary = %q{Taking the pain out of MC/DC testing}
  s.license = 'MIT'

  s.add_runtime_dependency 'treetop', '~> 1.6'

  s.add_development_dependency 'aruba', '~> 0.14'
  s.add_development_dependency 'rspec', '~> 3.5'
end

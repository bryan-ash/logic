Gem::Specification.new do |s|
  s.name = %q{logic}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryan Ash"]
  s.date = %q{2010-03-18}
  s.default_executable = %q{logic}
  s.description = %q{Produces truth table and MC/DC test case pairs from parsed logic statement}
  s.email = %q{}
  s.executables = ["logic"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "bin",
    "bin/logic",
    "features",
    "features/mcdc_pairs.feature",
    "features/step_definitions",
    "features/step_definitions/logic_testing_steps.rb",
    "features/support",
    "features/support/env.rb",
    "features/truth_table.feature",
    "lib",
    "lib/integer.rb",
    "lib/logic.rb",
    "lib/logic_operations.rb",
    "lib/logic_parser.treetop",
    "lib/test_case.rb",
    "lib/truth_table.rb",
    "LICENSE",
    "README.rdoc",
    "spec",
    "spec/logic_parser_spec.rb",
    "spec/spec.opts",
    "spec/truth_table_spec.rb"
  ]
  s.homepage = %q{http://github.com/bryan-ash/logic}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{0.0.1}
  s.summary = %q{Taking the pain out of MC/DC testing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

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

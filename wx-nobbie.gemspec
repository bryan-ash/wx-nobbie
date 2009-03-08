# -*- ruby -*-

Gem::Specification.new do |s|
  s.name = %q{wx-nobbie}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Alton", "Bryan Ash"]
  s.date = %q{2009-02-08}
  s.description = %q{wx-Nobbie is a simple interface for driving wxRuby application development.}
  s.email = %q{bryan.a.ash@gmail.com}
  s.files =
    [ "KNOWN_ISSUES",
      "Rakefile",
      "README.rdoc",
      "lib/nobbie/wx.rb",
      "lib/nobbie/wx/application_launcher.rb",
      "lib/nobbie/wx/command.rb",
      "lib/nobbie/wx/command_factory.rb",
      "lib/nobbie/wx/operations.rb",
      "lib/nobbie/wx/platform.rb",
      "lib/nobbie/wx/command/choose.rb",
      "lib/nobbie/wx/command/click_on.rb",
      "lib/nobbie/wx/command/console_reporter.rb",
      "lib/nobbie/wx/command/executor.rb",
      "lib/nobbie/wx/command/get_component.rb",
      "lib/nobbie/wx/command/get_options.rb",
      "lib/nobbie/wx/command/get_selected_values.rb",
      "lib/nobbie/wx/command/is_chosen.rb",
      "lib/nobbie/wx/command/is_enabled.rb",
      "lib/nobbie/wx/command/reporter.rb",
      "lib/nobbie/wx/command/select.rb",
      "lib/nobbie/wx/command/type_into.rb",
      "lib/nobbie/wx/impl/element/element_path_builder.rb",
      "features/step_definitions",
      "features/support",
      "features/acceptance_test.feature",
      "features/step_definitions/acceptance_test_steps.rb",
      "features/support/env.rb",
      "spec/application_launcher_spec.rb",
      "spec/console_reporter_spec.rb",
      "spec/executor_spec.rb",
      "spec/platform_spec.rb",
      "spec/reporter_spec.rb",
      "spec/spec.opts",
      "spec/spec_helper.rb",
      "test/all_tests.rb",
      "test/suite/example_app.rb",
      "test/suite/nobbie_test_case.rb",
      "test/suite/test_choose.rb",
      "test/suite/test_click.rb",
      "test/suite/test_enabled.rb",
      "test/suite/test_launcher.rb",
      "test/suite/test_operations.rb",
      "test/suite/test_selection.rb",
      "test/suite/test_type.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bryan-ash/wx-nobbie}
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{wxextras}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{wx-Nobbie is a simple interface for driving wxRuby application development.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<wxruby>, [">= 1.9.9"])
      s.add_runtime_dependency(%q<wx_sugar>, [">= 0.1.21"])
    else
      s.add_dependency(%q<wxruby>, [">= 1.9.9"])
      s.add_dependency(%q<wx_sugar>, [">= 0.1.21"])
    end
  else
    s.add_dependency(%q<wxruby>, [">= 1.9.9"])
    s.add_dependency(%q<wx_sugar>, [">= 0.1.21"])
  end
end

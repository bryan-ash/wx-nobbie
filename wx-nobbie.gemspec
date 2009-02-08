# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wx-nobbie}
  s.version = "0.0.3"

  s.authors = ["Paul Alton", "Bryan Ash"]
  s.date = %q{2009-02-08}
  s.description = %q{wx-Nobbie is a simple interface for driving wxRuby application development.}
  s.email = %q{bryan.a.ash@gmail.com}
  s.files = ["KNOWN_ISSUES", "README", "lib/nobbie/wx/acceptance_test.rb", "lib/nobbie/wx/command.rb", "lib/nobbie/wx/command_executor.rb", "lib/nobbie/wx/command_factory.rb", "lib/nobbie/wx/driven.rb", "lib/nobbie/wx/launcher.rb", "lib/nobbie/wx/operations.rb", "lib/nobbie/wx/platform.rb", "lib/nobbie/wx/command/choose.rb", "lib/nobbie/wx/command/click_on.rb", "lib/nobbie/wx/command/get_component.rb", "lib/nobbie/wx/command/get_options.rb", "lib/nobbie/wx/command/get_selected_values", "lib/nobbie/wx/command/is_chosen.rb", "lib/nobbie/wx/command/is_enabled.rb", "lib/nobbie/wx/command/select.rb", "lib/nobbie/wx/command/type_into.rb", "lib/nobbie/wx/impl/element/element_path_builder.rb", "lib/nobbie/wx/impl/operation/choosable.rb", "lib/nobbie/wx/impl/operation/select.rb", "test/all_tests.rb", "test/suite/app.rb", "test/suite/nobbie_test_case.rb", "test/suite/test_choose.rb", "test/suite/test_click.rb", "test/suite/test_enabled.rb", "test/suite/test_launcher.rb", "test/suite/test_operations.rb", "test/suite/test_selection.rb", "test/suite/test_type.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bryan-ash/wx-nobbie}
  s.rdoc_options = ["--main", "README.txt", "--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
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

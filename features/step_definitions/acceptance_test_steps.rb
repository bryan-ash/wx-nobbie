Given /^a test application exists$/ do
  @app = ExampleApp.new
end

When /^a Nobbie acceptance test is run on the application$/ do
  Nobbie::Wx::ApplicationLauncher.new(@app).run
end

Then /^the application is running$/ do
  @app.is_main_loop_running.should be_true
end

Given /^a test application exists$/ do
  @app = ExampleApp.new
end

When /^a Nobbie acceptance test is started on the application$/ do
  Nobbie::Wx::ApplicationLauncher.new(@app).start
end

Then /^the application is running$/ do
  @app.is_main_loop_running.should be_true
end

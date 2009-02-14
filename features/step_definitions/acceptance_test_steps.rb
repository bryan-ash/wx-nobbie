Given /^an* (.*) application is running$/ do |app_class|
  Given "an #{app_class} application exists"
  And   "a Nobbie acceptance test is run on the application"
end

Given /^an* (.*) application exists$/ do |app_class|
  @app = Object.const_get(app_class).new
end

When /^a Nobbie acceptance test is run on the application$/ do
  Nobbie::Wx::ApplicationLauncher.new(@app).run
end

Then /^the application is running$/ do
  @app.is_main_loop_running.should be_true
end

Then /^"(.*)" is chosen$/ do |item|
  choosable(item).should be_chosen
end

Then /^"(.*)" is not chosen$/ do |item|
  choosable(item).should_not be_chosen
end

When /^I choose "(.*)"$/ do |item|
  choosable(item).choose
end


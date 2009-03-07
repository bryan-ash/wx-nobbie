def execute_and_catch_exception
  @raised_exception = nil
  begin
    yield
  rescue StandardError => exception
    @raised_exception = exception
  end
end

When /^I choose "(.*)"$/ do |item|
  execute_and_catch_exception { choosable(item).choose }
end

When /^I type "(.*)" into "(.*)"$/ do |value, item|
  execute_and_catch_exception { type value, :in => item }
end

When /^I click on "(.*)"$/ do |item|
  execute_and_catch_exception { click item }
end

When /^I use an invalid path$/ do 
  execute_and_catch_exception { click ["Array is not a valid path"] }
end

When /^I select "(.*)" on the "(.*)"$/ do |value, selectable|
  execute_and_catch_exception { selection(:in => selectable).choose value }
end

Then /^I should see "(.*)" in "(.*)"$/ do |value, item|
  text(item).should == value
end

Then /^the application is running$/ do
  @app.is_main_loop_running.should be_true
end

Then /^"(.*)" is chosen$/ do |item|
  execute_and_catch_exception { choosable(item).should be_chosen }
end

Then /^"(.*)" is not chosen$/ do |item|
  choosable(item).should_not be_chosen
end

Then /^"(.*)" on the "(.*)" should be selected$/ do |value, selectable|
  execute_and_catch_exception { selection(:in => selectable).selected_value.should == value }
end

Then /^"(.*)" includes "(.*)"$/ do |selectable, value|
  execute_and_catch_exception { selection(:in => selectable).options.should include(value) }
end

Then /^"(.*)" is enabled$/ do |item|
  enabled?(item).should be_true
end

Then /^"(.*)" is not enabled$/ do |item|
  enabled?(item).should_not be_true
end

Then /^I expect an exception with the message "(.*)"$/ do |message|
  @raised_exception.to_s.should =~ Regexp.new(message)
end

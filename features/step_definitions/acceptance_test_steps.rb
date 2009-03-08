def execute_and_catch_exception
  @raised_exception = nil
  begin
    yield
  rescue StandardError => exception
    @raised_exception = exception
  end
end

When /^I choose "(.*)"$/ do |item|
  execute_and_catch_exception { choose item }
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
  execute_and_catch_exception { select value, :in => selectable }
end

Then /^I should see "(.*)" in "(.*)"$/ do |value, item|
  text(item).should == value
end

Then /^"(.*)" is chosen$/ do |item|
  execute_and_catch_exception { chosen?(item).should be_true }
end

Then /^"(.*)" is not chosen$/ do |item|
  chosen?(item).should be_false
end

Then /^"(.*)" on the "(.*)" should be selected$/ do |value, selectable|
  execute_and_catch_exception { selected_value(:in => selectable).should == value }
end

Then /^"(.*)" includes "(.*)"$/ do |selectable, value|
  execute_and_catch_exception { options(:in => selectable).should include(value) }
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

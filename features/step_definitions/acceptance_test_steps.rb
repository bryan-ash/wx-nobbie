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


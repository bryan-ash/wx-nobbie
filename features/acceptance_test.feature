In order to test drive a WxRuby application
As a developer
I want Nobbie to provide acceptance test access to the application

  Scenario: An example application is provided
    Given an ExampleApp application is running
    Then "radio_button" is not chosen
    When I choose "radio_button"
    Then "radio_button" is chosen

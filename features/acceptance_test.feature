In order to test drive a WxRuby application
As a developer
I want Nobbie to provide acceptance test access to the application

Scenario: An application is provided
  Given a test application exists
  When a Nobbie acceptance test is run on the application
  Then the application is running

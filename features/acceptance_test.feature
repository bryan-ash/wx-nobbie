In order to test drive a WxRuby application
As a developer
I want Nobbie to provide acceptance test access to the application

  Scenario: Choosing a radio button
    Then "radio_button" is not chosen
    When I choose "radio_button"
    Then "radio_button" is chosen

  Scenario: Choosing a check box
    Then "check_box" is not chosen
    When I choose "check_box"
    Then "check_box" is chosen

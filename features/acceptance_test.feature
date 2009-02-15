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

  Scenario: Type into a text control
    When I type "123" into "text_ctrl"
    Then I should see "123" in "text_ctrl"

  Scenario: Type into a combo box
    When I type "456" into "combo_box"
    Then I should see "456" in "combo_box"

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

  Scenario: Click on a button
    When I click on "button"

  Scenario Outline: Working with selectables
    Given "<selectable>" includes "<value>"
    When I select "<value>" on the "<selectable>"
    Then "<value>" on the "<selectable>" should be selected

  Examples:
    | selectable           | value          |
    | combo_box_with_items | combo_box_item |
    | list_box_with_items  | list_box_item  |
    | test_notebook        | click          |

  Scenario: Enabled controls
    Then "text_ctrl" is enabled
    Then "disabled_text_ctrl" is not enabled

  Scenario: Working with menus
    When I select "&New..." on the "&File"


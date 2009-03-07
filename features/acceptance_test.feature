In order to test drive a WxRuby application
As a developer
I want Nobbie to provide acceptance test access to the application

  Scenario Outline: Choosing things
    Given "<control>" is not chosen
    When  I choose "<control>"
    Then  "<control>" is chosen

  Examples: 
    | control      |
    | check_box    |
    | radio_button |


  Scenario Outline: Things that can't be chosen
    When I choose "<control>"
    Then I expect an exception with the message "cannot: Choose '<control>'"
    When "<control>" is chosen
    Then I expect an exception with the message "cannot: Is chosen '<control>'"
    
  Examples:
    | control   |
    | button    |
    | combo_box |
    | text_ctrl |


  Scenario Outline: Typing into things
    When I type "<something>" into "<control>"
    Then I should see "<something>" in "<control>"

  Examples:
    | something | control   |
    | 123       | combo_box |
    | 456       | text_ctrl |


  Scenario Outline: Things that can't be typed into
    When I type "<something>" into "<control>"
    Then I expect an exception with the message "cannot: Type '<something>' into '<control>'"

  Examples:
    | something | control       |
    | 123       | button        |
    | 456       | check_box     |
    | 789       | radio_button  |
    | 012       | test_notebook |


  Scenario: Click on a button
    When I click on "button"


  Scenario: Invalid path format
    When I use an invalid path
    Then I expect an exception with the message "Unable to coerce path"


  Scenario Outline: Things that can't be clicked
    When I click on "<control>"
    Then I expect an exception with the message "cannot: Click on '<control>'"

  Examples:
    | control       |
    | combo_box     |
    | text_ctrl     |
    | test_notebook |


  Scenario Outline: Selecting things
    Given "<selectable>" includes "<value>"
    When I select "<value>" on the "<selectable>"
    Then "<value>" on the "<selectable>" should be selected

  Examples:
    | selectable           | value          |
    | combo_box_with_items | combo_box_item |
    | list_box_with_items  | list_box_item  |
    | test_notebook        | click          |
    | &File                | &New...        |


  Scenario Outline: Selecting things that aren't there
    When I select "<value>" on the "<selectable>"
    Then I expect an exception with the message "cannot: Select '<value>' in '<selectable>'"

  Examples:
    | selectable           | value        |
    | combo_box_with_items | Ghost        |
    | list_box_with_items  | Tooth Fairy  |
    | test_notebook        | Easter Bunny |


  Scenario Outline: Things that can't be selected
    Given "<control>" includes "<value>"
    Then I expect an exception with the message "cannot: Get options '<control>'"
    When I select "<value>" on the "<control>"
    Then I expect an exception with the message "cannot: Select '<value>' in '<control>'"
    When "<value>" on the "<control>" should be selected
    Then I expect an exception with the message "cannot: Get selected values '<control>'"

  Examples:
    | value | control      |
    | 123   | button       |
    | 456   | check_box    |
    | 789   | radio_button |


  Scenario: Enabled controls
    Then "text_ctrl" is enabled
    Then "disabled_text_ctrl" is not enabled



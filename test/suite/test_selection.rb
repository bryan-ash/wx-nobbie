class TestSelection < Test::Unit::TestCase
  include NobbieTestCase

  def test_choose_with_notebook_page
    assert_equal 'notebook_page1', selection('notebook').selected_value
    selection('notebook').choose 'notebook_page2'
    assert_equal 'notebook_page2', selection('notebook').selected_value
    #todo: improve event detail
    assert_events 'notebook: '
  end

  def test_choose_with_menu_item
    selection('&File').choose '&New...'
    #todo: improve event detail
    assert_events 'file_new'
  end

  def test_choose_with_combo_box
    assert_equal '', selection('combo_box_with_items').selected_value
    selection('combo_box_with_items').choose 'combo_box_item'
    assert_equal 'combo_box_item', selection('combo_box_with_items').selected_value
    assert_events 'combo_box_with_items: '
  end

  def test_choose_with_list_box
    assert_equal '', selection('list_box_with_items').selected_value
    selection('list_box_with_items').choose 'list_box_item'
    assert_equal 'list_box_item', selection('list_box_with_items').selected_value
    assert_events 'list_box_with_items: list_box_item'
  end

  def test_choose_with_choice
    assert_equal '', selection('choice_with_items').selected_value
    selection('choice_with_items').choose 'choice_item'
    assert_equal 'choice_item', selection('choice_with_items').selected_value
    assert_events 'choice_with_items: choice_item'
  end

  def test_options_with_notebook
    assert_equal ['notebook_page1', 'notebook_page2'] , selection('notebook').options
  end

  def test_options_with_combo_box
    assert_equal ["combo_box_item"], selection('combo_box_with_items').options
  end

  def test_options_with_list_box
    assert_equal ["list_box_item"], selection('list_box_with_items').options
  end

  def test_options_with_choice
    assert_equal ["choice_item"], selection('choice_with_items').options
  end

  #todo: options with component not found
  #todo: options with component not supported

  #not found

  def test_choose_with_value_not_found_notebook
    assert_exception ValueNotFoundException do selection('notebook').choose 'missing' end
  end

  def test_choose_with_value_not_found_menu
    assert_exception ValueNotFoundException do selection('&File').choose 'missing' end
  end

  def test_choose_with_value_not_found_list_box
    assert_exception ValueNotFoundException do selection('list_box_with_items').choose 'missing' end
  end

  def test_choose_with_value_not_found_combo_box
    assert_exception ValueNotFoundException do selection('combo_box_with_items').choose 'missing' end
  end

  def test_choose_with_value_not_found_combo_box
    assert_exception ValueNotFoundException do selection('choice_with_items').choose 'missing' end
  end

  #disabled

  def test_choose_with_component_disabled_menu
    assert_exception ComponentDisabledException do selection('&File').choose '&disabled' end
  end
  
  def test_choose_with_component_disabled_notebook
    assert_equal 'disabled_notebook_page1', selection('disabled_notebook').selected_value
    assert_exception ComponentDisabledException do selection('disabled_notebook').choose 'disabled_notebook_page2' end
    assert_equal 'disabled_notebook_page1', selection('disabled_notebook').selected_value
  end

  def test_choose_with_component_disabled_list_box
    assert_exception ComponentDisabledException do selection('disabled_list_box_with_items').choose 'disabled_list_box_item2' end
  end

  def test_choose_with_component_disabled_combo_box
    assert_exception ComponentDisabledException do selection('disabled_combo_box_with_items').choose 'disabled_combo_box_item2' end
  end

  def test_choose_with_component_disabled_choice
    assert_exception ComponentDisabledException do selection('disabled_choice_with_items').choose 'disabled_choice_item2' end
  end

  #not found etc ...

  def test_choose_with_component_not_found
    assert_exception ComponentNotFoundException do selection('missing').choose 'missing' end
  end
  
  def test_choose_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do selection('button').choose 'value' end
  end

  def test_selected_value_unsupported_operation_for_menu
    assert_exception UnsupportedOperationForComponentException do selection('&File').selected_value end
  end

  def test_selected_value_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do selection('button').selected_value end
  end
  
  def test_selected_value_with_component_not_found
    assert_exception ComponentNotFoundException do selection('missing').selected_value end
  end

  def test_options_with_component_not_found
    assert_exception ComponentNotFoundException do selection('missing').options end
  end

  def test_options_unsupported_operation_for_menu
    assert_exception UnsupportedOperationForComponentException do selection('&File').options end
  end

  def test_options_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do selection('button').options end
  end
end


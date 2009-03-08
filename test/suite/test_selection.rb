class TestSelection < Test::Unit::TestCase
  include NobbieTestCase

  def test_choose_with_notebook_page
    assert_equal 'notebook_page1', selected_value('notebook')
    select 'notebook_page2', :in => 'notebook'
    assert_equal 'notebook_page2', selected_value('notebook')
    #todo: improve event detail
    assert_events 'notebook: '
  end

  def test_choose_with_menu_item
    select  '&New...', :in => '&File'
    #todo: improve event detail
    assert_events 'file_new'
  end

  def test_choose_with_combo_box
    assert_equal '', selected_value('combo_box_with_items')
    select 'combo_box_item', :in => 'combo_box_with_items'
    assert_equal 'combo_box_item', selected_value('combo_box_with_items')
    assert_events 'combo_box_with_items: '
  end

  def test_choose_with_list_box
    assert_equal '', selected_value('list_box_with_items')
    select 'list_box_item', :in => 'list_box_with_items'
    assert_equal 'list_box_item', selected_value('list_box_with_items')
    assert_events 'list_box_with_items: list_box_item'
  end

  def test_choose_with_choice
    assert_equal '', selected_value('choice_with_items')
    select 'choice_item', :in => 'choice_with_items'
    assert_equal 'choice_item', selected_value('choice_with_items')
    assert_events 'choice_with_items: choice_item'
  end

  def test_options_with_notebook
    assert_equal ['notebook_page1', 'notebook_page2'] , options('notebook')
  end

  def test_options_with_combo_box
    assert_equal ["combo_box_item"], options('combo_box_with_items')
  end

  def test_options_with_list_box
    assert_equal ["list_box_item"], options('list_box_with_items')
  end

  def test_options_with_choice
    assert_equal ["choice_item"], options('choice_with_items')
  end

  #todo: options with component not found
  #todo: options with component not supported

  #not found

  def test_choose_with_value_not_found_notebook
    assert_exception ValueNotFoundException do select('missing', :in => 'notebook') end
  end

  def test_choose_with_value_not_found_menu
    assert_exception ValueNotFoundException do select('missing', :in => '&File') end
  end

  def test_choose_with_value_not_found_list_box
    assert_exception ValueNotFoundException do select('missing', :in => 'list_box_with_items') end
  end

  def test_choose_with_value_not_found_combo_box
    assert_exception ValueNotFoundException do select('missing', :in => 'combo_box_with_items') end
  end

  def test_choose_with_value_not_found_combo_box
    assert_exception ValueNotFoundException do select('missing', :in => 'choice_with_items') end
  end

  #disabled

  def test_choose_with_component_disabled_menu
    assert_exception ComponentDisabledException do select('&disabled', :in => '&File') end
  end
  
  def test_choose_with_component_disabled_notebook
    assert_equal 'disabled_notebook_page1', selected_value('disabled_notebook')
    assert_exception ComponentDisabledException do select('disabled_notebook_page2', :in => 'disabled_notebook') end
    assert_equal 'disabled_notebook_page1', selected_value('disabled_notebook')
  end

  def test_choose_with_component_disabled_list_box
    assert_exception ComponentDisabledException do select('disabled_list_box_item2', :in => 'disabled_list_box_with_items') end
  end

  def test_choose_with_component_disabled_combo_box
    assert_exception ComponentDisabledException do select('disabled_combo_box_item2', :in => 'disabled_combo_box_with_items')  end
  end

  def test_choose_with_component_disabled_choice
    assert_exception ComponentDisabledException do select('disabled_choice_item2', :in => 'disabled_choice_with_items') end
  end

  #not found etc ...

  def test_choose_with_component_not_found
    assert_exception ComponentNotFoundException do select('missing', :in => 'missing') end
  end
  
  def test_choose_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do select('value', :in => 'button') end
  end

  def test_selected_value_unsupported_operation_for_menu
    assert_exception UnsupportedOperationForComponentException do selected_value('&File') end
  end

  def test_selected_value_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do selected_value('button') end
  end
  
  def test_selected_value_with_component_not_found
    assert_exception ComponentNotFoundException do selected_value('missing') end
  end

  def test_options_with_component_not_found
    assert_exception ComponentNotFoundException do options('missing') end
  end

  def test_options_unsupported_operation_for_menu
    assert_exception UnsupportedOperationForComponentException do options('&File') end
  end

  def test_options_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do options('button') end
  end
end


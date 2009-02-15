class TestType < Test::Unit::TestCase
  include NobbieTestCase

  def test_type_with_text_ctrl
    #todo: this doesnt seem to work in windows or osx .. but it should ... see KNOWN ISSUES
    type '123', :in => 'text_ctrl'
    assert_equal '123', text('text_ctrl')
    assert_events ['text_ctrl: ', 'text_ctrl: 1', 'text_ctrl: 12', 'text_ctrl: 123']
  end

  def test_type_with_combo_box
    #todo: this doesnt seem to work in osx .. but it should ... see KNOWN ISSUES
    assert_equal 'combo_box', text('combo_box')
    type '456', :in => 'combo_box'
    assert_equal '456', text('combo_box')
    assert_events ['combo_box: ', 'combo_box: 4', 'combo_box: 45', 'combo_box: 456']
  end

  def test_type_with_empty_string
    type 'a', :in => 'text_ctrl'
    clear_events
    type '', :in => 'text_ctrl'
    assert_equal '', text('text_ctrl')
    assert_events 'text_ctrl: '
  end

  def test_type_with_readonly_text_ctrl
    assert_exception ComponentReadOnlyException do type 'readonly_text_ctrl_value', :in => 'readonly_text_ctrl' end
    assert_equal 'readonly_text_ctrl', text('readonly_text_ctrl')
  end

  def test_type_with_readonly_combo_box
    #todo: this won't currently work on windows ... see KNOWN ISSUES
    assert_exception ComponentReadOnlyException do type 'readonly_combo_box_value', :in => 'readonly_combo_box' end
    assert_equal 'readonly_combo_box', text('readonly_combo_box')
  end

  def test_type_with_disabled_text_ctrl
    assert_equal 'disabled_text_ctrl', text('disabled_text_ctrl')
    assert_exception ComponentDisabledException do type 'disabled_text_ctrl_value', :in => 'disabled_text_ctrl' end
    assert_equal 'disabled_text_ctrl', text('disabled_text_ctrl')
  end

  def test_type_with_disabled_combo_box
    #todo: this doesnt seem to work in osx .. but it should ... see KNOWN ISSUES
    assert_equal 'disabled_combo_box', text('disabled_combo_box')
    assert_exception ComponentDisabledException do type 'disabled_combo_box_value', :in => 'disabled_combo_box' end
    assert_equal 'disabled_combo_box', text('disabled_combo_box')
  end

  def test_type_with_component_not_found
    assert_exception ComponentNotFoundException do type 'missing_value', :in => 'missing' end
  end

  def test_type_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do type 'button_value', :in => 'button' end
  end
end

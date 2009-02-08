class TestClick < Test::Unit::TestCase
  include NobbieTestCase

  def test_click_with_named_button
    click 'button'
    #todo: improve event detail
    assert_events 'button: '
  end

  def test_click_with_labelled_button
    click 'labelled_button'
    #todo: improve event detail
    assert_events 'labelled_button_name: '
  end

  def test_click_with_component_not_found
    assert_exception ComponentNotFoundException do click 'missing' end
  end
  
  def test_click_with_component_disabled
    assert_exception ComponentDisabledException do click 'disabled_button' end
  end

  def test_click_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do click 'static_text' end
  end
end


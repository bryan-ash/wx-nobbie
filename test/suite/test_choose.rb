class TestChoose < Test::Unit::TestCase
  include NobbieTestCase

  #todo: rename file to choosable
  #todo: should be TestChoosable
  def test_choose_with_radio_button
    assert !chosen?('radio_button')
    choose('radio_button')
    assert chosen?('radio_button')
    assert_events 'radio_button: '
  end

  def test_choose_with_check_box
    assert !chosen?('check_box')
    choose('check_box')
    assert chosen?('check_box')
    assert_events 'check_box: '
  end

  def test_choose_with_component_disabled_radio_button
    assert_exception ComponentDisabledException do choose('disabled_radio_button') end
  end

  def test_choose_with_component_disabled_check_box
    assert_exception ComponentDisabledException do choose('disabled_check_box') end
  end

  def test_choose_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do choose('button') end
  end

  def test_choose_with_component_not_found
    assert_exception ComponentNotFoundException do choose('missing') end
  end

  def test_chosen_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do chosen?('button') end
  end

  def test_chosen_with_component_not_found
    assert_exception ComponentNotFoundException do chosen?('missing') end
  end

  def test_chosen_with_component_disabled_radio_button
    assert !chosen?('disabled_radio_button')
  end

  def test_chosen_with_component_disabled_check_box
    assert !chosen?('disabled_check_box')
  end
end


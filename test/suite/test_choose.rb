class TestChoose < Test::Unit::TestCase
  include NobbieTestCase

  #todo: rename file to choosable
  #todo: should be TestChoosable
  def test_choose_with_radio_button
    assert !choosable('radio_button').chosen?
    choosable('radio_button').choose
    assert choosable('radio_button').chosen?
    assert_events 'radio_button: '
  end

  def test_choose_with_check_box
    assert !choosable('check_box').chosen?
    choosable('check_box').choose
    assert choosable('check_box').chosen?
    assert_events 'check_box: '
  end

  def test_choose_with_component_disabled_radio_button
    assert_exception ComponentDisabledException do choosable('disabled_radio_button').choose end
  end

  def test_choose_with_component_disabled_check_box
    assert_exception ComponentDisabledException do choosable('disabled_check_box').choose end
  end

  def test_choose_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do choosable('button').choose end
  end

  def test_choose_with_component_not_found
    assert_exception ComponentNotFoundException do choosable('missing').choose end
  end

  def test_chosen_with_unsupported_operation_for_component
    assert_exception UnsupportedOperationForComponentException do choosable('button').chosen? end
  end

  def test_chosen_with_component_not_found
    assert_exception ComponentNotFoundException do choosable('missing').chosen? end
  end

  def test_chosen_with_component_disabled_radio_button
    assert !choosable('disabled_radio_button').chosen?
  end

  def test_chosen_with_component_disabled_check_box
    assert !choosable('disabled_check_box').chosen?
  end
end


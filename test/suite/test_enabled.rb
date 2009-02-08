class TestEnabled < Test::Unit::TestCase
  include NobbieTestCase

  def test_enabled
    assert enabled?('text_ctrl')
    assert !enabled?('disabled_text_ctrl')
  end

  def test_enabled_with_component_not_found
    assert_exception ComponentNotFoundException do enabled?('missing') end
  end
end


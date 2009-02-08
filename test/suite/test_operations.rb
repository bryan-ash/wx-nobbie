class UserPathBuilder
  def find_component
    "something"
  end
end

class TestOperations < Test::Unit::TestCase

  def test_coerce_path
    assert_path component('text_ctrl')
    assert_path component(:in => 'text_ctrl')
    assert_path component(in_('text_ctrl'))
    assert_path component(Nobbie::Wx::ElementPathBuilder.new('text_ctrl'))
    assert_path component(UserPathBuilder.new)
    assert_path component(:text_ctrl)
    begin
      component(Hash.new)
      fail
    rescue RuntimeError => e
      assert_equal 'Unable to coerce path: ', e.message
    end
  end
  
  def assert_path(path)
    assert_not_nil path
  end
end

class TestLauncher < Test::Unit::TestCase
  
  def test_application_under_test_is_not_defined
    begin
      Nobbie::Wx::ApplicationLauncher.module_eval('def get_application; raise NameError.new; end;')
      Nobbie::Wx::ApplicationLauncher.new
      fail
    rescue RuntimeError => e
      assert_equal Nobbie::Wx::ApplicationLauncher::AUT_NOT_DEFINED, e.message 
    end
  end

  def test_application_under_test_is_not_a_wx_app
    begin
      Nobbie::Wx::ApplicationLauncher.module_eval('def get_application; String.new; end;')
      Nobbie::Wx::ApplicationLauncher.new
      fail
    rescue RuntimeError => e
      assert_equal Nobbie::Wx::ApplicationLauncher::AUT_NOT_WX_APP, e.message 
    end
  end
end

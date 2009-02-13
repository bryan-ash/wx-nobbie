class TestLauncher < Test::Unit::TestCase

  def test_application_under_test_is_not_a_wx_app
    begin
      Nobbie::Wx::ApplicationLauncher.new("this is not a Wx::App")
      fail
    rescue RuntimeError => e
      assert_equal Nobbie::Wx::ApplicationLauncher::AUT_NOT_WX_APP, e.message
    end
  end

end

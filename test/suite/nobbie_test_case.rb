module NobbieTestCase
  include Nobbie::Wx

  def setup
    begin
      select_tab_for_test
    rescue ValueNotFoundException
      #ok - this test doesn't have its own tab'
    end
  end

  def select_tab_for_test
    clear_events
    tab = self.class.name.gsub('Test', '').downcase
    selection(:in => 'test_notebook').choose tab
    assert_equal tab, selection(:in => 'test_notebook').selected_value
  end

  def text(component)
    component.nil? ? nil : component.value
  end

  def clear_events
    log.clear
  end

  def assert_exception(e)
    assert_raise e do yield end
    assert_events
  end

  def assert_events(expected_items=[])
    expected_items = [expected_items] unless expected_items.is_a?(Array)
    actual_items = text(log).split("\n")
    assert_equal expected_items, actual_items
  end

  def log
    component 'log'
  end
end

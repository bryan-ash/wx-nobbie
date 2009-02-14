require 'rubygems'
require 'wx'
require 'wx_sugar'

include Wx

class TestFrame < Frame
  def initialize(*args)
    super

    #todo: sort out all this :minsize => true stuff out .. need some way to specify defaults

    panel = add(Panel, :proportion => 1)
    panel.arrange_vertically(:padding => 4)

    test_notebook = name('test_notebook', panel.add(Notebook, :minsize => true, :proportion => 2))

    test_notebook.add_page(name('type', test_notebook.add(Panel) {|p| p.arrange_vertically
      evt_text(name('text_ctrl', p.add(TextCtrl[:value => 'text_ctrl'], :minsize => true)), :update)
      evt_text(name('readonly_text_ctrl', p.add(TextCtrl[:value => 'readonly_text_ctrl', :style => TE_READONLY], :minsize => true)), :update)
      evt_text(disable(name('disabled_text_ctrl', p.add(TextCtrl[:value => 'disabled_text_ctrl'], :minsize => true))), :update)

      evt_text(name('combo_box', p.add(ComboBox[:value => 'combo_box'], :minsize => true)), :update)
      readonly_combo_box = name('readonly_combo_box', p.add(ComboBox[:style => CB_READONLY], :minsize => true))
      readonly_combo_box.append('readonly_combo_box')
      readonly_combo_box.selection = 0
      evt_text(readonly_combo_box, :update)
      evt_text(disable(name('disabled_combo_box', p.add(ComboBox[:value => 'disabled_combo_box'], :minsize => true))), :update)
    }), 'type')

    test_notebook.add_page(name('click', test_notebook.add(Panel, :minsize => true) {|p| p.arrange_vertically
      evt_button(name('button', p.add(Button[:label => 'regular_button'], :minsize => true)), :update)
      evt_button(name('labelled_button_name', p.add(Button[:label => 'labelled_button'], :minsize => true)), :update)
      evt_button(disable(name('disabled_button', p.add(Button[:label => 'disabled_button'], :minsize => true))), :update)
      name('static_text', p.add(StaticText[:label => 'static_text'], :minsize => true))
    }), 'click')

    test_notebook.add_page(name('selection', test_notebook.add(Panel) {|p| p.arrange_vertically
      notebook = name('notebook', p.add(Notebook, :minsize => true))
      notebook.add_page(name('notebook_page1', notebook.add(Panel)), 'notebook_page1')
      notebook.add_page(name('notebook_page2', notebook.add(Panel)), 'notebook_page2')
      notebook.evt_notebook_page_changing(notebook.get_id()) {|e| update(e) }

      disabled_notebook = disable(name('disabled_notebook', p.add(Notebook, :minsize => true)))
      disabled_notebook.add_page(name('disabled_notebook_page1', disabled_notebook.add(Panel)), 'disabled_notebook_page1')
      disabled_notebook.add_page(name('disabled_notebook_page2', disabled_notebook.add(Panel)), 'disabled_notebook_page2')
      disabled_notebook.evt_notebook_page_changing(disabled_notebook.get_id()) {|e| update(e) }

      #todo: make me have a visible name on screen
      combo_box_with_items = name('combo_box_with_items', p.add(ComboBox, :minsize => true))
      combo_box_with_items.append('combo_box_item')
      evt_combobox(combo_box_with_items, :update)

      disabled_combo_box_with_items = disable(name('disabled_combo_box_with_items', p.add(ComboBox, :minsize => true)))
      disabled_combo_box_with_items.append('disabled_combo_box_item1')
      disabled_combo_box_with_items.append('disabled_combo_box_item2')
      evt_combobox(disabled_combo_box_with_items, :update)

      list_box_with_items = name('list_box_with_items', p.add(ListBox, :minsize => true))
      list_box_with_items.append('list_box_item')
      evt_listbox(list_box_with_items, :update)

      disabled_list_box_with_items = disable(name('disabled_list_box_with_items', p.add(ListBox, :minsize => true)))
      disabled_list_box_with_items.append('disabled_list_box_item1')
      disabled_list_box_with_items.append('disabled_list_box_item2')
      evt_listbox(disabled_list_box_with_items, :update)

      choice_with_items = name('choice_with_items', p.add(Choice, :minsize => true))
      choice_with_items.append('choice_item')
      evt_choice(choice_with_items, :update)

      disabled_choice_with_items = disable(name('disabled_choice_with_items', p.add(Choice, :minsize => true)))
      disabled_choice_with_items.append('disabled_choice_item1')
      disabled_choice_with_items.append('disabled_choice_item2')
      evt_choice(disabled_choice_with_items, :update)
    }), 'selection')

    test_notebook.add_page(name('choose', test_notebook.add(Panel) {|p| p.arrange_vertically
      #todo: make me have a visible name on screen
      evt_radiobutton(name('radio_button', p.add(RadioButton, :minsize => true)), :update)

      #todo: make me have a visible name on screen
      evt_radiobutton(disable(name('disabled_radio_button', p.add(RadioButton, :minsize => true))), :update)

      #todo: make me have a visible name on screen
      evt_checkbox(name('check_box', p.add(CheckBox, :minsize => true)), :update)

      #todo: make me have a visible name on screen
      evt_checkbox(disable(name('disabled_check_box', p.add(CheckBox, :minsize => true))), :update)
    }), 'choose')

    @log = name('log', panel.add(TextCtrl[:style => TE_READONLY | TE_MULTILINE], :minsize => true, :proportion => 1))

    menu_bar = MenuBar.new
    file_menu = Menu.new

    #todo: remove these crappy id's ... there must be a nice sugary way to build menu's
    file_new = file_menu.append(101, "&New...\tCtrl+N")
    file_disabled = file_menu.append(102, "&disabled")

    menu_bar.append(file_menu, '&File')
    set_menu_bar(menu_bar)

    #todo: make disable() handle menus ...
    menu_bar.enable(102, false)

    #todo: make update() handle menus ...
    evt_menu(file_new) {|e| log('file_new') }
  end

  def on_init
    self.update
  end

  private

  def name(name, component)
    component.name = name
    component
  end

  def disable(component)
    component.disable
    component
  end

  def log(text)
    @log.append_text(text)
  end

  def update(e)
    @log.append_text("#{e.event_object.name}: #{e.string}\n")
  end
end

class ExampleApp < App
  def on_init
    TestFrame.new(nil, :title => 'test', :size => [1024, 768])
  end
end

ExampleApp.new.main_loop if __FILE__ == $0

= Wx-Nobbie -- An implementation of the Nobbie GUI Driving API for WxRuby2

Nobbie is a simple generic api for driving GUI's (both web and rich-client interfaces).  This
particular implementation is for driving WxRuby2 applications.  There are other implementations available for
driving Java Swing and Web Applications - but they all use the same generic API.

Nobbie attempts to make the driving of UI's as simple as possible.  Whereas most UI drivers tend to give you multiple
ways to find components and subsequently multiple ways to interact with them, Nobbie's philosophy is:

* finding components by name is the simplest, least brittle approach.
* *most* UI interactions boil down to: *typing*, *choosing* and *clicking*

(Note: if you can't sleep without the ability to find things using xpath or whatever, there are hooks to specify your
own component finding strategies).

With this in mind, Nobbie provides a simple method of {finding components}[link:classes/Nobbie/Wx/ElementPathBuilder.html]
and a simple set of {Operations}[link:classes/Nobbie/Wx/Operations.html] to perform on them.

A quick overview with examples:

* Paths ...

  In order to perform operations[link:classes/Nobbie/Wx/Operations.html] on a component, you need to first find it.
  Only very simple 'named' paths are supported by default (but you can implement your own by providing an object that
  responds to 'find_component'). When specifying a path, if you do not provide an object that responds to
  'find_component', Nobbie will attempt to coerce the path into the default path type: Nobbie::Wx::ElementPathBuilder.

  That may sound complicated but its really just sugar.  The following paths will all find the component
  named 'text_ctrl':

   'text_ctrl'
   :in => 'text_ctrl'
   in_('text_ctrl')
   Nobbie::Wx::ElementPathBuilder.new('text_ctrl')
   :text_ctrl


* Typing[link:classes/Nobbie/Wx/Operations.html#type] ...

   type(value, path)

  e.g.

   type('fred', in_('first_name'))
   
  ...or if you're one of those DSL/anglification people
   
   type 'fred', :in => 'first_name'
   type 'fred', 'first_name'
   type 'fred', :first_name
   
  This will find the component named 'first_name' and type 'fred' into it.
  ...this works for anything you can type into, see:
  {supported components}[link:classes/Nobbie/Wx/Operations.html#type].


* Selecting[link:classes/Nobbie/Wx/Operations.html#selection] ...

   selection(path).choose(value)

  e.g.

   selection(in_('title')).choose('Mr')
   
  ...or
   
   selection(:in => 'title').choose 'Mr'
   selection('title').choose 'Mr'
   selection(:title).choose 'Mr'

  This will find the component named 'title' and select 'Mr'.
  ...this works for anything where you can make a selection from a number of options
  (which is quite a lot of things), see:
  {supported components}[link:classes/Nobbie/Wx/SelectOperations.html#selection].

  You can get the value of the current selection using:

   selection(path).selected_value


* Clicking[link:classes/Nobbie/Wx/Operations.html#click] ...

   click(path) (for buttons you can also use the label instead of a path)

  e.g.

   click('save')
   
  ...or
   
   click 'save'
   click :save
   etc
   
  This will find the component named (or labelled) 'save' and click it.
  ...this works for anything you can click, see:
  {supported components}[link:classes/Nobbie/Wx/Operations.html#click].


* Choosing[link:classes/Nobbie/Wx/Operations.html#choosable] ...

   choosable(path).choose

  e.g.

   choosable(in_('female')).choose

  ...or

   choosable(:in => 'female').choose
   choosable('female').choose
   choosable(:female).choose

  This will find the component named 'female' and choose it
  ...this works for anything that has a chosen/non-chosen state, see:
  {supported components}[link:classes/Nobbie/Wx/ChoosableOperations.html#choose].

  You can determine if a component is currently chosen using:

   choosable(path).chosen?

Hopefully that makes some degree of sense, there are a few other operations available, that should be self
explanatory from the documentation[link:classes/Nobbie/Wx/Operations.html].

* Writing that first test ...

  By default Nobbie hooks into test/unit.  However, due to a Wx limitation its not possible to launch a new
  instance of your application for every test run (this would also be very slow anyway).  So, instead Nobbie
  will launch your application, run all the tests in your suite and then close down the application. (Note: If
  anyone has a better solution to this ... please let me know).

  In order for this to happen, you must advise Nobbie which application you wish to test by setting the constant
  APPLICATION_UNDER_TEST to an instance of your application, i.e.:

   require 'rubygems'
   require_gem 'nobbie-wx-preview'

   require 'your_application'
   require 'your_test_suite'

   APPLICATION_UNDER_TEST = YourApp.new

  Finally, to prevent your application being loaded when its file is 'required', edit your application startup
  as follows:

   YourApp.new.main_loop  if __FILE__ == $0

* More examples ...

  Nobbie has a suite of tests which are installed as part of the gem.  Take a look at the 'test' directory.




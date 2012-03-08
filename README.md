DropDown Test - Creating Combo Boxes from UITableViewCells [![endorse](http://api.coderwall.com/floriankrueger/endorsecount.png)](http://coderwall.com/floriankrueger)
==========================================================

Author: Florian Krüger [florian.krueger@projectserver.org](mailto:florian.krueger@projectserver.org)

Website: [xcuze.me](http://www.xcuze.me)

Date: 03. Apr 2011

GIT Repository URL: [https://github.com/floriankrueger/iOS-Examples--UITableView-Combo-Box](https://github.com/floriankrueger/iOS-Examples--UITableView-Combo-Box)

Purpose of this XCode project
-----------------------------

This XCode project is intended to demonstrate the usage of custom UITableViewCells as kind of combo boxes (as known from [X]HTML) or dropdown boxes. The code used to provide this is just a rough prototype and *in no way production-ready*, but it can give you an idea of how you might realize this behaviour in your own iOS projects.

Documentation
-------------

A quick documentation of the code provided.

### DropDownTestAppDelegate

This is just the standard AppDelegate created by XCode 4.0.1. No changes were required on this file.

### RootViewController

This is where the magic's at. All of the core functionality of the DropDownCells are collected here. This is for sure *not* the best place but for the prototype it's OK. If you really *want* to use this code for your projects, it might be a good idea to start refactoring here ;).

#### tableView:(UITableView *) numberOfRowsInSection:(NSInteger)

The first thing that is important to mention is, that you need to return the correct number of rows in your section (a single dropdowncell refers to *one* section) depending on the state of the dropdown cell. So if the cell is closed, return 1; if the cell is open, return 1 plus the number of elements contained in your dropdowncell.

#### tableView:(UITableView *) cellForRowAtIndexPath:(NSIndexPath *)

Again, depending on the state of the dropdowncell (id '0' in `[indexPath row]` for the first two sections), the method has to return different cells. Luckily, the framework will only ask for the additinal cells (row > 0) in these sections, if the `numberOfRowsInSection` method returns a rowcount for this section greater than 1, so you don't have to worry about the dropdowncell state here directly.
For the purpose of this prototype, I am using static Strings ('Option 1' to 'Option 3') for the contents of the dropdowncells. In production you might want to use an external data source like an `NSMutableArray` or similar.
There is still something left to say about the way the custom `UITableViewCell` is generated. The code you find here is accessing all the XIB files in the bundle to search for the file named 'DropDownCell'. This looks a little cumbersome at first but it seems to be the standard way to do this as I didn't found any simpler way to do this. If somebody knows a simpler way, please tell me!

#### tableView:(UITableView *) didSelectRowAtIndexPath:(NSIndexPath *)

Again, this is code that definately has to be refactored for production use. It's horribly static. You at least might want to use a loop that takes the option count from an external source and generates the `NSIndexPath` variables in a dynamic way before collecting them in an array which is then used to modify the rows (add or delete them) in the section.
The behaviour of the first rows (id '0' - the dropdowncell) is again different from the rest of the rows (the options within the dropdowncell). The default option of the switch structure is used to specify this difference: Depending on the state of the dropdownbox (class ivar `dropDown1Open` and `dropDown2Open`) the dropdowncell is opened or closed. All other cells modify the text in the label of their dropdowncell and the value in the ivars `dropDown1` or `dropDown2` (you might want to change the `NSString` type to something more meaningful e.g. an enumeration).
When testing the project you will notice another difference between the two dropdowncells: the second cell is immediately closed when the user selects one of the options, the first stays open. Responsible for the closure is a piece of code that has to be extracted to a standalone method (refactored) as well in order to make the code DRY because it is used two times: when tapping on the dropdowncell (row 0) and when selecting an option (row >= 1).

### DropDownCell

The `DropDownCell` class has a few properties for the label (`textLabel`), the state (`isOpen`) and the image indicating the state (`arrow_up` and `arrow_down`). In contrast to the `RootViewController`, there are only two small interesting methods here.

#### setOpen

This method shows the arrow pointing downwards (indicating the dropdowncell being open) and hides the arrow pointing upwards. It sets the state `isOpen` to YES as well.

#### setClosed

This method shows the arrow pointing upwards (indicating the dropdowncell being closed) and hides the arrow pointing downwards. It sets the state `isOpen` to NO as well.
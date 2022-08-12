
# IMGUIGML_UI
imguigml_ui is a wrapper class built on top of [imguigml](https://imguigml.rou.sr/). The purpose of this wrapper is to bring all of the functions of imguigml into a simplistic coding standard.

## Setup
To get started import all the required files from either the **yymps** file or from the GameMaker Marketplace. Once you have done so you start coding.

### Library Initialization
To get the library initialized you will need to add the following code in the create event of the Object you want to have the UI attached to. You can attach the UI to multiple objects, but it is good practice to call the same commands in the `create` event for each.

    /// @create event
    ui = new UI();
    ui.init();
 
### Menus
You can add either a main menu to your application, or a child menu into a window once created.

#### Main Menu

    ui.menu_main(function() {
      ui.menu_strip("File", "mnuFile", function() {
        ui.menu_item("New", "mnuFileNew", function() {
          show_message("I clicked on new");
        });
        ui.menu_item("Open", "mnuFileOpen", function() {
          show_message("I clicked on open");
        });
        ui.menu_item("Quit", "mnuFileQuit", function() {
          game_end();
        });
      });
      
      ui.menu_strip("Help", "mnuHelp", function() {
        ui.menu_item("Help", "mnuHelpHelp", function() {
          show_message("I clicked on help");
        });
        ui.menu_item("About", "mnuHelpAbout", function() {
          show_message("I clicked on about");
        });
      });
    });

#### Menus

    ui.window("Test Window", "winTest", 300, 200, 0, 0, function() {
      ui.menu_strip("File", "mnuFileWin", function() {
        ui.menu_item("Test", "mnuFileWinTest", function() {
          show_message("Ok");
        });
      });
    }, EImGUI_Window.MenuBar);

### Windows

### Inputs


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
A window can easily be created with a single line of code. The callback function will push anything inside of it into the window's container.

    // simple window with a default width, height
    ui.window("Test Window", "window_test_1", 300, 400, 200, 200, function() {
      ui.label("This is a label");
    });
    
    // simple window with no title bar and auto size
    ui.window("Test Window", "window_test_2", 300, 100, 0, 0, function() {
      ui.label("This is a label and this window will be able to grow and shrink with what is inside");
      ui.label("I also have no title bar!");
    }, EImGui_WindowFlags.NoTitleBar);
    
    // simple window with inputs
    ui.window("Test", "window_test_3", 10, 100, 0, 0, function() {
      ui.label("Hello World");
      ui.separator();
      
      ui.slider_float("Scale", "scale_xy", [obj_Player.image_xscale, obj_Player.image_yscale, obj_Player.image_angle], 0, 1, function(_a, _b, _c) {
        obj_Player.image_xscale = _a;
        obj_Player.image_yscale = _b;
        obj_Player.image_angle = _c * 100;
      });
    });

### Inputs

Input command in the library are simple and intelligent. This means that for sliders and drag function calls you pass in an array of variables. The function will then figure out which slider/drag to call in the background.

Because of the ability to pass in multiple variables into the function, the call back function will also recieve the amount of variables you passed in. This means if you passed in 3 variables, your callback function would have 3 arguments as well.

    // single slider (float)
    ui.slider_float("My Slider", "sld_xscale", [obj_Player.image_xscale], 0, 1, function(_a) {
      obj_Player.image_xscale = _a;
    });
    
    // four slider (float)
    ui.slider_float("My Slider Four", "sld_four", [obj_Player.image_xscale, obj_Player.image_yscale, obj_Player.image_alpha, obj_Player.image_angle], 0, 1, function(_a, _b, _c, _d) {
      obj_Player.image_xscale = _a;
      obj_Player.image_yscale = _b;
      obj_Player.image_alpha = _c;
      obj_Player.image_angle = _d * 360;
    });

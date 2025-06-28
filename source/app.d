import dlangui.dialogs.filedlg;
import dlangui.widgets.controls;
import dlangui.widgets.layouts;
import dlangui.widgets.widget;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("Krita Layers", null);

    // create some widget
    auto vlayout = new VerticalLayout();

    UIString caption = "Open File"d;
    FileDialog fileDialog = new FileDialog(caption, window);

    Button kritBtn = new Button();
    kritBtn.text("Open Krita"d);
    kritBtn.click = delegate(Widget src) {
        fileDialog.show();
        return true;
    };

    // show them in window
    vlayout.addChild(kritBtn);
    window.mainWidget = vlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
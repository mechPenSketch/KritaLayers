import dlangui.dialogs.dialog;
import dlangui.dialogs.filedlg;
import dlangui.widgets.controls;
import dlangui.widgets.layouts;
import dlangui.widgets.widget;

import kra;
import kra.parser;

import std.stdio;
import std.file;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("Krita Layers", null);

    // create some widget
    auto vlayout = new VerticalLayout();

    UIString caption = "Open File"d;
    FileDialog fileDialog = new FileDialog(caption, window);
    FileFilterEntry filter;
    filter.filter ~= "*.kra";
    fileDialog.addFilter(filter);
    fileDialog.dialogResult.connect(delegate(Dialog dlg, const Action result) {
        string fileName =  fileDialog.filename();
        if (isFile(fileName)) {
            auto kraDoc = parseDocument(fileName);
            
            foreach (Layer l; kraDoc.layers)
            {
                vlayout.addChild(new TextWidget("a", l.name));
            }
        }
    });

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
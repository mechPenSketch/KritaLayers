import kra;
import kra.layer;

import std.file;
import std.path;
import std.stdio;

void main()
{
    writeln("Enter a krita file:");
    //auto file = File(readln());
    string fileName = "example.kra";
    auto file = File(fileName);
    writeln(file.name);

    if (extension(file.name) == ".kra"){
        KRA kraDoc = parseDocument(fileName);
        foreach (layer; kraDoc.layers)
        {
            writeln("\t" ~ layer.name);
        }
    } else {
        writeln("This is not a krita file.");
    };
}

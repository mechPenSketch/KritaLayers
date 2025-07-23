import dxml.dom;

import std.algorithm;
import std.file;
import std.path;
import std.stdio;
import std.zip;

void main()
{
    writeln("Enter a krita file:");
    //auto file = File(readln());
    string fileName = "example2.kra";
    auto file = File(fileName);
    writeln(file.name);

    if (extension(file.name) == ".kra"){
        auto zip = new ZipArchive(read(fileName));
        auto mainDoc = zip.directory["maindoc.xml"];
        zip.expand(mainDoc);
        auto dom = parseDOM!simpleXML(cast(string) mainDoc.expandedData);
        auto doc = dom.children[0];
        auto image = doc.children[0];
        auto layerEntity = image.children[0];
        auto layers = layerEntity.children.filter!(x => x.name == "layer");

        foreach (l; layers)
        {
            /**
                Printing an array of tuples of attributes
            */
            //writeln(l.attributes);

            /**
                Printing DOMEntity of children data
            */
            writeln(l.children[0]);
        }
    } else {
        writeln("This is not a krita file.");
    };
}

import std.file;
import std.path;
import std.stdio;

void main()
{
    writeln("Enter a krita file:");
    //auto file = File(readln());
    auto file = File("example.txt");
    writeln(file.name);

    if (extension(file.name) == ".kra"){
        writeln("Success!");
    } else {
        writeln("This is not a krita file.");
    };
}

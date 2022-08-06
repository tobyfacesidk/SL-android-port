package;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class SLModding {

    public static var modsArray:Array<String> = [];

    static public function init():Void{
        // yes i do know how to use jsons. i just like text files.
        
        for (modFolder in FileSystem.readDirectory("mods/")){
            trace(modFolder);

            if (FileSystem.exists('mods/$modFolder/mod.json')){
                modsArray.push(modFolder);
            }
            else{
                /* i was gonna originally do this but i didn't see a point
                File.saveContent('mods/$modFolder/mod.json', Json.stringify({
                    "name": modFolder,
                    "description": "",
                    "author": "",
                    "version": "1.0"
                }));*/
            }
        }

        trace('Mods loaded! ' + modsArray);
    }
}
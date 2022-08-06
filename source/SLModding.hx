package;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class SLModding {

    public var modsArray:Array<String> = [];

    static public function init():Void{
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

        trace(modsArray);
    }
}
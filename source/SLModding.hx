package;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class SLModding {

    public static var modsArray:Array<String> = [];
    public static var isInitialized:Bool = false;

    static public function init():Void{
        var validMods:Int = 0;

        if (modsArray != []){
            isInitialized = false;
            modsArray = [];
        }
        
        for (modFolder in FileSystem.readDirectory("mods/")){
            trace(modFolder);

            if (FileSystem.exists('mods/$modFolder/mod.json')){
                modsArray.push(modFolder);
                validMods++;
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

        if (validMods > 0)
            isInitialized = true;
        else
            isInitialized = false;

        trace('Mods loaded! ' + modsArray);
    }
}
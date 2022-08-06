package;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class SLModding {

    public static var modsArray:Array<String> = [];
    public static var curLoaded:String;

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
                /* i was gonna originally do this but i didn't see a point plus it would be buggy as fuck
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

    static public function generatePath(mod:String = '', directory:String = null){
        if (mod == '')
            mod = curLoaded;

        if (directory != null)
            return 'mods/$mod/$directory/';
        else
            return 'mods/$mod/';
    }

    static public function parseModValue(wanted:String, mod:String = ''){
        if (mod == '')
            mod = curLoaded;

        var jsonString:String = File.getContent('mods/$mod/mod.json');
        var actualJson = Json.parse(jsonString);

        switch (wanted){
            default:
                return 'invalid lmao';
            case 'name':
                return actualJson.name;
            case 'description':
                return actualJson.description;
            case 'author':
                return actualJson.author;
            case 'version':
                return actualJson.version;
        }
    }
}
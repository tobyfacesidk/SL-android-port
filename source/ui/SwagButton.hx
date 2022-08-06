package ui;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

class SwagButton extends FlxSprite
{
    public function new(x:Float, y:Float, graphic:String, text:String, font:String, fontSize:Int){
        this.loadGraphic(Paths.image("modmenu/emptyButtonWide", 'preload'));
        this.antialiasing = false;
        this.x = FlxG.width - this.width;
        this.y = FlxG.height - this.height;

        var text:FlxText = new FlxText(this.x, this.y, this.width, text);

        super(x, y);
    }
}
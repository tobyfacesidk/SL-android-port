package optionsmenu;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import SLModding; // holy shit?!/1 who would of guessed?
import flixel.FlxState;

class ModsMenu extends MusicBeatState
{
    var uiGroup:FlxTypedGroup<FlxSprite>;

    var reloadButton:FlxSprite;

    override public function create()
    {
        uiGroup = new FlxTypedGroup<FlxSprite>();

        reloadButton = new FlxSprite(0, 0, Paths.image("modmenu/emptyButtonWide", 'preload'));
        reloadButton.antialiasing = false;
        reloadButton.x = FlxG.width - reloadButton.width;
        reloadButton.y = FlxG.height - reloadButton.height;
        uiGroup.add(reloadButton);

        var reloadButtonText = new FlxText(reloadButton.x, reloadButton.y, reloadButton.width, "Reload Mods", 16);
        reloadButtonText.setFormat("PhantomMuff 1.5", 16, FlxColor.WHITE, 'center');
        reloadButtonText.y = reloadButton.y + (reloadButton.height / 2) - (reloadButtonText.height / 2);
        uiGroup.add(reloadButtonText);

        for (members in uiGroup){
            members.scrollFactor.set(0, 0);
        }

        add(uiGroup);

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}
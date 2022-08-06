package optionsmenu;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import SLModding; // holy shit?!/1 who would of guessed?
import flixel.FlxState;
import flixel.util.FlxTimer;

class ModsMenu extends MusicBeatState
{
    var inColorTimer:Bool = false;
    var bgColorArray:Array<FlxColor> = [FlxColor.RED, FlxColor.GREEN, FlxColor.BLUE];
    var curColor:Int;

    var uiGroup:FlxTypedGroup<FlxSprite>;

    var reloadButton:FlxButton;

    var daBGcolor:FlxColor;
	var bg:FlxSprite;

    override public function create()
    {
        FlxG.mouse.visible = true;

        uiGroup = new FlxTypedGroup<FlxSprite>();

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		uiGroup.add(bg);

        reloadButton = new FlxButton(0, 0, "Reload Mods", function() {
            SLModding.init();
            FlxG.resetState();
        });
        reloadButton.x = (FlxG.width - reloadButton.width) - 24;
        reloadButton.y = (FlxG.height - reloadButton.height) - 24;
        uiGroup.add(reloadButton);

        var modBG:FlxSprite = new FlxSprite().makeGraphic(1024, 512, FlxColor.BLACK);
        modBG.alpha = 0.6;
        modBG.screenCenter(XY);
        uiGroup.add(modBG);

        for (members in uiGroup){
            members.scrollFactor.set(0, 0);
        }

        add(uiGroup);

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (controls.BACK) {
			FlxG.switchState(new OptionsMenu());

			FlxG.sound.play(Paths.sound('cancelMenu'));
		}

        if (!inColorTimer) {
            // use flxtimer with a function
            var timer:FlxTimer = new FlxTimer();
            timer.start(0.5, function(timer) {
                if (curColor < bgColorArray.length - 1) {
                    curColor++;
                } 
                else {
                    curColor = 0;
                }

                daBGcolor = bgColorArray[curColor];

                FlxTween.color(bg, 0.5, bg.color, daBGcolor, {ease: FlxEase.quadInOut, type: ONESHOT});
                inColorTimer = false;
            });

            inColorTimer = true;
        }
    }
}
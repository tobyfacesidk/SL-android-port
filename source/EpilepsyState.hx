package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class EpilepsyState extends FlxState {
    public override function create() {
        super.create();
        
        var text = new FlxText(0, 0, FlxG.width, "FNFSL Engine contains flashing lights.\n\nPress ENTER to turn on epilepsy mode.\nPress ESC to ignore this message.");
        text.setFormat("VCR OSD Mono", 32, 0xffffffff, CENTER);
        text.screenCenter();
        add(text);

        FlxG.camera.fade(0x000000, 3, true);
    }

    public override function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER) {
            FlxG.save.data.epilepsyMode = true;
            FlxG.camera.fade(0x000000, 1.5, false, function() {
                FlxG.switchState(new WarningState());
            });
        } else if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.save.data.epilepsyMode = false;
            FlxG.camera.fade(0x000000, 1.5, false, function() {
                FlxG.switchState(new WarningState());
            });
        }

        if (FlxG.keys.justPressed.F)
            FlxG.sound.play(Paths.sound('GF_2', 'shared'));

    }
}
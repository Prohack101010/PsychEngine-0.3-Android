package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	//TO DO: Redo ClientPrefs in a way that isn't too stupid
	public static var downScroll:Bool = false;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var buttonMashing:Bool = false;
	//Mobile Things
    public static var wideScreen:Bool = false;
 	#if android public static var storageType:String = "EXTERNAL_DATA"; #end
 	public static var VirtualPadAlpha:Float = #if mobile 0.6 #else 0 #end;
 	public static var extraKeyReturn1:String = 'SHIFT';
    public static var extraKeyReturn2:String = 'SPACE';
    public static var extraKeyReturn3:String = 'Q';
    public static var extraKeyReturn4:String = 'E';
 	public static var hitboxtype:String = 'Gradient';
 	public static var extraKeys:Int = 2;
 	public static var hitboxLocation:String = 'Bottom';
 	public static var hitboxalpha:Float = #if mobile 0.7 #else 0 #end; //someone request this lol

	public static var defaultKeys:Array<FlxKey> = [
		A, LEFT,			//Note Left
		S, DOWN,			//Note Down
		W, UP,				//Note Up
		D, RIGHT,			//Note Right

		A, LEFT,			//UI Left
		S, DOWN,			//UI Down
		W, UP,				//UI Up
		D, RIGHT,			//UI Right

		R, NONE,			//Reset
		SPACE, ENTER,		//Accept
		BACKSPACE, ESCAPE,	//Back
		ENTER, ESCAPE		//Pause
	];
	//Every key has two binds, these binds are defined on defaultKeys! If you want your control to be changeable, you have to add it on ControlsSubState (inside OptionsState)'s list
	public static var keyBinds:Array<Dynamic> = [
		//Key Bind, Name for ControlsSubState
		[Control.NOTE_LEFT, 'Left'],
		[Control.NOTE_DOWN, 'Down'],
		[Control.NOTE_UP, 'Up'],
		[Control.NOTE_RIGHT, 'Right'],

		[Control.UI_LEFT, 'Left '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_DOWN, 'Down '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_UP, 'Up '],			//Added a space for not conflicting on ControlsSubState
		[Control.UI_RIGHT, 'Right '],	//Added a space for not conflicting on ControlsSubState

		[Control.RESET, 'Reset'],
		[Control.ACCEPT, 'Accept'],
		[Control.BACK, 'Back'],
		[Control.PAUSE, 'Pause']
	];
	public static var lastControls:Array<FlxKey> = defaultKeys.copy();

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		FlxG.save.data.cursing = cursing;
		FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.buttonMashing = buttonMashing;
		
		//mobile
 		FlxG.save.data.wideScreen = wideScreen;
 		FlxG.save.data.storageType = storageType;
 		FlxG.save.data.VirtualPadAlpha = VirtualPadAlpha;
 		FlxG.save.data.extraKeyReturn1 = extraKeyReturn1;
 		FlxG.save.data.extraKeyReturn2 = extraKeyReturn2;
 		FlxG.save.data.extraKeyReturn3 = extraKeyReturn3;
 		FlxG.save.data.extraKeyReturn4 = extraKeyReturn4;
 		FlxG.save.data.hitboxtype = hitboxtype;
 		FlxG.save.data.extraKeys = extraKeys;
 		FlxG.save.data.hitboxLocation = hitboxLocation;
 		FlxG.save.data.hitboxalpha = hitboxalpha;

		var achieves:Array<String> = [];
		for (i in 0...Achievements.achievementsUnlocked.length) {
			if(Achievements.achievementsUnlocked[i][1]) {
				achieves.push(Achievements.achievementsUnlocked[i][0]);
			}
		}
		FlxG.save.data.achievementsUnlocked = achieves;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = lastControls;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.imagesPersist != null) {
			imagesPersist = FlxG.save.data.imagesPersist;
			FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		}
		if(FlxG.save.data.buttonMashing != null) {
			buttonMashing = FlxG.save.data.buttonMashing;
		}
		//Mobile
 		if(FlxG.save.data.wideScreen != null) {
 			wideScreen = FlxG.save.data.wideScreen;
 		}
 		if(FlxG.save.data.storageType != null) {
 			storageType = FlxG.save.data.storageType;
 		}
 		if(FlxG.save.data.VirtualPadAlpha != null) {
 			VirtualPadAlpha = FlxG.save.data.VirtualPadAlpha;
 		}
 		if(FlxG.save.data.extraKeyReturn1 != null) {
 			extraKeyReturn1 = FlxG.save.data.extraKeyReturn1;
 		}
 		if(FlxG.save.data.extraKeyReturn2 != null) {
 			extraKeyReturn2 = FlxG.save.data.extraKeyReturn2;
 		}
 		if(FlxG.save.data.extraKeyReturn3 != null) {
 			extraKeyReturn3 = FlxG.save.data.extraKeyReturn3;
 		}
 		if(FlxG.save.data.extraKeyReturn4 != null) {
 			extraKeyReturn4 = FlxG.save.data.extraKeyReturn4;
 		}
 		if(FlxG.save.data.hitboxtype != null) {
 			hitboxtype = FlxG.save.data.hitboxtype;
 		}
 		if(FlxG.save.data.extraKeys != null) {
 			extraKeys = FlxG.save.data.extraKeys;
 		}
 		if(FlxG.save.data.hitboxLocation != null) {
 			hitboxLocation = FlxG.save.data.hitboxLocation;
 		}
 		if(FlxG.save.data.hitboxalpha != null) {
 			hitboxalpha = FlxG.save.data.hitboxalpha;
 		}
 		//

		var save:FlxSave = new FlxSave();
		save.bind('controls', CoolUtil.getSavePath());
		if(save != null && save.data.customControls != null) {
			reloadControls(save.data.customControls);
		}
	}

	public static function reloadControls(newKeys:Array<FlxKey>) {
		ClientPrefs.removeControls(ClientPrefs.lastControls);
		ClientPrefs.lastControls = newKeys.copy();
		ClientPrefs.loadControls(ClientPrefs.lastControls);
	}

	private static function removeControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToRemove:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToRemove.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToRemove.length > 0) {
				PlayerSettings.player1.controls.unbindKeys(keyBinds[i][0], controlsToRemove);
			}
		}
	}
	private static function loadControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToAdd:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToAdd.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToAdd.length > 0) {
				PlayerSettings.player1.controls.bindKeys(keyBinds[i][0], controlsToAdd);
			}
		}
	}
}
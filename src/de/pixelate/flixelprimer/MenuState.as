package de.pixelate.flixelprimer {
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Vincent Loiseleur
	 */
	public class MenuState extends FlxState {
		
		private var _txt: FlxText;
		
		override public function create():void {

		bgColor = 0xFFABCC7D;
		
		_txt = new FlxText(0, (FlxG.height / 2) - 180, FlxG.width, "GENERIC")
		_txt.setFormat(null, 60, 0xFFFFFFFF,"center")
		this.add(_txt);
		
		_txt = new FlxText(0, (FlxG.height / 2) - 100, FlxG.width, "SHOOTER")
		_txt.setFormat(null, 80, 0xFF000000, "center"); 
		this.add(_txt);
		
		_txt = new FlxText(0, FlxG.height  -24, FlxG.width, "PRESS SPACE TO START")
		_txt.setFormat(null, 8, 0xFFFFFFFF, "center");
		this.add(_txt);
        }
        
		override public function update():void {
            if (FlxG.keys.pressed("SPACE")) {
                FlxG.fade.start(0xff000000, 1, toPlayState);				
			}
            super.update();
        }
		
		private function toPlayState():void {
			FlxG.state = new PlayState();
		}
	}
}





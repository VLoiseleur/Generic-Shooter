package de.pixelate.flixelprimer {
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Vince
	 */
	
	public class Hitbox extends FlxSprite{

		//Creates ship at location (bottom-center of screen)
		public function Hitbox():void{
			super((FlxG.width / 2) + 23, FlxG.height - 42);
			createGraphic(8, 8, 0x00000000);
		}
		
		override public function update():void{
			velocity.x = 0;
			velocity.y = 0;

			if(FlxG.keys.LEFT){
				velocity.x = -300;
			}
			else if(FlxG.keys.RIGHT){
				velocity.x = 300;
			}

			if(FlxG.keys.UP){
				velocity.y = -300;
			}
			else if(FlxG.keys.DOWN){
				velocity.y = 300;
			}

			super.update();
			
			//Code to ensure hitbox stays within boundary
			//Boundary for right of screen
			if(x > FlxG.width-width-39){
				x = FlxG.width-width-39;
			}
			
			//Boundary for left of screen
			else if(x < 39){
				x = 39;
			}
			
			//Boundary for bottom of screen
			if(y > FlxG.height-height-34){
				y = FlxG.height-height-34;
			}
			
			//Boundary for top of screen
			else if(y < 34){
				y = 34;
			}
		}
	}
}
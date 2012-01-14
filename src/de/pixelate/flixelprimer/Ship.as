package de.pixelate.flixelprimer{
	import org.flixel.*;

	public class Ship extends FlxSprite{
		//Location of ship art asset
		[Embed(source = "../../../../assets/png/Ships/Ship1.png")]
		//Create ship object
		private var ImgShip:Class;

		//Creates ship at location (bottom-center of screen)
		public function Ship():void{
			super((FlxG.width / 2), FlxG.height, ImgShip);
		}

		public function getBulletSpawnPosition():FlxPoint{
			var p: FlxPoint = new FlxPoint(x + 24, y + 2);
			return p;
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
			
			//Code to ensure player ship stays in boundary
			if(x > FlxG.width-width-16){
				x = FlxG.width-width-16;
			}
			
			else if(x < 16){
				x = 16;
			}

			if(y > FlxG.height-height-16){
				y = FlxG.height-height-16;
			}
			
			else if(y < 16){
				y = 16;
			}
		}
	}
}
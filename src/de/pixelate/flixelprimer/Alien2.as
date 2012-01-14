package de.pixelate.flixelprimer {
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Vince
	 */
	
	public class Alien2 extends FlxSprite{
		[Embed(source="../../../../assets/png/Ships/3.png")]
		private var ImgAlien2:Class;

		public function Alien2(x: Number, y: Number):void{
			super(x, y, ImgAlien2);
			velocity.y = 100;
			health = 5;
		}

		//Set spawn point for center of ship graphic
		public function getAlien2BulletSpawnPosition():FlxPoint{
			var p: FlxPoint = new FlxPoint(x+32,y+32);
			return p;
		}
	}

}
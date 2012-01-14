package de.pixelate.flixelprimer{
	import org.flixel.*;

	public class Powerup extends FlxSprite {
		
		[Embed(source = "../../../../assets/png/Bacon.png")]
		private var ImgPowerup:Class;
		
		public function Powerup(x: Number, y: Number):void{
			super(x, y, ImgPowerup);
			velocity.y = 100;
		}
	}
}
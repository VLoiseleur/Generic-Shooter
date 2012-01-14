package de.pixelate.flixelprimer
{
	import org.flixel.*;

	public class Bullet2 extends FlxSprite{
		public function Bullet2(x: Number, y: Number):void
		{
			super(x, y);
			createGraphic(4, 4, 0xFFFF0000);
			velocity.y = 200;
		}
	}
	
}
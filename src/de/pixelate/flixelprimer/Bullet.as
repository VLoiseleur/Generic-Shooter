package de.pixelate.flixelprimer
{
	import org.flixel.*;

	public class Bullet extends FlxSprite{
		
		//Location of art asset
		[Embed(source = "../../../../assets/png/Projectiles/Yellow.png")]
		//Create ship object
		private var ImgBullet:Class;
		
		public function Bullet(x: Number, y: Number):void{
			super(x, y, ImgBullet);
			//Bullet velocity
			velocity.y = -500;
		}
	}
}
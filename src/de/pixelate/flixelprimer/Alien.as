package de.pixelate.flixelprimer{
	import org.flixel.*;

	public class Alien extends FlxSprite{
		[Embed(source="../../../../assets/png/Ships/2.png")]
		private var ImgAlien:Class;

		public function Alien(x: Number, y: Number):void{
			super(x, y, ImgAlien);
			velocity.y = 200;
		}

		//Set spawn point for center of ship graphic
		public function getEnemyBulletSpawnPosition():FlxPoint{
			var p: FlxPoint = new FlxPoint(x+32,y+32);
			return p;
		}
		
		override public function update():void
		{
	    	velocity.x = Math.cos(y / 50) * 50;
			super.update();
		}
	}
}
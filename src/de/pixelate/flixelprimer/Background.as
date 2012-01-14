package de.pixelate.flixelprimer
{
	import org.flixel.*;

	public class Background extends FlxSprite{
		//Location of background art asset
		[Embed(source = "../../../../assets/png/Backgrounds/Sky.png")]
		private var ImgSky:Class;

		//Creates ship at location (bottom-center of screen)
		public function Background():void{
			super(0, 0, ImgSky);
		}
	}
}
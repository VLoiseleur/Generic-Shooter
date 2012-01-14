package {
	import org.flixel.*;
	import de.pixelate.flixelprimer.*;

	
	[SWF(width="480", height="640", backgroundColor="#ABCC7D")]
	[Frame(factoryClass="Preloader")]

	/**
	 * ...
	 * @author Vincent Loiseleur
	 */
	
	public class Main extends FlxGame
	{
		public function Main():void
		{
			super(480, 640, MenuState, 1);
		}
	}
}
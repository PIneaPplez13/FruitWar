package
{
	import net.flashpunk.FP;
	import net.flashpunk.Engine;

	public class Main extends Engine
	{
		public function Main()
		{
			super(800, 600, 60, false);
		}

		override public function init():void
		{
			trace("MineTurtle!");
			FP.world = new MenuWorld; 
		}
	}
}
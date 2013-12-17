package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial5 extends Entity
	{
		[Embed(source = "/../assets/Tutorial5.png")] private const GRAPHICS:Class;

		public function Tutorial5()
		{
			graphic = new Image(GRAPHICS)
			x = 1400
			y = 250
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
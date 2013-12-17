package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial6 extends Entity
	{
		[Embed(source = "/../assets/Tutorial6.png")] private const GRAPHICS:Class;

		public function Tutorial6()
		{
			graphic = new Image(GRAPHICS)
			x = 2105;
			y = 200;
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
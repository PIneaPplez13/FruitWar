package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Tutorial2 extends Entity
	{
		[Embed(source = "/../assets/Tutorial2.png")] private const GRAPHICS:Class;

		public function Tutorial2()
		{
			graphic = new Image (GRAPHICS);

			x = 350
			y = 250
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
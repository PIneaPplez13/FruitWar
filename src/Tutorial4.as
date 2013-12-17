package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Tutorial4 extends Entity
	{
		[Embed(source = "/../assets/Tutorial4.png")] private const GRAPHICS:Class;

		public function Tutorial4()
		{
			graphic = new Image (GRAPHICS);

			x = 1000
			y = 300
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
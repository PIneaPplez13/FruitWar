package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Tutorial3 extends Entity
	{
		[Embed(source = "/../assets/Tutorial3.png")] private const GRAPHICS:Class;

		public function Tutorial3()
		{
			graphic = new Image (GRAPHICS);

			x = 700
			y = 300
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
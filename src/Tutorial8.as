package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial8 extends Entity
	{
		[Embed(source = "/../assets/Tutorial8.png")] private const GRAPHICS:Class;

		public function Tutorial8()
		{
			graphic = new Image(GRAPHICS)
			x = 2500;
			y = 200;
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
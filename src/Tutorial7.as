package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial7 extends Entity
	{
		[Embed(source = "/../assets/Tutorial7.png")] private const GRAPHICS:Class;

		public function Tutorial7()
		{
			graphic = new Image(GRAPHICS)
			x = 1750
			y = 200
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial9 extends Entity
	{
		[Embed(source = "/../assets/Tutorial9.png")] private const GRAPHICS:Class;

		public function Tutorial9()
		{
			graphic = new Image(GRAPHICS)
			x = 3000;
			y = 200;
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Tutorial1 extends Entity
	{
		[Embed(source = "/../assets/Tutorial1.png")] private const GRAPHICS:Class;

		public function Tutorial1()
		{
			graphic = new Image(GRAPHICS)
			x = 70
			y = 250
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
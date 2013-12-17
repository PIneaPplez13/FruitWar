package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Bullet extends Entity
	{
		[Embed(source = "/../assets/Bullet.png")] private const GRAPHICS:Class;

		private var z:Number;

		public function Bullet(INx:Number, INy:Number, INz:Number)
		{
			graphic = new Image(GRAPHICS)
			x = INx;
			y = INy;
			z = INz

			setHitbox(10,5);
			type = "Bullet"
		}
		override public function update(): void
		{
			x += z;

			layer = 1000000000000000000000000;

			if (collide ("Platform", x, y))
			{
				FP.world.remove(this);
			}	
			if (x > FP.world.camera.x + 810) FP.world.remove(this);
		}
	}
}
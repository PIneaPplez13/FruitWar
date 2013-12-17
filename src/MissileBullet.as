package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP
	import net.flashpunk.graphics.Image;

	public class MissileBullet extends Entity
	{
		[Embed(source = "/../assets/MissileBullet.png")]
		private const MISSILEBULLET:Class;

		public var sprMissileBullet:Spritemap = new Spritemap(MISSILEBULLET, 15, 9);

		private var z:Number;

		public function MissileBullet(INx:Number, INy:Number, INz:Number)
		{
			sprMissileBullet.add("Missile", [0], 1, true);
			graphic = sprMissileBullet;

			sprMissileBullet.play("Missile");

			setHitbox(15, 9);
			type = "Missile"

			x = INx;
			y = INy;
			z = INz;
		}
		override public function update(): void
		{
			if (collide("Platform", x, y))
			{
				FP.world.remove(this);
				FP.world.add(new Explosion(x - 10, y - 20));
			}
			if (z < 0)
			{
				Image(graphic).flipped = true;
			}
			if (x > FP.world.camera.x + 810) FP.world.remove(this);

			layer = 124;	
			x += z;
		}
	}
}
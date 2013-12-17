package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;

	public class Crate extends Entity
	{
		[Embed(source = "/../assets/Crate.png")]
		private const CRATE:Class;

		public var sprCrate:Spritemap = new Spritemap(CRATE, 50, 50);

		public var BulletCount:Number = 0;

		public var RemoveCount:Number = 0;

		public function Crate(INx:Number, INy:Number)
		{
			sprCrate.add("Crate", [0], 1, true);
			sprCrate.add("Damaged Crate", [1], 1, true);
			sprCrate.add("Exploding Crate", [2, 3, 4, 5], 8, false);
			graphic = sprCrate;

			setHitbox(50, 50);
			type = "Platform"

			x = INx;
			y = INy;
		}
		override public function update(): void
		{
			if (collide("Bullet", x, y))
			{
				BulletCount += 1;
				x += 5;
			}
			if (BulletCount == 0) sprCrate.play("Crate");
			if (BulletCount == 1) sprCrate.play("Damaged Crate");
			if (BulletCount >= 2)
			{
				sprCrate.play("Exploding Crate"); 
				RemoveCount += 1;
			}
			if (RemoveCount == 30) FP.world.remove(this);
			if (collide("Missile", x, y))
			{ 
				BulletCount = 2;
			}

			layer = 125;
		}
	}
}
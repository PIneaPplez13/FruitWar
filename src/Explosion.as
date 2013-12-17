package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;

	public class Explosion extends Entity
	{
		[Embed(source = "/../assets/Explosion.png")] 
		private const EXPLOSION:Class;

		public var RemoveCount:Number = 0;

		public var sprExplosion:Spritemap = new Spritemap(EXPLOSION, 50, 50);

		public function Explosion(INx:Number, INy:Number)
		{
			sprExplosion.add("Explosion", [0, 1, 2, 3, 4], 12, false);
			graphic = sprExplosion;

			sprExplosion.play("Explosion");

			setHitbox(55, 28);
			type = "Explosion"

			x = INx;
			y = INy;
		}
		override public function update(): void
		{
			RemoveCount += 1;

			if (RemoveCount == 30) FP.world.remove(this);

			layer = -100;	
		}
	}
}
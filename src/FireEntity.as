package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;

	public class FireEntity extends Entity
	{
		[Embed(source = "/../assets/FireEntity.png")]
		private const FIRE:Class;

		public var sprFireEntity:Spritemap = new Spritemap(FIRE, 50, 50);

		public function FireEntity(INx:Number, INy:Number)
		{
			sprFireEntity.add("Fire", [0, 1, 2], 6, true);
			graphic = sprFireEntity;

			sprFireEntity.play("Fire");

			setHitbox(50, 50);
			type = "Fire"

			x = INx;
			y = INy;
		}
		override public function update(): void
		{
			layer = 120;	
		}
	}
}
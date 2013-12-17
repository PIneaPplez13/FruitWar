package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;

	public class PistolPickup extends Entity
	{
		[Embed(source = "/../assets/PistolPickup.png")] 
		private const PISTOLPICKUP:Class;

		public var sprPistolPickup:Spritemap = new Spritemap(PISTOLPICKUP, 30, 20);

		public function PistolPickup(INx:Number, INy:Number)
		{
			sprPistolPickup.add("PistolPickup", [0, 1, 2, 3, 4], 5, true);
			graphic = sprPistolPickup;

			sprPistolPickup.play("PistolPickup");

			setHitbox(30, 20);
			type = "PistolPickup"

			x = INx;
			y = INy;
		}
		override public function update():void
		{
			layer = 10000000000;
		}
	}
}
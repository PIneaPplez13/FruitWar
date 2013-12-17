package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class RocketLauncherPickup extends Entity
	{
		[Embed(source = "/../assets/RocketLauncherPickup.png")] 
		private const ROCKETLAUNCHERPICKUP:Class;

		public var sprRocketLauncherPickup:Image = new Image(ROCKETLAUNCHERPICKUP);

		public function RocketLauncherPickup(INx:Number, INy:Number)
		{
			graphic = sprRocketLauncherPickup;

			setHitbox(70, 28);
			type = "RocketLauncherPickup"

			x = INx;
			y = INy;
		}
		override public function update():void
		{																	
			layer = 10000000000;
		}
	}
}
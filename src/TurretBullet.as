package
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class TurretBullet extends Entity
	{
		[Embed(source = "/../assets/TurretBullet.png")] private const IMAGE:Class;
		
		private var HorizontalVelocity:Number;
		
		private var VerticalVelocity:Number;
		
		public function TurretBullet(INx:Number, INy:Number, horizontalvelocity:Number, verticalvelocity:Number)
		{
			x = INx;
			y = INy;
			graphic = new Image(IMAGE);
			
			setHitbox(3, 3);
			type = "Bullet";
			
			HorizontalVelocity = horizontalvelocity;
			VerticalVelocity = verticalvelocity;
		}
		override public function update():void
		{
			x += HorizontalVelocity;
			y += VerticalVelocity;
			
			if (collide("Platform", x, y))
			{
				FP.world.remove(this);
			}
			if (collide("Player", x, y))
			{
				FP.world.remove(this);
			}
			layer = -300;
		}
	}
}
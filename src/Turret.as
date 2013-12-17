package
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class Turret extends Entity
	{
		[Embed (source = "/../assets/Turret.png")] private const TURRET:Class;
		
		public var sprTurret:Spritemap;
		
		private var Active:Boolean;
		
		private var OffSet:Number = 0;
		
		private var Patrolling:Boolean;
		
		private var LockOn:Boolean;
		
		private var ButtonName:String;
		
		private var PreviousFrame:Number = -1;
		
		private var BulletX:Number = 5;
		
		private var BulletY:Number = 38;
		
		private var angle:Number = 135;
	
		public function Turret(INx:Number, INy:Number, active:Boolean, offset:Number, patrolling:Boolean, lockon:Boolean, buttonname:String)
		{
			sprTurret = new Spritemap(TURRET, 50, 50);
			sprTurret.add("Active", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 12);
			sprTurret.add("Reloading", [0], 1);
			graphic = sprTurret;
			x = INx;
			y = INy;
		
			Active = active
			
			OffSet = offset;
			
			Patrolling = patrolling;
			
			lockon = LockOn;
			
			ButtonName = buttonname;
		}
		
		override public function update():void
		{
			
			if (Active)
			{
				sprTurret.play("Active");
				if (PreviousFrame != sprTurret.index)
				{
					if (sprTurret.index < 24)
					{	
						angle = sprTurret.index > 12 ? 6.9 * (24 - sprTurret.index) + 45 : 6.9 * sprTurret.index + 45;
						var HorizontalVelocity:Number = Math.cos(angle / (180 / Math.PI));
						var VerticalVelocity:Number = Math.sin(angle / (180 / Math.PI));
						FP.world.add(new TurretBullet(x + 25 + HorizontalVelocity * -25, y + 25 + VerticalVelocity * 25, HorizontalVelocity * -7, VerticalVelocity * 7));
					}
					PreviousFrame = sprTurret.index;
				}
				trace(angle, HorizontalVelocity, VerticalVelocity);
			}
		}
	}
}
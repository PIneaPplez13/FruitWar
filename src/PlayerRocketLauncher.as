package	
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class PlayerRocketLauncher extends Player	
	{
		
		[Embed(source = "/../assets/PlayerRocketLauncher.png")] private const PLAYERROCKETLAUNCHER:Class;
		
		public var sprPlayerRocketLauncher:Spritemap = new Spritemap(PLAYERROCKETLAUNCHER, 70, 50);

		private var graphicImage:Image;

		private var ReloadTime:Number = 120;
		
		public function PlayerRocketLauncher(INx:Number, INy:Number)	
		{
			sprPlayerRocketLauncher.add("PlayerRocketLauncher", [0], 1, true);
			sprPlayerRocketLauncher.add("Firing Rocket", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22], 11, false);

			graphic = sprPlayerRocketLauncher;
			
			x = INx;
			y = INy;
			setHitbox(50, 37, -9, -14);
			type = "Player"
			Name = "PlayerRocketLauncher"
		}
		override public function extraupdate(_x:Number, _y:Number):void	
		{
			if (Input.check(Key.A))Image(graphic).flipped = true;
			if (Input.check(Key.D)) Image(graphic).flipped = false;
	
			if (Input.pressed(Key.SPACE) && (Image(graphic).flipped == false) && (ReloadTime >= 120))
			{
				FP.world.add(new MissileBullet(_x + 54, _y + 24, 8)); 
			}
			if (Input.pressed(Key.SPACE) && (Image(graphic).flipped == true) && (ReloadTime >= 120))
			{
				FP.world.add(new MissileBullet(_x - 16, _y + 24, -8)); 
			} 
			if (Input.pressed(Key.SPACE) && (ReloadTime >= 120))
			{
				ReloadTime = 0; 
				sprPlayerRocketLauncher.play("Firing Rocket", true);
			}
			ReloadTime += 1

			var collidedByX:Boolean = Boolean(collide("Platform",_x, y));
			var collided:Boolean = Boolean(collide("Platform", _x, _y));

			if (collided)	
			{
				if (collidedByX)
				{
					if (_x - x > 0)	x = Math.floor(_x / 50) * 50 + 41;
					else	x = Math.floor(_x / 50 + 1) * 50 - 8;
				}
			}
		}
	}
}
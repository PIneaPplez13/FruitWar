package	
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class PlayerPistol extends Player	
	{
		
		[Embed(source = "/../assets/PlayerPistol.png")] private const PLAYERPISTOL:Class;

		public var sprPlayerPistol:Spritemap = new Spritemap(PLAYERPISTOL, 70, 50);

		private var BulletCount:Number = 8;

		private var ReloadTime:Number = 0;

		private var Recoil:Boolean = false;

		private var RecoilTime:Number = 0;
		
		public function PlayerPistol(INx:Number, INy:Number)	
		{
			sprPlayerPistol.add("Reload", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0], 12, false);
			sprPlayerPistol.add("Recoil", [12, 13, 14, 15, 16, 0], 20, false);	
			graphic = sprPlayerPistol;
			
			x = INx;
			y = INy;
			setHitbox(50, 37, 0, -14);
			type = "Player";
			Name = "PlayerPistol";
		}
		override public function extraupdate(_x:Number, _y:Number):void
		{
			if (Input.check(Key.D)) Image(graphic).flipped = false;
			if (Input.check(Key.A)) Image(graphic).flipped = true;
			if (Input.pressed(Key.SPACE) && (Image(graphic).flipped == true) && (BulletCount > 0) && (Recoil == false))
			{
				FP.world.add(new Bullet(_x - 3, _y + 22, -7));
				BulletCount -= 1;
				sprPlayerPistol.play("Recoil", true, 0);
				Recoil = true;
			}
			if (Input.pressed(Key.SPACE) && (Image(graphic).flipped == false) && (BulletCount > 0) && (Recoil == false))
			{
				FP.world.add(new Bullet(_x + 65, _y + 22, 7));
				BulletCount -= 1;
				sprPlayerPistol.play("Recoil", true, 0);
				Recoil = true;
			}
			if (Recoil == true) RecoilTime += 1;
			if (RecoilTime == 18)
			{
				RecoilTime = 0;
				Recoil = false;
			}
			if (BulletCount <= 0 && Recoil == false) 
			{
				sprPlayerPistol.play("Reload", ReloadTime == 0);
				ReloadTime += 1;
			}
			if (ReloadTime == 65)
			{
				BulletCount += 8;
				ReloadTime = 0;
			}			

			/*if (collided)	
			{
				if (collidedByY || _y - y < 0)	
				{
					if (_y - y > 0)	y = Math.floor(_y / 50) * 50 - 1;
				}
				if (collidedByX)
				{
					else	x = Math.floor(_x / 50 + 1) * 50 + 1;
				}
			}*/
		}
	}
}
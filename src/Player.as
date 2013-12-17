package
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;

	public class Player extends Entity	
	{
		[Embed(source = "/../assets/Player.png")] private const IMAGE:Class;
		
		private var gravity:Number = 0;
		
		private var oldCollided:Boolean = false;
		
		private var velX:Number = 0;
		
		private var Sliding:Boolean = false;

		private var framesToDeath:Number = 0;

		private var ContainerWorld:World;
		
		protected var Name:String;
		
		private var InMortalPeril:Boolean = false;

		public function Player(INx:Number=75, INy:Number=200)
		{
			graphic = new Image(IMAGE);
			x = INx;
			y = INy;
			setHitbox(50, 37, 0, -14);
			type = "Player"
		}
		public function extraupdate(_x:Number, _y:Number):void	{}
		override public function update():void	
		{
			ContainerWorld = FP.world;	
			var _x:Number = x;
			var _y:Number = y;
			
			if ((collide("Platform", x, y + 2) && Input.pressed(Key.W))) gravity = -8.5;
			if (Input.check(Key.A))velX -= 0.35;
			if (Input.check(Key.D))	velX += 0.35;
	
			_x += velX;
			velX *= 0.92;
			
			_y += gravity;
			
			var collidedByX:Boolean = Boolean(collide("Platform",_x, y));
			var collidedByY:Boolean = Boolean(collide("Platform", x, _y));
			var collided:Boolean = Boolean(collide("Platform", _x, _y));

			if (collided)	
			{
				oldCollided = true;
				if (collidedByY || _y - y < 0)	
				{
					if (_y - y > 0)	y = Math.floor(_y / 50) * 50 - 1;
					if (collidedByY)	gravity = 0;
				}
				else
				{
					y = _y;
					gravity += 0.3;
				}
				if (collidedByX)
				{
					if (_x - x > 0)	x = Math.floor(_x / 50) * 50;
					else	x = Math.floor(_x / 50 + 1) * 50 + 1;
					velX = 0 * velX;
				}
			}
			else
			{
				gravity += 0.5;
				x = _x;
				y = _y;
				
				if (x > 400)	
				{
					FP.world.camera.x = x - 400;
				}
				else 
				{
					FP.world.camera.x = 0;
				}
				
				oldCollided = false;
			}
			
			if (Image(graphic).tinting > 0) InMortalPeril = true;
			if (Image(graphic).tinting == 0) InMortalPeril = false;
			if (collide("Fire", _x, _y)) 
			{
				Image(graphic).color = 0xFF0000; 
				Image(graphic).tinting = 0.7;
				framesToDeath += 1;
				if (framesToDeath > 25)	
				{
					FP.world.add(new Particles(x + 20, y + 20, addnewPlayer));
					FP.world.remove(this);
				}
			}
			else	
			{
				if (Image(graphic).tinting >= 0.025)	Image(graphic).tinting -= 0.025;
				else	Image(graphic).tinting = 0;
				if (framesToDeath >= 0.5)	framesToDeath -= 0.5;
				else	framesToDeath = 0;
			}
			if (collide("Bullet", x, y))
			{
				Image(graphic).color = 0xFF0000; 
				Image(graphic).tinting = 0.7;
			}
			else 
			{
				if (Image(graphic).tinting >= 0.025)	Image(graphic).tinting -= 0.00005;
				else Image(graphic).tinting = 0;
			}
			if (collide("Bullet", x, y) && InMortalPeril)
			{
				FP.world.add(new Particles(x + 20, y + 20, addnewPlayer));
				FP.world.remove(this);
			}
			if(_y > 750)
			{
				Dead();				
			}

			if (collide("PistolPickup", _x, _y) && (Name != "PlayerPistol"))
			{
				FP.world.remove(this);
				FP.world.add(new PlayerPistol(_x, _y - 1));
			}
			if (collide("RocketLauncherPickup", _x, _y) && (Name != "PlayerRocketLauncher"))
			{
				FP.world.remove(this);
				FP.world.add(new PlayerRocketLauncher(_x, _y - 1));
			}
			
			if (collide("ret", _x, _y))
			{
				FP.world = new GrassWorld1; 
			} 
			
			layer = 128;
			
			extraupdate(_x, _y);
		}
		private function Dead():void
		{
			FP.world.remove(this);
			FP.world.add(new Player);
		}
		private function addnewPlayer():void
		{
			FP.world.add(new Player);
		}
	}
}
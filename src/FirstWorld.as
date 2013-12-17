package
{
	import adobe.utils.CustomActions;
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class FirstWorld extends World
	{
		public function FirstWorld()
		{
			add(new Platform(2));
			add(new Player);
			add(new Tutorial1);
			add(new Tutorial2);
			add(new Tutorial3);
			add(new Tutorial4);
			add(new Tutorial5);
			add(new Tutorial6);
			add(new Tutorial7);
			add(new Tutorial8);
			add(new FireEntity(750, 405));
			add(new FireEntity(800, 405));
			add(new PistolPickup(1350, 370));
			add(new Crate(2050, 350));
			add(new RocketLauncherPickup(2150, 365));
			add(new Crate(2350, 350));
			add(new Turret(2900, 50, true, 0, false, false, "No"));

			FP.screen.color = 0xff99999999;
		}
	}
}
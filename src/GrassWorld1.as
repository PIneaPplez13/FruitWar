package
{
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class GrassWorld1 extends World
	{
		public function GrassWorld1()
		{
			add(new Platform(1));
			add(new Player);
		}
	}
}
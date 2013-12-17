package	
{

	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class UnderGroundWorld1 extends World 
	{
		public var PlayerDeath:Boolean = false;
		
		public function UnderGroundWorld1()	
		{
			add(new Player);
			add(new Platform(0));
			add(new FireEntity(200, 300));
			add(new FireEntity(250, 350));
			add(new FireEntity(1050, 350));
			add(new ret);
		}
	}		
}
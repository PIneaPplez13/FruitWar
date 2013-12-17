package 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class MenuWorld extends World 
	{
		public function MenuWorld() 
		{
			add(new MenuEntity);
			add(new Button(260,220,300,100, startGame));
		}

		public function startGame():void	
		{
			FP.world = new FirstWorld;
		}
	} 
}
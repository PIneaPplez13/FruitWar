package {
	
		import net.flashpunk.Entity;
		import net.flashpunk.graphics.Image;

		public class MenuEntity extends Entity  {

			[Embed(source = "/../assets/MainMenu.png")] private const GRAPHICS:Class;

			public function MenuEntity()	{

				graphic = new Image(GRAPHICS);
			}
		}
}
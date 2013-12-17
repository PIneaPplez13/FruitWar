package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.FP;

	public class Platform extends Entity
	{
		[Embed(source = "/../assets/Platform.png")] private const GRAPHICS:Class;
		
		public static var tilemap:Tilemap;
		public static var grid:Grid = new Grid(4000, 600, 50, 50, 0, 0);
		
		public function Platform(levelIndex:Number)	
		{
			
			tilemap = new Tilemap(GRAPHICS, 4000, 600, 50, 50);
			
			graphic = tilemap;
			mask = grid;
			 
			for (var i:Number = 0; i < Levels.levels[levelIndex].length; i++)	
			{ 
				var blockType:Number = Levels.levels[levelIndex][i];
				var column:Number = i % 80;
				var row:Number = int(i / 80);
				tilemap.setTile(column, row, blockType);
			}
			
			tilemap.createGrid([0, 1, 3, 4], grid);

			type = "Platform";			
		}	
		override public function update():void
		{
			layer = 100;
		}
	}
}
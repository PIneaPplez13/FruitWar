package	{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Christopher Phonis-Phine
	 */
	
	public class Button extends Entity	{
		
		private var hit:Function;
		private var mouseover:Function;
		
		public function Button(INx:Number, INy:Number, INwidth:Number, INheight:Number, onClick:Function, onMouseOver:Function = null)	{
			
			hit = onClick;
			mouseover = onMouseOver;
			
			x = INx;
			y = INy;
			setHitbox(INwidth, INheight);
			
			type = "Button";
			
		}
		
		override public function update():void	{
			
			var mouse:Entity = new Entity(Input.mouseX, Input.mouseY);
			
			if (mouse.collideWith(this, mouse.x, mouse.y))	{
				if (Input.mousePressed && hit != null)	hit();
				else if (mouseover != null)	mouseover();
			}
			
		}
		
	}
	
}
package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;

	public class ret extends Entity
	{
		[Embed(source = "/../assets/ret.png")] 
		private const RET:Class;

		public var sprRet:Spritemap = new Spritemap(RET, 50, 50);

		public function ret()
		{
			sprRet.add("ret", [0, 1, 2, 3], 16, true);
			graphic = sprRet;

			sprRet.play("ret");

			setHitbox(50, 50);
			type = "ret"

			x = 3400;
			y = 0;
		}
	}
}
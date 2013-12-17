package	{

	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.*;

	public class Particles extends Entity	{

		private var emitter:Emitter;
		private var doneFunc:Function;

		public function Particles(x:Number, y:Number, whenDone:Function=null, size:Number=100)	{

			emitter = new Emitter(new BitmapData(1, 1), 1, 1);
			emitter.newType("emit", [0]);
			emitter.setAlpha("emit", 1, 0);
			emitter.setMotion("emit", 0, 50, 2, 360, -40, -0.5, Ease.quadOut);
			emitter.relative = false;
			graphic = emitter;

			doneFunc = whenDone;

			for (var i:Number=0; i<size; i++)	{

				emitter.emit("emit", x, y);

			}

		}

		override public function update():void	{

			if (emitter.particleCount == 0)	{

				if (doneFunc != null)	doneFunc();
				FP.world.remove(this);

			}

		}

	}

}
package others
{
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	public class ImageLoader extends Sprite
	{
		private var _loader:Loader;
		private var w:Number;
		private var h:Number;
		
		public function ImageLoader(_w:Number, _h:Number, url:String)
		{
			super();
			
			this.w = _w;
			this.h = _h;
			
			_loader = new Loader();
			
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			
			_loader.load(new URLRequest(url));
			
		}
		
		
		private function completeHandler(e:Event):void {
			var loader:Loader = Loader(e.target.loader);
			var bitmap:Bitmap = Bitmap(loader.content);
			
			//          var bitmap:Bitmap = e.currentTarget.content as Bitmap;
			//          trace(bitmap);
			
			
			bitmap.x = 0;
			bitmap.y = 0;
			bitmap.width = w;
			bitmap.width = h;
			
			this.addChild(bitmap);
		}
	}
}
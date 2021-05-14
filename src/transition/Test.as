package transition
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Test extends MovieClip
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var movie:Loader;
		public function Test()
		{
			super();
			movie = new Loader();
			movie.load(new URLRequest("materials/Interview.swf"));
			movie.contentLoaderInfo.addEventListener(Event.COMPLETE, setM);
			
			
		}
		
		protected function setM(event:Event):void
		{
			// TODO Auto-generated method stub
			movie.width = stage.stageWidth;
			movie.height = stage.stageHeight;
			addChild(movie);
			movie.contentLoaderInfo.removeEventListener(Event.COMPLETE, setM);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			// TODO Auto-generated method stub
			if(testOver(event)){
				close();
			}
		}
		
		private function testOver(event:Event):Boolean{
			if(currentFrame == totalFrames){
				return true;
			}else{
				return false;
			}
		}
		
		public function close():void{
			removeChild(movie);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(Test.PAGE_CLOSE));
		}
	}
}
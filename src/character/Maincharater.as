package character
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	

	public class Maincharater extends Loader
	{
		//public var mc:Loader;
		private var _x:Number;
		private var _y:Number;
		private var bg:Loader;
		
		public static const FINISHLOADING:String = "finishloading";
		
		public function Maincharater()
		{
			super();
			
			this.load(new URLRequest("image/character/Boy.png"));
			this.contentLoaderInfo.addEventListener(Event.COMPLETE, setMC);
		}
		
		private function setMC(e:Event):void{
			/*stage.addEventListener(KeyboardEvent.KEY_DOWN, characterMove);
			stage.addEventListener(KeyboardEvent.KEY_UP, characterStopMove);
			stage.addEventListener(MouseEvent.CLICK, characterMoveByMouse);*/
			this.contentLoaderInfo.removeEventListener(Event.COMPLETE, setMC);
			dispatchEvent(new Event(Maincharater.FINISHLOADING));
		}
	}
}
package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	public class VanityforKnife extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var nextButton:Loader;
		
		public function VanityforKnife()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_VanityforKnife.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			nextButton = new Loader();
			nextButton.load(new URLRequest("image/objects/startbutton.png"));
			nextButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setNB);
		}
		
		private function setNB(e:Event):void{
			nextButton.x = gameBG.width * 0.08;
			nextButton.y = gameBG.height * 0.8;
			nextButton.width = gameBG.width * 0.295;
			nextButton.height = gameBG.height * 0.1;
			nextButton.addEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			
			addChild(nextButton);
			nextButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setNB);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function sbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			nextButton.addEventListener(MouseEvent.MOUSE_OUT, sbOut);
			nextButton.addEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function sbOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			nextButton.removeEventListener(MouseEvent.MOUSE_OUT, sbOut);
			nextButton.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function onEnterFrame(event:Event):void{
			//movedialog();
			reSize();
			
		}
		
		private function close(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			dispatchEvent(new Event(VanityforKnife.PAGE_CLOSE));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
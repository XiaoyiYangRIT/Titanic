package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	public class HallwayIn extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var nextButton:Loader;
		private var nextButtonOver:Loader;
		
		public function HallwayIn()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_Hallway.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			nextButton = new Loader();
			nextButton.load(new URLRequest("image/SmallBtns/Next_1.png"));
			nextButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setNB);
			nextButtonOver = new Loader();
			nextButtonOver.load(new URLRequest("image/SmallBtns/Next_2.png"));
			nextButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setNBO);
		}
		
		protected function setNBO(event:Event):void
		{
			// TODO Auto-generated method stub
			nextButtonOver.x = gameBG.width * 0.6;
			nextButtonOver.y = gameBG.height * 0.4;
			nextButtonOver.width = gameBG.width * 0.3;
			nextButtonOver.height = gameBG.height * 0.2;
			nextButtonOver.visible = false;
			nextButtonOver.addEventListener(MouseEvent.MOUSE_OUT, nboOut);
			nextButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			addChild(nextButtonOver);
			nextButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setNBO);
		}
		
		
		private function nboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			nextButton.visible = true;
			nextButtonOver.visible = false;
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function setNB(e:Event):void{
			nextButton.x = gameBG.width * 0.6;
			nextButton.y = gameBG.height * 0.4;
			nextButton.width = gameBG.width * 0.3;
			nextButton.height = gameBG.height * 0.2;
			nextButton.addEventListener(MouseEvent.MOUSE_OVER, nbRollover);
			
			addChild(nextButton);
			nextButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setNB);
		}
		
		private function nbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			nextButton.visible = false;
			nextButtonOver.visible = true;
		}
		
		private function onEnterFrame(event:Event):void{
			//movedialog();
			reSize();
			
		}
		
		private function close(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			dispatchEvent(new Event(HallwayIn.PAGE_CLOSE));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
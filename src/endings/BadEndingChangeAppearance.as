package endings
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Typewriter;
	
	public class BadEndingChangeAppearance extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		
		private var gameBG:Loader;
		private var creditBG:Loader;
		
		private var anotherMicheal:Loader;
		
		private var speaking:Typewriter;
		
		public var scenario1:Loader;
		public var scenario1Over:Loader;
		
		
		public function BadEndingChangeAppearance()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/Grampa_room.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
			
			creditBG = new Loader();
			creditBG.load(new URLRequest("image/scene/LastPageBookCredits.jpg"));
			creditBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setcBG);
		}
		
		protected function setcBG(event:Event):void
		{
			// TODO Auto-generated method stub
			creditBG.width = stage.stageWidth;
			creditBG.height = stage.stageHeight;
			creditBG.visible = false;
			addChild(creditBG);
			creditBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setcBG);
		}
		
		private function initButton():void{
			scenario1 = new Loader();
			scenario1.load(new URLRequest("image/SmallBtns/PlayAgain_1.png"));
			scenario1.contentLoaderInfo.addEventListener(Event.COMPLETE, sets1);
			
			scenario1Over = new Loader();
			scenario1Over.load(new URLRequest("image/SmallBtns/PlayAgain_2.png"));
			scenario1Over.contentLoaderInfo.addEventListener(Event.COMPLETE, sets1O);
			
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			anotherMicheal = new Loader();
			anotherMicheal.load(new URLRequest("image/character/AlternateMichael.png"));
			anotherMicheal.contentLoaderInfo.addEventListener(Event.COMPLETE, setAM);
			
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function setAM(event:Event):void
		{
			// TODO Auto-generated method stub
			anotherMicheal.width = stage.stageWidth*0.2;
			anotherMicheal.height = stage.stageHeight*0.7;
			anotherMicheal.x= stage.stageWidth * 0.5;
			anotherMicheal.y = stage.stageHeight * 0.2;
			addChild(anotherMicheal);
			anotherMicheal.contentLoaderInfo.removeEventListener(Event.COMPLETE, setAM);
			
			setDialog();
		}		
		
		private function setDialog():void{
			speaking = new Typewriter('finalending2',0, gameBG.height * 0.8, gameBG.width, gameBG.height);
			speaking.x = 0;
			speaking.y = gameBG.height * 0.4;
			addChild(speaking);
			speaking.play();
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
		}
		
		
		private function keypress(e:KeyboardEvent):void{
			if(!speaking.typeover){
				speaking.typeTimer.stop();
				speaking.typeover = true;
				speaking.diaContent.text = speaking.curdia;
				speaking.diaContent.setTextFormat(speaking.formatter);
			}else{
				goback();
			}
		}
		
		private function mouseclick(e:MouseEvent):void{
			if(!speaking.typeover){
				speaking.typeTimer.stop();
				speaking.typeover = true;
				speaking.diaContent.text = speaking.curdia;
				speaking.diaContent.setTextFormat(speaking.formatter);
			}else{
				goback();
			}
			
		}
		
		private function onEnterFrame(event:Event):void{
			//movedialog();
			reSize();
		}
		
		
		private function goback():void{
			cleanDialog();
			initButton();
			creditBG.visible = true;
			gameBG.visible = false;
			anotherMicheal.visible = false;
		}
		
		protected function sets1O(event:Event):void
		{
			// TODO Auto-generated method stub
			scenario1Over.width = gameBG.width * 0.17;
			scenario1Over.height = gameBG.height * 0.15;
			scenario1Over.x = gameBG.width * 0.28;
			scenario1Over.y = gameBG.height * 0.35 - scenario1Over.height * 0.5;
			scenario1Over.visible = false;
			scenario1Over.addEventListener(MouseEvent.MOUSE_OUT, s1Out);
			scenario1Over.addEventListener(MouseEvent.MOUSE_UP, close);
			
			addChild(scenario1Over);
			scenario1Over.contentLoaderInfo.removeEventListener(Event.COMPLETE, sets1O);
		}
		
		private function s1Out(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			scenario1.visible = true;
			scenario1Over.visible = false;
		}
		
		private function sets1(e:Event):void{
			scenario1.width = gameBG.width * 0.17;
			scenario1.height = gameBG.height * 0.15;
			scenario1.x = gameBG.width * 0.28;
			scenario1.y = gameBG.height * 0.35 - scenario1.height * 0.5;
			scenario1.addEventListener(MouseEvent.MOUSE_OVER, s1Rollover);
			
			addChild(scenario1);
			scenario1.contentLoaderInfo.removeEventListener(Event.COMPLETE, sets1);
		}
		
		private function s1Rollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			scenario1.visible = false;
			scenario1Over.visible = true;
		}
		
		
		
		
		protected function close(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(BadEndingDisappear.PAGE_CLOSE1));
					
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
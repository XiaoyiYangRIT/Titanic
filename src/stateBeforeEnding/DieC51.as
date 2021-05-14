package stateBeforeEnding
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import behavior.Typewriter;
	
	public class DieC51 extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var speaking:Typewriter;
		
		public function DieC51()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/escapeFromTitanic.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function setDialog():void{
			speaking = new Typewriter('dc51',0, gameBG.height * 0.8, gameBG.width, gameBG.height * 0.8);
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
				close();
			}
		}
		
		private function mouseclick(e:MouseEvent):void{
			if(!speaking.typeover){
				speaking.typeTimer.stop();
				speaking.typeover = true;
				speaking.diaContent.text = speaking.curdia;
				speaking.diaContent.setTextFormat(speaking.formatter);
			}else{
				close();
			}
			
		}
		
		private function onEnterFrame(event:Event):void{
			//movedialog();
			reSize();
			
		}
		
		
		private function close():void{
			cleanDialog();
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(DieC51.PAGE_CLOSE));
			
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
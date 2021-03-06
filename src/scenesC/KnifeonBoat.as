package scenesC
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	
	public class KnifeonBoat extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		
		public var isEmpty:Boolean;
		
		public function KnifeonBoat()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/C_Lifeboat.png"));
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
			diashift = true;
			diadown = false;
			speaking = new Dialogue('kob', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			diashift = false;
			
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
		}
		
		private function keypress(e:KeyboardEvent):void{
			if(!diadown && diashift && speaking.diaContent){
				diadown = true;
				diashift = true;
			}
		}
		
		private function mouseclick(e:MouseEvent):void{
			if(!diadown && diashift){
				diadown = true;
				diashift = true;
			}
		}
		
		
		private function onEnterFrame(event:Event):void{
			
			reSize();
			movedialog(event);
		}
		
		private function movedialog(event:Event):void{
			one: 
			if(diashift){
				//*************??????****************
				if(diadown){
					speaking.y += 20;
					speaking.diaContent.y += 20;
					//*********????????????**********
					if(speaking.y >= stage.stageHeight){
						diadown = false;
						speaking.count++;
						//*****??????????????????******
						if(!isEmpty){
							if(speaking.count == speaking.curdia.length - 1){
								cleanDialog();
								break one;
							}
						}else{
							if(speaking.count == speaking.curdia.length){
								cleanDialog();
								close(event);
								break one;
							}
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
				}
				//*************????????????***********
				if(speaking.y < gameBG.height * 0.8){
					speaking.y = gameBG.height * 0.8;
				}
			}
		}
		
		public function close(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			if(e.type == "itemClick1"){
				dispatchEvent(new Event(KnifeonBoat.PAGE_CLOSE1));
			}else{
				dispatchEvent(new Event(KnifeonBoat.PAGE_CLOSE2));
			}
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
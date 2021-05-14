package scenesB
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	public class NightDeck extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		public function NightDeck()
		{
			super();
			init();
		}
		
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/FrontDeck.jpg"));
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
			speaking = new Dialogue('nd', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
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
			movedialog();
		}
		
		private function movedialog():void{
			one: 
			if(diashift){
				//*************下降****************
				if(diadown){
					speaking.y += 20;
					speaking.diaContent.y += 20;
					//*********判断到底**********
					if(speaking.y >= stage.stageHeight){
						diadown = false;
						speaking.count++;
						//*****判断对话结束******
						if(speaking.count == speaking.curdia.length){
							cleanDialog();
							close();
							break one;
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
				}
				//*************坐标重设***********
				if(speaking.y < gameBG.height * 0.8){
					speaking.y = gameBG.height * 0.8;
				}
			}
		}
		
		private function close():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(NightDeck.PAGE_CLOSE));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
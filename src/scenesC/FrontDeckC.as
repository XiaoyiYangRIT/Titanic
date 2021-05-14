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
	
	public class FrontDeckC extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var upStairButton:Loader;
		private var upStairButtonOver:Loader;
		
		private var downStairButton:Loader;
		private var downStairButtonOver:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//***************判断之前场景************
		public var preS:Boolean;
		
		public function FrontDeckC()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/FlagDeck_Rebecca_Waiter.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			upStairButton = new Loader();
			upStairButton.load(new URLRequest("image/SmallBtns/HelpGerman_2.png"));
			upStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSB);
			
			upStairButtonOver = new Loader();
			upStairButtonOver.load(new URLRequest("image/SmallBtns/HelpGerman_1.png"));
			upStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSBO);
			
			downStairButton = new Loader();
			downStairButton.load(new URLRequest("image/SmallBtns/HelpRebecca_2.png"));
			downStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSB);
			
			downStairButtonOver = new Loader();
			downStairButtonOver.load(new URLRequest("image/SmallBtns/HelpRebecca_1.png"));
			downStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSBO);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		protected function setUSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			upStairButtonOver.x = gameBG.width * 0.05;
			upStairButtonOver.y = gameBG.height * 0.4;
			upStairButtonOver.width = gameBG.width * 0.3;
			upStairButtonOver.height = gameBG.height * 0.2;
			upStairButtonOver.visible = false;
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			addChild(upStairButtonOver);
			upStairButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setUSBO);
		}
		
		
		private function usboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			upStairButton.visible = true;
			upStairButtonOver.visible = false;
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function setUSB(e:Event):void{
			upStairButton.x = gameBG.width * 0.05;
			upStairButton.y = gameBG.height * 0.4;
			upStairButton.width = gameBG.width * 0.3;
			upStairButton.height = gameBG.height * 0.2;
			upStairButton.addEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			upStairButton.visible = false;
			
			addChild(upStairButton);
			upStairButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setUSB);
		}
		
		private function usbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			upStairButton.visible = false;
			upStairButtonOver.visible = true;
		}
		protected function setDSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			downStairButtonOver.x = gameBG.width * 0.6;
			downStairButtonOver.y = gameBG.height * 0.4;
			downStairButtonOver.width = gameBG.width * 0.3;
			downStairButtonOver.height = gameBG.height * 0.2;
			downStairButtonOver.visible = false;
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, dsboOut);
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			addChild(downStairButtonOver);
			downStairButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDSBO);
		}
		
		
		private function dsboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			downStairButton.visible = true;
			downStairButtonOver.visible = false;
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function setDSB(e:Event):void{
			downStairButton.x = gameBG.width * 0.6;
			downStairButton.y = gameBG.height * 0.4;
			downStairButton.width = gameBG.width * 0.3;
			downStairButton.height = gameBG.height * 0.2;
			downStairButton.visible = false;
			downStairButton.addEventListener(MouseEvent.MOUSE_OVER, dsbRollover);
			
			addChild(downStairButton);
			downStairButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDSB);
		}
		
		private function dsbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			downStairButton.visible = false;
			downStairButtonOver.visible = true;
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			
			if(preS){
				speaking = new Dialogue('fdc1', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			}else{
				speaking = new Dialogue('fdc2', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			}
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
		
		//****************有选择版本********************
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
							downStairButton.visible = true;
							upStairButton.visible = true;
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
		
		private function close(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			switch(e.target){
				case upStairButtonOver:
					dispatchEvent(new Event(FrontDeckC.PAGE_CLOSE1));
					break;
				case downStairButtonOver:
					dispatchEvent(new Event(FrontDeckC.PAGE_CLOSE2));
					break;
				default:
					break;
			}
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
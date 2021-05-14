package scenesC
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	public class HelpGermanonBoat extends Sprite
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
		//*****************第几段对话************
		private var numberD:int;
		//****************选的哪一个************
		private var whichOne:int;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		
		
		public function HelpGermanonBoat()
		{
			super();
			init();
		}
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/lowingBoat.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			upStairButton = new Loader();
			upStairButton.load(new URLRequest("image/SmallBtns/LoweringStop_2.png"));
			upStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSB);
			
			upStairButtonOver = new Loader();
			upStairButtonOver.load(new URLRequest("image/SmallBtns/LoweringStop_1.png"));
			upStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSBO);
			
			downStairButton = new Loader();
			downStairButton.load(new URLRequest("image/SmallBtns/LoweringContinue_2.png"));
			downStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSB);
			
			downStairButtonOver = new Loader();
			downStairButtonOver.load(new URLRequest("image/SmallBtns/LoweringContinue_1.png"));
			downStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSBO);
			
			soundFactory = new Sound(new URLRequest("materials/lowBoat.mp3"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
			
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
			song.addEventListener(Event.SOUND_COMPLETE,onComplete);
		}
		
		private function onComplete(eve:Event):void
		{
			song = soundFactory.play();
			song.addEventListener(Event.SOUND_COMPLETE,onComplete);
		}
		
		protected function setUSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			
			upStairButtonOver.width = gameBG.width * 0.3;
			upStairButtonOver.height = gameBG.height * 0.3;
			upStairButtonOver.x = gameBG.width * 0.5 - upStairButtonOver.width * 0.5;
			upStairButtonOver.y = gameBG.height * 0.2;
			upStairButtonOver.visible = false;
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, nextDia);
			
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
			
			upStairButton.width = gameBG.width * 0.3;
			upStairButton.height = gameBG.height * 0.3;
			upStairButton.x = gameBG.width * 0.5 - upStairButton.width * 0.5;
			upStairButton.y = gameBG.height * 0.2;
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
			
			downStairButtonOver.width = gameBG.width * 0.3;
			downStairButtonOver.height = gameBG.height * 0.3;
			downStairButtonOver.x = gameBG.width * 0.5 - downStairButtonOver.width * 0.5;
			downStairButtonOver.y = gameBG.height * 0.6;
			downStairButtonOver.visible = false;
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, dsboOut);
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, nextDia);
			
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
			
			downStairButton.width = gameBG.width * 0.3;
			downStairButton.height = gameBG.height * 0.3;
			downStairButton.x = gameBG.width * 0.5 - downStairButton.width * 0.5;
			downStairButton.y = gameBG.height * 0.6;
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
			numberD = 1;
			speaking = new Dialogue('hgb', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			
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
		
		//****************有选择版本********************
		private function movedialog(event:Event):void{
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
							if(numberD == 1){
								cleanDialog();
								downStairButton.visible = true;
								upStairButton.visible = true;
							}else if(numberD == 2){
								cleanDialog();
								close(event);
							}
							
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
		
		protected function nextDia(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			downStairButtonOver.visible = false;
			upStairButtonOver.visible = false;
			downStairButton.visible = false;
			upStairButton.visible = false;
			upStairButton.removeEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, nextDia);
			downStairButton.removeEventListener(MouseEvent.MOUSE_OVER, dsbRollover);
			downStairButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, dsboOut);
			downStairButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, nextDia);
			
			Mouse.cursor = "arrow";
			
			switch(event.target){
				case upStairButtonOver:
					whichOne = 1;
					diashift = true;
					diadown = false;
					numberD = 2;
					speaking = new Dialogue('hgbstop', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					
					addChild(speaking);
					addEventListener(MouseEvent.CLICK, mouseclick);
					addEventListener(KeyboardEvent.KEY_DOWN, keypress);
					break;
				case downStairButtonOver:
					whichOne = 2;
					diashift = true;
					diadown = false;
					numberD = 2;
					speaking = new Dialogue('hgbnonstop', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					
					addChild(speaking);
					addEventListener(MouseEvent.CLICK, mouseclick);
					addEventListener(KeyboardEvent.KEY_DOWN, keypress);
					break;
				default:
					break;
			}
		}
		
		private function close(event:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			song.stop();
			
			switch(whichOne){
				case 1:
					dispatchEvent(new Event(HelpGermanonBoat.PAGE_CLOSE1));
					break;
				case 2:
					dispatchEvent(new Event(HelpGermanonBoat.PAGE_CLOSE2));
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
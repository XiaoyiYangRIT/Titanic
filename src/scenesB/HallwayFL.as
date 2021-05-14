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
	
	public class HallwayFL extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var flashlight:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********第几个出现选择**********
		private var numberS:int;
		
		public function HallwayFL()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_B_RebeccaTalk.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			flashlight = new Loader();
			flashlight.load(new URLRequest("image/objects/B_FlashLight.png"));
			flashlight.contentLoaderInfo.addEventListener(Event.COMPLETE, setR);
			setDialog();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function setR(event:Event):void{
			flashlight.width = gameBG.width * 0.4;
			flashlight.height = gameBG.height * 0.4;
			flashlight.x = gameBG.width * 0.5 - flashlight.width * 0.5;
			flashlight.y = gameBG.height * 0.5 - flashlight.height * 0.5;
			//flashlight.visible = false;
			
			addChild(flashlight);
			flashlight.contentLoaderInfo.removeEventListener(Event.COMPLETE, setR);
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberS = 1;
			speaking = new Dialogue('flashlight', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			speaking.addEventListener(Dialogue.DIASELECT3, diaS);
			speaking.addEventListener(Dialogue.DIASELECT4, diaS);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			diashift = false;
			speaking.removeEventListener(Dialogue.DIASELECT1, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT2, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT3, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT4, diaS);
			
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
		}
		
		private function diaS(e:Event):void{
			if(!diadown && diashift && speaking.diaContent){
				diadown = true;
				diashift = true;
			}
			switch(e.type){
				case "diaselect1":
					dias = 1;
					break;
				case "diaselect2":
					dias = 2;
					break;
				case "diaselect3":
					dias = 3;
					break;
				case "diaselect4":
					dias = 4;
					break;
				default:
					dias = 0;
					break;
			}
			flashlight.visible = false;
			speaking.removeMouseListener();
			speaking.diaContent.textColor = 0x000000;
			stage.addEventListener(MouseEvent.CLICK, mouseclick);
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
							close(dias);
							break one;
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
						
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
					//*********出现选择时移除监听***********
					if(speaking.count == numberS){
						flashlight.visible = true;
						speaking.addMouseListener();
						speaking.diaContent.textColor = 0xFF0000;
						removeEventListener(MouseEvent.CLICK, mouseclick);
					}
				}
				//*************坐标重设***********
				if(speaking.y < gameBG.height * 0.8){
					speaking.y = gameBG.height * 0.8;
				}
			}
		}
		
		private function close(a:int):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			switch(a){
				case 1:
				case 4:
					dispatchEvent(new Event(HallwayFL.PAGE_CLOSE1));
					break;
				case 2:
				case 3:
					dispatchEvent(new Event(HallwayFL.PAGE_CLOSE2));
					break;
				default:
					//throw();
					trace('something wrong!!');
					break;
			}
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	public class HallwayOut extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var paperclip:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********当前第几段对话*********
		private var numberD:int;
		//**********第几个出现选择**********
		private var numberS:int;
		
		public function HallwayOut()
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
			
			paperclip = new Loader();
			paperclip.load(new URLRequest("image/objects/A_PaperClip.png"));
			paperclip.contentLoaderInfo.addEventListener(Event.COMPLETE, setPC);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function setPC(event:Event):void
		{
			// TODO Auto-generated method stub
			paperclip.width = gameBG.width * 0.4;
			paperclip.height = gameBG.height * 0.4;
			paperclip.x = gameBG.width * 0.5 - paperclip.width * 0.5;
			paperclip.y = gameBG.height * 0.5 - paperclip.height * 0.5;
			//paperclip.visible = false;
			
			addChild(paperclip);
			paperclip.contentLoaderInfo.removeEventListener(Event.COMPLETE, setPC);
		}
		
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 1;
			numberS = 1;
			speaking = new Dialogue('paperclip', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
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
			speaking.diaContent.textColor = 0x000000;
			speaking.removeMouseListener();
			addEventListener(MouseEvent.CLICK, mouseclick);
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
						if(numberD == 1){
							if(speaking.count == speaking.curdia.length){
								cleanDialog();
								close();
								break one;
							}
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
						
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
					//*********出现选择时移除监听***********
					if(speaking.count == numberS){
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
		
		private function close():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			switch(dias){
				case 2:
				case 4:
					dispatchEvent(new Event(HallwayOut.PAGE_CLOSE1));
					break;
				case 1:
				case 3:
					dispatchEvent(new Event(HallwayOut.PAGE_CLOSE2));
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
package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import behavior.Dialogue;
	
	public class Opt1Room extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var manager:Loader;
		
		private var dress:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********当前第几段对话*********
		private var numberD:int;
		//**********第几个出现选择**********
		private var numberS:int;
		
		public function Opt1Room()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_Opt1_Room.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			
			dress = new Loader();
			dress.load(new URLRequest("image/objects/MissParker_NewDress.png"));
			dress.contentLoaderInfo.addEventListener(Event.COMPLETE, setDS);
			
			manager = new Loader();
			manager.load(new URLRequest("image/character/Waiter.png"));
			manager.contentLoaderInfo.addEventListener(Event.COMPLETE, setMN);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function setMN(event:Event):void
		{
			// TODO Auto-generated method stub
			manager.width = gameBG.width * 0.3;
			manager.height = gameBG.height * 1;
			manager.x = gameBG.width * 0.1;
			manager.y = gameBG.height * 0.2;
			addChild(manager);
			manager.contentLoaderInfo.removeEventListener(Event.COMPLETE, setMN);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function setDS(e:Event):void{
			dress.width = gameBG.width * 0.3;
			dress.height = gameBG.height * 0.6;
			dress.x = gameBG.width * 0.5 - dress.width * 0.5;
			dress.y = gameBG.height * 0.5 - dress.height * 0.5;
			dress.visible = false;
			
			addChild(dress);
			dress.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDS);
		}
		
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 1;
			numberS = 3;
			speaking = new Dialogue('o1r', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT3, );
			//speaking.addEventListener(Dialogue.DIASELECT4, );
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		
		private function cleanDialog():void{
			diashift = false;
			speaking.removeEventListener(Dialogue.DIASELECT1, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT2, diaS);
			//speaking.removeEventListener(Dialogue.DIASELECT3, );
			//speaking.removeEventListener(Dialogue.DIASELECT4, );
			
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
				/*case "diaselect3":
					dias = 3;
					break;
				case "diaselect4":
					dias = 4;
					break;*/
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
							if(speaking.count == (dias == 2 ? speaking.curdia.length : speaking.curdia.length - 1)){
								cleanDialog();
								if(dias == 1){
									speaking = null;
									close(dias);
									//goto two;
								}else{
									speaking = null;
									close(dias);
								}
								break one;
							}
						}
						//******对话分支选择*****
						if(dias == 1){
							dress.visible = true;
						}
						if(dias == 2){
							speaking.count++;
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
						
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
					//*********出现选择时移除监听***********
					if(speaking.count == numberS){
						speaking.diaContent.textColor = 0xFF0000;
						speaking.addMouseListener();
						removeEventListener(MouseEvent.CLICK, mouseclick);
					}
				}
				//*************坐标重设***********
				if(speaking.y < gameBG.height * 0.8){
					speaking.y = gameBG.height * 0.8;
				}
			}
		}
		
		private function close(i:int):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			dispatchEvent(new Event((dias == 1 ? Opt1Room.PAGE_CLOSE1 : Opt1Room.PAGE_CLOSE2)));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
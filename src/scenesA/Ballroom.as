package scenesA
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
	
	
	public class Ballroom extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE21:String = "pageClose21";
		public static const PAGE_CLOSE22:String = "pageClose22";
		
		private var gameBG:Loader;
		
		private var manager:Loader;
		
		private var knife:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********当前第几段对话*********
		private var numberD:int;
		//**********第几个出现选择**********
		private var numberS:int;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		public function Ballroom()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/C_Ballroom.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			knife = new Loader();
			knife.load(new URLRequest("image/objects/A_Knife.png"));
			knife.contentLoaderInfo.addEventListener(Event.COMPLETE, setKF);
			
			
			manager = new Loader();
			manager.load(new URLRequest("image/character/Steven_NoTie.png"));
			manager.contentLoaderInfo.addEventListener(Event.COMPLETE, setMN);
			
			soundFactory = new Sound(new URLRequest("materials/ball_sound_mixdown.mp3"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
			
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
		
		protected function setMN(event:Event):void
		{
			// TODO Auto-generated method stub
			manager.width = gameBG.width * 0.3;
			manager.height = gameBG.height * 1;
			manager.x = gameBG.width * 0.6;
			manager.y = gameBG.height * 0.2;
			addChild(manager);
			manager.contentLoaderInfo.removeEventListener(Event.COMPLETE, setMN);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function setKF(e:Event):void{
			knife.width = gameBG.width * 0.4;
			knife.height = gameBG.height * 0.4;
			knife.x = gameBG.width * 0.5 - knife.width * 0.5;
			knife.y = gameBG.height * 0.5 - knife.height * 0.5;
			knife.visible = false;
			
			addChild(knife);
			knife.contentLoaderInfo.removeEventListener(Event.COMPLETE, setKF);
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 1;
			numberS = 4;
			speaking = new Dialogue('br', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			diashift = false;
			speaking.removeEventListener(Dialogue.DIASELECT1, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT2, diaS);
			
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
		}
		
		private function setDialog1():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 2;
			numberS = 1;
			speaking = new Dialogue('swissknife', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			speaking.addEventListener(Dialogue.DIASELECT3, diaS);
			speaking.addEventListener(Dialogue.DIASELECT4, diaS);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog1():void{
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
			if(numberD == 2){
				knife.visible = false;
			}
			speaking.diaContent.textColor = 0x000000;
			addEventListener(MouseEvent.CLICK, mouseclick);
			speaking.removeMouseListener();
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
							if(speaking.count == (dias == 2 ? speaking.curdia.length : speaking.curdia.length - 1)){
								cleanDialog();
								if(dias == 1){
									setDialog1();
									//goto two;
								}else{
									close();
								}
								break one;
							}
						}else if(numberD == 2){
							if(speaking.count == speaking.curdia.length){
								cleanDialog1();
								close();
								break one;
							}
						}
						//******对话分支选择*****
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
						speaking.addMouseListener();
						speaking.diaContent.textColor = 0xFF0000;
						removeEventListener(MouseEvent.CLICK, mouseclick);
						if(numberD == 2){
							knife.visible = true;
						}
					}
				}
				//*************坐标重设***********
				if(speaking.y < gameBG.height * 0.8){
					speaking.y = gameBG.height * 0.8;
				}
			}
		}
		
		
		
		public function close():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			song.stop();
			
			if(numberD == 1){
				dispatchEvent(new Event(Ballroom.PAGE_CLOSE1));
			}else if(numberD == 2){
				switch(dias){
					case 1:
					case 3:
						dispatchEvent(new Event(Ballroom.PAGE_CLOSE21));
						break;
					case 2:
					case 4:
						dispatchEvent(new Event(Ballroom.PAGE_CLOSE22));
						break;
					default:
						break;
				}
				
			}
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
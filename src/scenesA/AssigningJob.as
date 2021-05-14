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
	
	
	public class AssigningJob extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		public static const PAGE_CLOSE1:String = "pageClose1";
		
		private var gameBG:Loader;
		
		private var manager:Loader;
		
		private var insideButton:Loader;
		private var insideButtonOver:Loader;
		private var outsideButton:Loader;
		private var outsideButtonOver:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean = true;
		private var diadown:Boolean = false;
		
		public function AssigningJob()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_AssigningJob.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			manager = new Loader();
			manager.load(new URLRequest("image/character/Mangager.png"));
			manager.contentLoaderInfo.addEventListener(Event.COMPLETE, setMN);
			
			
			
		}
		
		protected function setMN(event:Event):void
		{
			// TODO Auto-generated method stub
			manager.width = gameBG.width * 0.3;
			manager.height = gameBG.height * 1;
			manager.x = gameBG.width * 0.5;
			manager.y = gameBG.height * 0.3;
			manager.visible = false;
			addChild(manager);
			manager.contentLoaderInfo.removeEventListener(Event.COMPLETE, setMN);
			
			speaking = new Dialogue('aj', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypress);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function setIBO(event:Event):void
		{
			// TODO Auto-generated method stub
			insideButtonOver.x = gameBG.width * 0.15;
			insideButtonOver.y = gameBG.height * 0.2;
			insideButtonOver.width = gameBG.width * 0.17;
			insideButtonOver.height = gameBG.height * 0.15;
			insideButtonOver.visible = false;
			insideButtonOver.addEventListener(MouseEvent.MOUSE_OUT, iboOut);
			insideButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			addChild(insideButtonOver);
			insideButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setIBO);
		}
		
		private function iboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			insideButton.visible = true;
			insideButtonOver.visible = false;
		}
		
		private function setIB(e:Event):void{
			insideButton.x = gameBG.width * 0.15;
			insideButton.y = gameBG.height * 0.2;
			insideButton.width = gameBG.width * 0.17;
			insideButton.height = gameBG.height * 0.15;
			insideButton.addEventListener(MouseEvent.MOUSE_OVER, ibRollover);
			
			//this.addChild(sb);
			addChild(insideButton);
			insideButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setIB);
		}
		
		private function ibRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			insideButton.visible = false;
			insideButtonOver.visible = true;
		}
		
		private function keypress(e:KeyboardEvent):void{
			if(!diadown && diashift){
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
		
		
		protected function setOBO(event:Event):void
		{
			// TODO Auto-generated method stub
			outsideButtonOver.x = gameBG.width * 0.6;
			outsideButtonOver.y = gameBG.height * 0.2;
			outsideButtonOver.width = gameBG.width * 0.17;
			outsideButtonOver.height = gameBG.height * 0.15;
			outsideButtonOver.visible = false;
			outsideButtonOver.addEventListener(MouseEvent.MOUSE_OUT, sboOut);
			outsideButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			this.addChild(outsideButtonOver);
			outsideButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setOBO);
		}
		
		private function sboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			outsideButton.visible = true;
			outsideButtonOver.visible = false;
		}
		
		private function setOB(e:Event):void{
			outsideButton.x = gameBG.width * 0.6;
			outsideButton.y = gameBG.height * 0.2;
			outsideButton.width = gameBG.width * 0.17;
			outsideButton.height = gameBG.height * 0.15;
			outsideButton.addEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			
			//this.addChild(sb);
			this.addChild(outsideButton);
			outsideButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setOB);
		}
		
		private function sbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			outsideButton.visible = false;
			outsideButtonOver.visible = true;
		}
		
		private function onEnterFrame(event:Event):void{
			movedialog();
			reSize();
			
		}
		//****************无选择版本********************
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
							diashift = false;
							speaking = null;
							
							insideButton = new Loader();
							insideButton.load(new URLRequest("image/SmallBtns/SettingTables_2.png"));
							insideButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setIB);
							
							insideButtonOver = new Loader();
							insideButtonOver.load(new URLRequest("image/SmallBtns/SettingTables_1.png"));
							insideButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setIBO);
							
							outsideButton = new Loader();
							outsideButton.load(new URLRequest("image/SmallBtns/RoomService_2.png"));
							outsideButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setOB);
							
							outsideButtonOver = new Loader();
							outsideButtonOver.load(new URLRequest("image/SmallBtns/RoomService_1.png"));
							outsideButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setOBO);
							
							break one;
						}
						if(speaking.count == 1){
							manager.visible = true;
						}
						speaking.play();
					}
					//*********上升************
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
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
			//Mouse.cursor = "arrow";
			switch(e.target){
				case insideButtonOver:
					dispatchEvent(new Event(AssigningJob.PAGE_CLOSE));
					break;
				case outsideButtonOver:
					dispatchEvent(new Event(AssigningJob.PAGE_CLOSE1));
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
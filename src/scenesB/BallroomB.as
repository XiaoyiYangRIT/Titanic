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
	
	import scenesC.BackDeckC;
	
	public class BallroomB extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var insideButton:Loader;
		private var insideButtonOver:Loader;
		private var outsideButton:Loader;
		private var outsideButtonOver:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********当前第几段对话*********
		private var numberD:int;
		//**********第几个出现选择**********
		private var numberS:int;
		
		public function BallroomB()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/BallroomStairs.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			insideButton = new Loader();
			insideButton.load(new URLRequest("image/SmallBtns/Dessert_1.png"));
			insideButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setIB);
			
			insideButtonOver = new Loader();
			insideButtonOver.load(new URLRequest("image/SmallBtns/Dessert_2.png"));
			insideButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setIBO);
			
			outsideButton = new Loader();
			outsideButton.load(new URLRequest("image/SmallBtns/Liquor_1.png"));
			outsideButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setOB);
			
			outsideButtonOver = new Loader();
			outsideButtonOver.load(new URLRequest("image/SmallBtns/Liquor_2.png"));
			outsideButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setOBO);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		protected function setOBO(event:Event):void
		{
			// TODO Auto-generated method stub
			outsideButtonOver.x = gameBG.width * 0.6;
			outsideButtonOver.y = gameBG.height * 0.3;
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
			outsideButton.y = gameBG.height * 0.3;
			outsideButton.width = gameBG.width * 0.17;
			outsideButton.height = gameBG.height * 0.15;
			outsideButton.visible = false;
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
		
		
		protected function setIBO(event:Event):void
		{
			// TODO Auto-generated method stub
			insideButtonOver.x = gameBG.width * 0.15;
			insideButtonOver.y = gameBG.height * 0.3;
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
			insideButton.y = gameBG.height * 0.3;
			insideButton.width = gameBG.width * 0.17;
			insideButton.height = gameBG.height * 0.15;
			insideButton.visible = false;
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
		
		
		
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 1;
			numberS = 1;
			speaking = new Dialogue('brb', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT3, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT4, diaS);
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
							if(speaking.count == speaking.curdia.length){
								cleanDialog();
								outsideButton.visible = true;
								insideButton.visible = true;
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
						
					}
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
				case insideButtonOver:
					dispatchEvent(new Event(BackDeckC.PAGE_CLOSE1));
					break;
				case outsideButtonOver:
					dispatchEvent(new Event(BackDeckC.PAGE_CLOSE2));
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
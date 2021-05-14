package smallGame
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	import behavior.Dialogue;
	
	
	public class SeekingRebecca extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		
		private var gameBG:Loader;
		
		private var map1:Loader;
		private var map2:Loader;
		private var map3:Loader;
		private var map4:Loader;
		private var map5:Loader;
		private var map6:Loader;
		private var map7:Loader;
		private var map8:Loader;
		private var map9:Loader;
		private var cur:Loader;
		
		private var backButton:Loader;
		private var backButtonOver:Loader;
		
		private var randomN:Number;
		private var temp : Number;
		
		private var character:Loader;
		private var characterJ:Loader;
		
		public var preS:Boolean;
		
		private var start:Boolean;
		private var lookTimer:Timer;
		private var time:int;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean; 
		
		public function SeekingRebecca()
		{
			super();
			init();
		}
		
		private function init():void{
			
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/parchment.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
			
			lookTimer = new Timer(100);
			lookTimer.addEventListener(TimerEvent.TIMER, countTime);
			lookTimer.start();
			
			randomN = Math.floor(Math.random() * 8 + 1);
		}
		
		protected function countTime(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			time++;
		}
		protected function setBBO(event:Event):void
		{
			// TODO Auto-generated method stub
			backButtonOver.x = 0;
			backButtonOver.y = 0;
			backButtonOver.width = gameBG.width * 0.12;
			backButtonOver.height = gameBG.height * 0.1;
			backButtonOver.visible = false;
			backButtonOver.addEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			addChild(backButtonOver);
			backButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBBO);
		}
		
		private function setBB(e:Event):void{
			backButton.x = 0;
			backButton.y = 0;
			backButton.width = gameBG.width * 0.12;
			backButton.height = gameBG.height * 0.1;
			backButton.visible = false;
			backButton.addEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			
			addChild(backButton);
			backButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBB);
		}
		
		protected function goBack(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			character.visible = false;
			backButton.removeEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			backButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			
			backButton.visible = false;
			backButtonOver.visible = false;
			
			switch(cur){
				case map1:
					map1.x = gameBG.width * 0.05;
					map1.y = gameBG.height * 0.05;
					map1.width = gameBG.width * 0.3;
					map1.height = gameBG.height * 0.3;
					break;
				case map2:
					map2.x = gameBG.width * 0.35;
					map2.y = gameBG.height * 0.05;
					map2.width = gameBG.width * 0.3;
					map2.height = gameBG.height * 0.3;
					break;
				case map3:
					map3.x = gameBG.width * 0.65;
					map3.y = gameBG.height * 0.05;
					map3.width = gameBG.width * 0.3;
					map3.height = gameBG.height * 0.3;
					break;
				case map4:
					map4.x = gameBG.width * 0.05;
					map4.y = gameBG.height * 0.35;
					map4.width = gameBG.width * 0.3;
					map4.height = gameBG.height * 0.3;
					break;
				case map5:
					map5.x = gameBG.width * 0.35;
					map5.y = gameBG.height * 0.35;
					map5.width = gameBG.width * 0.3;
					map5.height = gameBG.height * 0.3;
					break;
				case map6:
					map6.x = gameBG.width * 0.65;
					map6.y = gameBG.height * 0.35;
					map6.width = gameBG.width * 0.3;
					map6.height = gameBG.height * 0.3;
					break;
				case map7:
					map7.x = gameBG.width * 0.05;
					map7.y = gameBG.height * 0.65;
					map7.width = gameBG.width * 0.3;
					map7.height = gameBG.height * 0.3;
					break;
				case map8:
					map8.x = gameBG.width * 0.35;
					map8.y = gameBG.height * 0.65;
					map8.width = gameBG.width * 0.3;
					map8.height = gameBG.height * 0.3;
					break;
				case map9:
					map9.x = gameBG.width * 0.65;
					map9.y = gameBG.height * 0.65;
					map9.width = gameBG.width * 0.3;
					map9.height = gameBG.height * 0.3;
					break;
				default:
					break;
			}
		}
		
		private function bboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			backButton.visible = true;
			backButtonOver.visible = false;
		}
		
		private function bbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			backButton.visible = false;
			backButtonOver.visible = true;
		}
		
		protected function setT1(event:Event):void
		{
			// TODO Auto-generated method stub
			map1.x = gameBG.width * 0.05;
			map1.y = gameBG.height * 0.05;
			map1.width = gameBG.width * 0.3;
			map1.height = gameBG.height * 0.3;
			map1.addEventListener(MouseEvent.MOUSE_OVER, over);
			map1.addEventListener(MouseEvent.MOUSE_OUT, out);
			map1.addEventListener(MouseEvent.CLICK, into);
			addChild(map1);
		}
		
		protected function setT2(event:Event):void
		{
			// TODO Auto-generated method stub
			map2.x = gameBG.width * 0.35;
			map2.y = gameBG.height * 0.05;
			map2.width = gameBG.width * 0.3;
			map2.height = gameBG.height * 0.3;
			map2.addEventListener(MouseEvent.MOUSE_OVER, over);
			map2.addEventListener(MouseEvent.MOUSE_OUT, out);
			map2.addEventListener(MouseEvent.CLICK, into);
			addChild(map2);
		}
		
		protected function setT3(event:Event):void
		{
			// TODO Auto-generated method stub
			map3.x = gameBG.width * 0.65;
			map3.y = gameBG.height * 0.05;
			map3.width = gameBG.width * 0.3;
			map3.height = gameBG.height * 0.3;
			map3.addEventListener(MouseEvent.MOUSE_OVER, over);
			map3.addEventListener(MouseEvent.MOUSE_OUT, out);
			map3.addEventListener(MouseEvent.CLICK, into);
			addChild(map3);
		}
		
		protected function setT4(event:Event):void
		{
			// TODO Auto-generated method stub
			map4.x = gameBG.width * 0.05;
			map4.y = gameBG.height * 0.35;
			map4.width = gameBG.width * 0.3;
			map4.height = gameBG.height * 0.3;
			map4.addEventListener(MouseEvent.MOUSE_OVER, over);
			map4.addEventListener(MouseEvent.MOUSE_OUT, out);
			map4.addEventListener(MouseEvent.CLICK, into);
			addChild(map4);
		}
		
		protected function setT5(event:Event):void
		{
			// TODO Auto-generated method stub
			map5.x = gameBG.width * 0.35;
			map5.y = gameBG.height * 0.35;
			map5.width = gameBG.width * 0.3;
			map5.height = gameBG.height * 0.3;
			map5.addEventListener(MouseEvent.MOUSE_OVER, over);
			map5.addEventListener(MouseEvent.MOUSE_OUT, out);
			map5.addEventListener(MouseEvent.CLICK, into);
			addChild(map5);
		}
		
		protected function setT6(event:Event):void
		{
			// TODO Auto-generated method stub
			map6.x = gameBG.width * 0.65;
			map6.y = gameBG.height * 0.35;
			map6.width = gameBG.width * 0.3;
			map6.height = gameBG.height * 0.3;
			map6.addEventListener(MouseEvent.MOUSE_OVER, over);
			map6.addEventListener(MouseEvent.MOUSE_OUT, out);
			map6.addEventListener(MouseEvent.CLICK, into);
			addChild(map6);
		}
		
		protected function setT7(event:Event):void
		{
			// TODO Auto-generated method stub
			map7.x = gameBG.width * 0.05;
			map7.y = gameBG.height * 0.65;
			map7.width = gameBG.width * 0.3;
			map7.height = gameBG.height * 0.3;
			map7.addEventListener(MouseEvent.MOUSE_OVER, over);
			map7.addEventListener(MouseEvent.MOUSE_OUT, out);
			map7.addEventListener(MouseEvent.CLICK, into);
			addChild(map7);
		}
		
		protected function setT8(event:Event):void
		{
			// TODO Auto-generated method stub
			map8.x = gameBG.width * 0.35;
			map8.y = gameBG.height * 0.65;
			map8.width = gameBG.width * 0.3;
			map8.height = gameBG.height * 0.3;
			map8.addEventListener(MouseEvent.MOUSE_OVER, over);
			map8.addEventListener(MouseEvent.MOUSE_OUT, out);
			map8.addEventListener(MouseEvent.CLICK, into);
			addChild(map8);
		}
		
		protected function setT9(event:Event):void
		{
			// TODO Auto-generated method stub
			map9.x = gameBG.width * 0.65;
			map9.y = gameBG.height * 0.65;
			map9.width = gameBG.width * 0.3;
			map9.height = gameBG.height * 0.3;
			map9.addEventListener(MouseEvent.MOUSE_OVER, over);
			map9.addEventListener(MouseEvent.MOUSE_OUT, out);
			map9.addEventListener(MouseEvent.CLICK, into);
			addChild(map9);
		}
		
		protected function into(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			event.target.x = 0;
			event.target.y = 0;
			event.target.width = gameBG.width
			event.target.height = gameBG.height;
			switch(event.target){
				case map1:
					cur = map1;
					temp = 1;
					break;
				case map2:
					cur = map2;
					temp = 2;
					break;
				case map3:
					cur = map3;
					temp = 3;
					break;
				case map4:
					cur = map4;
					temp = 4;
					break;
				case map5:
					cur = map5;
					temp = 5;
					break;
				case map6:
					cur = map6;
					temp = 6;
					break;
				case map7:
					cur = map7;
					temp = 7;
					break;
				case map8:
					cur = map8;
					temp = 8;
					break;
				case map9:
					cur = map9;
					temp = 9;
					break;
				default:
					break;
			}
			
			var topPosition:uint = numChildren - 1;
			setChildIndex(cur, topPosition);
			backButton.visible = true;
			setChildIndex(backButton, topPosition);
			setChildIndex(backButtonOver, topPosition);
			//setChildIndex(character, topPosition);
			backButton.addEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			backButtonOver.addEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			//*********************找到判定*********************ß
			if(temp == randomN){
				lookTimer.stop();
				backButton.removeEventListener(MouseEvent.MOUSE_OVER, bbRollover);
				backButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, bboOut);
				backButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goBack);
				map1.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map1.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map1.removeEventListener(MouseEvent.CLICK, into);
				map2.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map2.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map2.removeEventListener(MouseEvent.CLICK, into);
				map3.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map3.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map3.removeEventListener(MouseEvent.CLICK, into);
				map4.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map4.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map4.removeEventListener(MouseEvent.CLICK, into);
				map5.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map5.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map5.removeEventListener(MouseEvent.CLICK, into);
				map6.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map6.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map6.removeEventListener(MouseEvent.CLICK, into);
				map7.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map7.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map7.removeEventListener(MouseEvent.CLICK, into);
				map8.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map8.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map8.removeEventListener(MouseEvent.CLICK, into);
				map9.removeEventListener(MouseEvent.MOUSE_OVER, over);
				map9.removeEventListener(MouseEvent.MOUSE_OUT, out);
				map9.removeEventListener(MouseEvent.CLICK, into);
				backButton.visible = false;
				backButtonOver.visible = false;
				if(preS){
					characterJ.visible = true;
					setChildIndex(characterJ, topPosition);
				}else{
					character.visible = true;
					setChildIndex(character, topPosition);
				}
				
				setDialog();
			}
		}
		
		protected function out(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
		}
		
		protected function over(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "button";
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			map1 = new Loader();
			map1.load(new URLRequest("image/scene/Titanic's_first_class_stateroom.jpg"));
			map1.contentLoaderInfo.addEventListener(Event.COMPLETE, setT1);
			
			map2 = new Loader();
			map2.load(new URLRequest("image/scene/C_TowelRoom.jpg"));
			map2.contentLoaderInfo.addEventListener(Event.COMPLETE, setT2);
			
			map3 = new Loader();
			map3.load(new URLRequest("image/scene/C_Miss-Parker'sRoom.jpg"));
			map3.contentLoaderInfo.addEventListener(Event.COMPLETE, setT3);
			
			map4 = new Loader();
			map4.load(new URLRequest("image/scene/A_Hallway.jpg"));
			map4.contentLoaderInfo.addEventListener(Event.COMPLETE, setT4);
			
			map5 = new Loader();
			map5.load(new URLRequest("image/scene/A_Cabin.jpg"));
			map5.contentLoaderInfo.addEventListener(Event.COMPLETE, setT5);
			
			map6 = new Loader();
			map6.load(new URLRequest("image/scene/A_BunkBed.jpg"));
			map6.contentLoaderInfo.addEventListener(Event.COMPLETE, setT6);
			
			map7 = new Loader();
			map7.load(new URLRequest("image/scene/A_B_RebeccaTalk.jpg"));
			map7.contentLoaderInfo.addEventListener(Event.COMPLETE, setT7);
			
			map8 = new Loader();
			map8.load(new URLRequest("image/scene/A_B_Rebecca_Ignore.jpg"));
			map8.contentLoaderInfo.addEventListener(Event.COMPLETE, setT8);
			
			map9 = new Loader();
			map9.load(new URLRequest("image/scene/DessertPlace.jpg"));
			map9.contentLoaderInfo.addEventListener(Event.COMPLETE, setT9);
			
			backButton = new Loader();
			backButton.load(new URLRequest("image/SmallBtns/BackBtn_1.png"));
			backButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setBB);
			
			backButtonOver = new Loader();
			backButtonOver.load(new URLRequest("image/SmallBtns/BackBtn_2.png"));
			backButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setBBO);
			
			character = new Loader();
			character.load(new URLRequest("image/character/rebecca1.png"));
			character.contentLoaderInfo.addEventListener(Event.COMPLETE, setC);
			
			characterJ = new Loader();
			characterJ.load(new URLRequest("image/character/Jimmy.png"));
			characterJ.contentLoaderInfo.addEventListener(Event.COMPLETE, setCJ);
			
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			if(preS){
				speaking = new Dialogue('sr1', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			}else{
				speaking = new Dialogue('sr', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
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
			if(!diadown && diashift && speaking.diaContent){
				diadown = true;
				diashift = true;
			}
		}
		
		
		protected function setCJ(event:Event):void
		{
			// TODO Auto-generated method stub
			characterJ.x = gameBG.width * 0.4;
			characterJ.y = gameBG.height * 0.6;
			characterJ.width = gameBG.width * 0.1;
			characterJ.height = gameBG.height * 0.4;
			characterJ.visible = false;
			addChild(characterJ);
		}
		
		private function setC(event:Event):void
		{
			// TODO Auto Generated method stub
			character.x = gameBG.width * 0.4;
			character.y = gameBG.height * 0.2;
			character.width = gameBG.width * 0.3;
			character.height = gameBG.height * 1.2;
			character.visible = false;
			addChild(character);
		}
		
		private function onEnterFrame(event:Event):void{
			
			reSize();
			movedialog();
		}
		
		private function movedialog():void{
			one: 
			if(diashift && speaking.diaContent ){
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
			
			if(preS){
				if(time <= 50){
					dispatchEvent(new Event(SeekingRebecca.PAGE_CLOSE1));
				}else{
					dispatchEvent(new Event(SeekingRebecca.PAGE_CLOSE2));
				}
			}else{
				dispatchEvent(new Event(SeekingRebecca.PAGE_CLOSE));
			}
			
			
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			
		}
	}
}
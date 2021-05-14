package smallGame
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import behavior.Dialogue;
	
	
	public class SwimFast extends Sprite
	{
		public static const PAGE_CLOSE0:String = "pageClose0";
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		public static const PAGE_CLOSE3:String = "pageClose3";
		
		private var gameBG:Loader;
		private var des:Loader;
		
		private var boat:Loader;
		
		private var person:Loader;
		
		private var speed:Number = 10;
		
		private var keyU:Boolean;
		private var keyD:Boolean;
		private var keyL:Boolean;
		private var keyR:Boolean;
		
		private var speedX:Number = 0;
		private var speedY:Number = 3;
		private var accX:Number = 0;
		private var accY:Number = 0;
		
		private var c:Number = 0;
		
		private var dTimer:Timer;
		private var time:Number = 0;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		
		public function SwimFast()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/ocean-at-night.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
			
			dTimer = new Timer(100);
			dTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timecount);
			dTimer.start();
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			speaking = new Dialogue('sf', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
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
		

		
		protected function timecount(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			time++;
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			des = new Loader();
			des.load(new URLRequest("image/description/swimmingGameDescription.png"));
			des.contentLoaderInfo.addEventListener(Event.COMPLETE, setDes);
			
			initImg();
			setDialog();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		protected function setDes(event:Event):void
		{
			// TODO Auto-generated method stub
			des.width = stage.stageWidth;
			des.height = stage.stageHeight;
			addChild(des);
			des.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDes);
		}
		
		private function initImg():void{
			boat = new Loader();
			boat.load(new URLRequest("image/scene/C_Lifeboat.png"));
			boat.contentLoaderInfo.addEventListener(Event.COMPLETE, setBoat);
			
			person = new Loader();
			person.load(new URLRequest("image/character/swimmerForSmallGame.png"));
			person.contentLoaderInfo.addEventListener(Event.COMPLETE, setPerson);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressmove);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyrelease);
		}
		
		protected function keyrelease(event:KeyboardEvent):void
		{
			// TODO Auto-generated method stub
			switch(event.keyCode){
				case Keyboard.UP:
					keyU = false;
					break;
				case Keyboard.DOWN:
					keyD = false;
					break;
				case Keyboard.LEFT:
					keyL = false;
					break;
				case Keyboard.RIGHT:
					keyR = false;
					break;
				default:
					break;
			}
		}
		
		protected function keypressmove(event:KeyboardEvent):void
		{
			// TODO Auto-generated method stub
			switch(event.keyCode){
				case Keyboard.UP:
					keyU = true;
					break;
				case Keyboard.DOWN:
					keyD = true;
					break;
				case Keyboard.LEFT:
					keyL = true;
					break;
				case Keyboard.RIGHT:
					keyR = true;
					break;
				default:
					break;
			}
		}
		
		
		protected function setPerson(event:Event):void
		{
			// TODO Auto-generated method stub
			person.width = gameBG.width * 0.1;
			person.height = gameBG.height * 0.1;
			person.x = 0;
			person.y = gameBG.height * 0.9;
			addChild(person);
		}
		
		protected function setBoat(event:Event):void
		{
			// TODO Auto-generated method stub
			boat.width = gameBG.width * 0.1;
			boat.height = gameBG.height * 0.1;
			boat.x = gameBG.width * 0.75;
			boat.y = gameBG.height * 0.6;
			addChild(boat);
		}
		
		private function onEnterFrame(event:Event):void{
			reSize();
			shipFloating();
			personSwimming();
			movedialog();
			if(dist() <= 20){
				dTimer.stop();
				close();
			}
			
		}
		
		private function close():void
		{
			// TODO Auto Generated method stub
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			if(time <= 50){
				dispatchEvent(new Event(SwimFast.PAGE_CLOSE0));
			}else if(time >= 50&&time <= 100){
				dispatchEvent(new Event(SwimFast.PAGE_CLOSE1));
			}else if(time >= 100&&time <= 150){
				dispatchEvent(new Event(SwimFast.PAGE_CLOSE2));
			}else{
				dispatchEvent(new Event(SwimFast.PAGE_CLOSE3));
			}
		}
		
		private function personSwimming():void{
			if(keyU && person.y >= gameBG.height * 0.5) person.y -= speed;
			if(keyD && person.y <= gameBG.height - person.height) person.y += speed;
			if(keyL && person.x >= 0) person.x -= speed;
			if(keyR && person.x <= gameBG.width - person.width) person.x += speed;
			if(person.x >= 0 && person.x <= gameBG.width - person.width){
				person.x -= 2;
			}
			if(person.y >= gameBG.height * 0.5 && person.y <= gameBG.height - person.height){
				person.y += 2;
			}
		}
		
		
		private function cleanDialog():void{
			diashift = false;
			
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
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
							dTimer.stop();
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
		
		private function shipFloating():void
		{
			// TODO Auto Generated method stub
			
			boat.y += speedY;
			boat.x = gameBG.width * 0.75 + 50 * Math.sin(c);
			c+=0.1;
			
			if(boat.y <= gameBG.height * 0.5 || boat.y >= gameBG.height - person.height){
				speedY *= -1;
				
			}
		}
		
		private function dist():Number{
			return Math.sqrt(Math.pow(boat.x - person.x, 2) + Math.pow(boat.y - person.y, 2));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
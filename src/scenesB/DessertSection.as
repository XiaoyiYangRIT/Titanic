package scenesB
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import behavior.Dialogue;
	
	public class DessertSection extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean = true;
		private var diadown:Boolean = false;
		//****************外部传参*************
		public var outV:int;
		
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		public function DessertSection()
		{
			super();
			init();
		}
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/Rebecca_Jimmy_DessertPlace.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			switch(outV){
				case 1:
					speaking = new Dialogue('des1', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					addChild(speaking);
					break;
				case 2:
					speaking = new Dialogue('des2', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					addChild(speaking);
					break;
				case 3:
					speaking = new Dialogue('des3', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					addChild(speaking);
					break;
				case 4:
					speaking = new Dialogue('des4', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					addChild(speaking);
					break;
				default:
					speaking = new Dialogue('1', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
					addChild(speaking);
					break;
			}
			
			soundFactory = new Sound(new URLRequest("materials/ball_sound_mixdown.mp3"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
			
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
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
							close();
							
							break one;
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
		
		private function cleanDialog():void{
			diashift = false;
			
			removeEventListener(MouseEvent.CLICK, mouseclick);
			removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeChild(speaking);
		}
		
		private function close():void{
			cleanDialog();
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			song.stop();
			
			
			dispatchEvent(new Event(DessertSection.PAGE_CLOSE));
			
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
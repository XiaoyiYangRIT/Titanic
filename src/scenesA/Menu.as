package scenesA
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.ui.Mouse;

	//import flash.ui.MouseCursor;
	
	public class Menu extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose1";
		
		private var menuBG:Loader;
		private var bg:Bitmap;
		
		private var startButton:Loader;
		private var startButtonOver:Loader;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		
		public function Menu()
		{
			init();
			super();
		}
		
		private function init():void{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.alpha = 0;
			
			menuBG = new Loader();
			menuBG.load(new URLRequest("image/scene/FirstPage_withText.jpg"));
			menuBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setBG);
			
			
		}
		
		private function setBG(e:Event):void{
		/*	bg = (menuBG.content as Bitmap);
			bg.x = 0;
			bg.y = 0;*/
			menuBG.x = 0;
			menuBG.y = 0;
			menuBG.width = stage.stageWidth;
			menuBG.height = stage.stageHeight;
			addChild(menuBG);
			
			soundFactory = new Sound(new URLRequest("materials/theme_music.mp3"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
			
			
			
			startButton = new Loader();
			startButton.load(new URLRequest("image/SmallBtns/EnterBtnScript_1.png"));
			startButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setSB);
			
			startButtonOver = new Loader();
			startButtonOver.load(new URLRequest("image/SmallBtns/EnterBtnScript_2.png"));
			startButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setSBO);
			
			menuBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBG);
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
		}
		
		protected function setSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			startButtonOver.x = menuBG.width * 0.1;
			startButtonOver.y = menuBG.height * 0.7;
			startButtonOver.width = menuBG.width * 0.22;
			startButtonOver.height = menuBG.height * 0.25;
			startButtonOver.visible = false;
			startButtonOver.addEventListener(MouseEvent.MOUSE_OUT, sboOut);
			startButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			this.addChild(startButtonOver);
			startButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setSBO);
		}
		
		private function sboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			startButton.visible = true;
			startButtonOver.visible = false;
			//startButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			//startButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function setSB(e:Event):void{
			startButton.x = menuBG.width * 0.1;
			startButton.y = menuBG.height * 0.7;
			startButton.width = menuBG.width * 0.22;
			startButton.height = menuBG.height * 0.25;
			startButton.addEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			
			//this.addChild(sb);
			this.addChild(startButton);
			startButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setSB);
		}
		
		private function sbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			startButton.visible = false;
			startButtonOver.visible = true;
		}
		
		
		private function close(e:MouseEvent):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			song.stop();
			
			Mouse.cursor = "arrow";
			startButton.removeEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			startButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			startButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
			dispatchEvent(new Event(Menu.PAGE_CLOSE));
		}
		
		private function onEnterFrame(event:Event):void
		{
			//reSize();
			fadeIn();
		}
		
		private function fadeIn():void{
			if(this.alpha < 1){
				this.alpha += 0.05;
			}
		}
		
		private function reSize():void{
			menuBG.width = stage.stageWidth;
			menuBG.height = stage.stageHeight;
		}
	}
}
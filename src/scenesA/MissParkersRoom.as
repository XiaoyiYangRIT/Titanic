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
	
	public class MissParkersRoom extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var gameBG:Loader;
		
		private var manager:Loader;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		public function MissParkersRoom()
		{
			super();
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/C_Miss-Parker'sRoom.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			this.addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			manager = new Loader();
			manager.load(new URLRequest("image/character/MissParker_Standing.png"));
			manager.contentLoaderInfo.addEventListener(Event.COMPLETE, setMN);
			
			soundFactory = new Sound(new URLRequest("materials/doorknocking.wav"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
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
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			speaking = new Dialogue('diampr', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			//speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT3, diaS);
			//speaking.addEventListener(Dialogue.DIASELECT4, diaS);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			diashift = false;
			//speaking.removeEventListener(Dialogue.DIASELECT1, diaS);
			//speaking.removeEventListener(Dialogue.DIASELECT2, diaS);
			//speaking.removeEventListener(Dialogue.DIASELECT3, );
			//speaking.removeEventListener(Dialogue.DIASELECT4, );
			
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
			if(diashift && speaking.diaContent){
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
							Mouse.show();
							diashift = false;
							speaking = null;
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
		
		private function close():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			song.stop();
			dispatchEvent(new Event(MissParkersRoom.PAGE_CLOSE));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
package others
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import scenesA.GamePage1;

	public class MovingFunctions extends FinalVersionTitanic
	{
		public function MovingFunctions()
		{
			super();
		}
		
		public function gamePageShiftTogamePage1(e:Event):void{
			gamePage1 = new GamePage1();
			gamePage1.done = false;
			gamePage1.x = -stage.stageWidth;
			addChild(gamePage1).addEventListener(GamePage1.PAGE_CLOSE3, gamePage1ShiftTogamePage);
			
			myTimer = new Timer(10);
			myTimer.addEventListener(TimerEvent.TIMER, moving01);
			myTimer.start();
		}
		
		private function moving01(e:TimerEvent):void{
			gamePage.x += 15;
			gamePage1.x = gamePage.x - stage.stageWidth;
			if(gamePage.x >= stage.stageWidth){
				gamePage1.mainCharater.visible = true;
				gamePage.mainCharater.visible = true;
				removeChild(gamePage);
				//gamePage.visible = false;
				gamePage1.x = 0;
				myTimer.stop();
				myTimer.removeEventListener(TimerEvent.TIMER, moving01);
			}
		}
		
		public function gamePage1ShiftTogamePage(e:Event):void{
			/*gamePage.done = false;
			gamePage.visible = true;*/
			
			gamePage.done = false;
			addChild(gamePage);
			gamePage.x = stage.stageWidth;
			
			
			myTimer1 = new Timer(10);
			myTimer1.addEventListener(TimerEvent.TIMER, moving10);
			myTimer1.start();
		}
		
		private function moving10(e:TimerEvent):void{
			gamePage1.x -= 15;
			gamePage.x = gamePage1.x + stage.stageWidth;
			if(gamePage1.x <= -stage.stageWidth && gamePage.x <= 0){
				gamePage1.mainCharater.visible = true;
				gamePage.mainCharater.visible = true;
				gamePage1.visible = false;
				gamePage.x = 0;
				myTimer1.stop();
				myTimer1.removeEventListener(TimerEvent.TIMER, moving10);
			}
		}
	}
}
package behavior
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.IEventDispatcher;
	import flash.utils.Timer;
	
	public class FadeShift implements IEventDispatcher
	{
		public static const SHIFTFINISH:String = "shiftfinish";
		
		public var S1:DisplayObject;
		public var S2:DisplayObject;
		private var fadeOutTimer:Timer;
		private var fadeInTimer:Timer;
		
		public function FadeShift(s1:DisplayObject, s2:DisplayObject)
		{
			S1 = s1;
			S2 = s2;
			
			fadeOutTimer = new Timer(10);
			fadeOutTimer.addEventListener(TimerEvent.TIMER, sOneFadeOut);
			
		}
		
		public function play():void{
			fadeOutTimer.start();
		}
		
		
		private function sOneFadeOut(e:TimerEvent):void{
			S1.alpha -= 0.05;
			if(S1.alpha <= 0){
				fadeOutTimer.stop();
				fadeOutTimer.removeEventListener(TimerEvent.TIMER, sOneFadeOut);
				fadeInTimer = new Timer(10);
				fadeInTimer.addEventListener(TimerEvent.TIMER, sTwoFadeIn);
				fadeInTimer.start();
			}
		}
		
		private function sTwoFadeIn(e:TimerEvent):void{
			S2.alpha += 0.05;
			if(S2.alpha >= 1){
				fadeInTimer.stop();
				fadeInTimer.removeEventListener(TimerEvent.TIMER, sTwoFadeIn);
				dispatchEvent(new Event(FadeShift.SHIFTFINISH));
			}
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return false;
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return false;
		}
		
		public function willTrigger(type:String):Boolean
		{
			return false;
		}
	}
}
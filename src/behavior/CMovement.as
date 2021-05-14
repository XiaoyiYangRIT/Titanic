package behavior
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	public class CMovement
	{
		private var speed:int = 5;
		private var kRight:Boolean = false;
		private var kLeft:Boolean = false;
		private var kUp:Boolean = false;
		private var kDown:Boolean = false;
		
		private var movingObject:Object;
		
		public function CMovement(/*a:Object*/)
		{
			//movingObject = a;
		}
		
		public function characterMoveByMouse(e:MouseEvent):void{
			
		}
		
		public function characterMove(e:KeyboardEvent):void{
			switch (e.keyCode) {
				case Keyboard.UP :
					kUp = true;
					break;
				case Keyboard.DOWN :
					kDown = true;
					break;
				case Keyboard.LEFT :
					kLeft = true;
					break;
				case Keyboard.RIGHT :
					kRight = true;
					break;
				default :
					break;
			}
		}
		
		public function characterStopMove(e:KeyboardEvent):void{
			switch (e.keyCode) {
				case Keyboard.UP :
					kUp = false;
					break;
				case Keyboard.DOWN :
					kDown = false;
					break;
				case Keyboard.LEFT :
					kLeft = false;
					break;
				case Keyboard.RIGHT :
					kRight = false;
					break;
				default :
					break;
			}
		}
	}
}
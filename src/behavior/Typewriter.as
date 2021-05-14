package behavior
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	
	public class Typewriter extends Sprite
	{
		public static const TYPEOVER:String = "typeover";
		
		private var dialog:Loader;
		
		private var dialogContent:TextField;
		
		private var FrameX:Number;
		private var FrameY:Number;
		private var FrameW:Number;
		private var FrameH:Number;
		private var Name:String;
		
		public var diaContent:TextField;
		
		public var StrAr:String;
		public var cd:String;
		public var dlr:String;
		public var ec3:String;
		public var ec20:String;
		public var ec29:String;
		public var ec40:String;
		public var ec43:String;
		public var ec48:String;
		public var dc49:String;
		public var ec50:String;
		public var dc51:String;
		public var dc52:String;
		
		public var finalending1:String;
		public var finalending2:String;
		public var finalending3:String;
		
		public var curdia:String;
		
		public var count:int = 0;
		
		public var typeTimer:Timer;
		public var formatter:TextFormat; 
		public var typeover:Boolean = false;
		
		public function Typewriter(nm:String, _x:Number, _y:Number, _w:Number, _h:Number)
		{
			super();
			
			FrameX = _x;
			FrameY = _y;
			FrameW = _w;
			FrameH = _h;
			Name = nm;
			selectSentence();
			
			/*this.x = FrameX;
			this.y = FrameY;*/
			
			dialog = new Loader();
			dialog.load(new URLRequest("image/objects/dialogFrame.png"));
			dialog.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		}
		
		
		private function completeHandler(e:Event):void {
			dialog.width = FrameW;
			dialog.height = FrameH;
			dialog.alpha = 0.6;
			//addChild(dialog);
			
			initText();
		}
		
		private function initText():void{
			formatter = new TextFormat();
			formatter.font = "Arial"; 
			formatter.color = 0x00FF00;
			formatter.size = 13; 
			
			
			
			diaContent = new TextField();
			diaContent.multiline = true;
			diaContent.wordWrap = true;
			
			diaContent.x = FrameW * 0.05;
			diaContent.y = FrameH * 0.15;
			diaContent.width = FrameW * 0.9 - FrameX;
			diaContent.height = FrameH * 0.8;
			//diaContent.text = curdia[count];
			diaContent.selectable = false;
			
			addChild(diaContent);
		}
		
		public function play():void{
			typeTimer = new Timer(50);
			typeTimer.addEventListener(TimerEvent.TIMER, typing);
			typeTimer.start();
		}
		
		protected function typing(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			if(diaContent){
				diaContent.text = curdia.substr(0, count) + "_";
				diaContent.setTextFormat(formatter);
				count++;
				if(count == curdia.length + 1) {
					typeover = true;
					typeTimer.stop();
				}
			}
			
		}
		
		private function assigningDia():void{
			switch(Name){
				case "cd":
					curdia = cd;
					break;
				case "dlr":
					curdia = dlr;
					break;
				case "ec3":
					curdia = ec3;
					break;
				case "ec20":
					curdia = ec20;
					break;
				case "ec29":
					curdia = ec29;
					break;
				case "ec40":
					curdia = ec40;
					break;
				case "ec43":
					curdia = ec43;
					break;
				case "ec48":
					curdia = ec48;
					break;
				case "dc49":
					curdia = dc49;
					break;
				case "ec50":
					curdia = ec50;
					break;
				case "dc51":
					curdia = dc51;
					break;
				case "dc52":
					curdia = dc52;
					break;
				case "finalending1":
					curdia = finalending1;
					break;
				case "finalending2":
					curdia = finalending2;
					break;
				case "finalending3":
					curdia = finalending3;
					break;
				default:
					curdia = StrAr;
					break;
			}
			
		}
		
		private function selectSentence():void{
			StrAr = "11111111111111111111111111111111111111";
			cd = "You sacrifice yourself to save the passener till the Titanic totally sinks into the ocean and you become a hero.";
			dlr = "You have nothing could be helpful.\nSteven and his coworker are stuck in the laundry room and die there.";
			ec3 = "Steven reaches the rescue boat and meet Rebecca on the boat. They fall in love and get married after they get back to London.";
			ec20 = "Steven cuts the rope with the knife and set the boat free. Then the rescue team find them and all the people on the boat survived.\n" +
				"Steven and Ms.Parker fall in love and get married after they get back to London.";
			ec29 = "The rescue boat comes to Steven. Steven falls in love with another lady after he gets back to London and marries her.";
			ec40 = "Steven cuts the rope with the knife and set the boat free. Then the rescue team find them and all the people on the boat survived.\n" +
				"Steven meets Rebecca on the rescue boat. They fall in love after they get back to London, then they get married.";
			ec43 = "Steven,Rebecca and Jimmy all get on the lifeboat and they are rescued by rescue boat. Steven and Rebecca fall in love and get married after they get back to London.";
			ec48 = "The Rescue boat comes to get them. Steven and Rebecca fail int love and get married after the get back to London.";
			dc49 = "All of them(Steven, Rebecca, Jimmy) fail to survive this.";
			ec50 = "Steven reaches the rescue boat and meet Ms.Parker on the boat. They fall in love and get married after they get back to London.";
			dc51 = "Steven reaches the rescue boat. But he loses both of legs because of the cold seawater. Therefore, Steven never get married.";
			dc52 = "Steven lost all strength, so he fail to reach the rescueboat and sinks deep in the ocean.";
			
			finalending1 = "You come to the Third-Dimensional Space where is out of the real world, since you are never born.\n" +
				"Now, you have the choice to go back and restart from the begining of three Scenarios.";
			finalending2 = "You come back to the real life. When you look into the mirror, You see that your appearance changes. Also, your parents are different people. Suddenly, " +
				"you realize that all the things have been changed because grandpa didn't married with Rebecca, since you real greandma is Rebecca.\n" +
				"Now, you have the choice to go back and restart from the begining of three Scenarios.";
			finalending3 = "You come back to real life and show the diary to your parents.\n" +
				"Now, you have the choice to go back and restart from the begining of three Scenarios. If you want to see other potencial story.";
			
			assigningDia();
		}
	}
}
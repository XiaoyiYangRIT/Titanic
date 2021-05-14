package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	public class Opt2Out extends Sprite
	{
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		public static const PAGE_CLOSE3:String = "pageClose3";
		
		private var gameBG:Loader;
		
		private var rose:Loader;
		private var pencil:Loader;
		
		private var situation:int;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		//**********第几个选择**********
		private var dias:int;
		//**********当前第几段对话*********
		private var numberD:int;
		//**********第几个出现选择**********
		private var numberS1:int;
		private var numberS2:int;
		//**********上一个选择是***********
		public var lastS:int;
		//**********最终的结果是**********
		private var final:int;
		
		public function Opt2Out()
		{
			super();
			//situation = pre;
			init();
		}
		
		private function init():void{
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/A_Opt2_Out.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
		}
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			setDialog();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			dias = 0;
			numberD = 1;
			numberS1 = 1;
			numberS2 = 5;
			speaking = new Dialogue('diahw', 0, gameBG.height, gameBG.width, gameBG.height * 0.2);
			speaking.addEventListener(Dialogue.DIASELECT1, diaS);
			speaking.addEventListener(Dialogue.DIASELECT2, diaS);
			speaking.addEventListener(Dialogue.DIASELECT3, diaS);
			speaking.addEventListener(Dialogue.DIASELECT4, diaS);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function cleanDialog():void{
			diashift = false;
			speaking.removeEventListener(Dialogue.DIASELECT1, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT2, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT3, diaS);
			speaking.removeEventListener(Dialogue.DIASELECT4, diaS);
			
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
				case "diaselect3":
					dias = 3;
					break;
				case "diaselect4":
					dias = 4;
					break;
				default:
					dias = 0;
					break;
			}
			/*if(numberD == 2){
				knife.visible = false;
			}*/
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
							speaking = null;
							close();
							break one;
						}
						//******对话分支选择*****
						if(speaking.count == 2 && dias == 2){
							final = 3;
							speaking.count = 15;
						}else if(speaking.count == 5){
							switch(lastS){
								case 1:
									break;
								case 2:
									speaking.count++;
									break;
								case 3:
									speaking.count += 2;
									break;
								case 4:
									speaking.count += 3;
									break;
								default:
									break;
							}
						}else if(speaking.count == 6){
							switch(dias){
								case 1:
									final = 1;
									speaking.count = 9;
									break;
								case 2:
									final = 3;
									speaking.count = 15;
									break;
								default:
									break;
							}
						}else if(speaking.count == 7){
							switch(dias){
								case 1:
									final = 3;
									speaking.count = 15;
									break;
								default:
									break;
							}
						}else if(speaking.count == 8){
							switch(dias){
								case 1:
									final = 2;
									speaking.count = 12;
									break;
								case 2:
									final = 3;
									speaking.count = 15;
									break;
								default:
									break;
							}
						}else if(speaking.count == 9){
							switch(dias){
								case 1:
									final = 1;
									break;
								case 2:
									final = 2;
									speaking.count = 12;
									break;
								case 3:
									final = 3;
									speaking.count = 15;
									break;
								default:
									break;
							}
						}else if(speaking.count == 12){
							speaking.count = 15;
							//break one;
						}
						//speaking.diaContent.text = lastS.toString();
						speaking.diaContent.text = speaking.curdia[speaking.count];
					}
				}else if(!diadown && speaking.y > gameBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
					//*********出现选择时移除监听***********
					if(speaking.count == numberS1 || (speaking.count >= 5 && speaking.count <= 8)){
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
		
		private function close():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			switch(final){
				case 1:
					dispatchEvent(new Event(Opt2Out.PAGE_CLOSE1));
					break;
				case 2:
					dispatchEvent(new Event(Opt2Out.PAGE_CLOSE2));
					break;
				case 3:
					dispatchEvent(new Event(Opt2Out.PAGE_CLOSE3));
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
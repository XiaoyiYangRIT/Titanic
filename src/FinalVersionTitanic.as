package
{
	//import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	import behavior.FadeShift;
	
	import endings.BadEndingChangeAppearance;
	import endings.BadEndingDisappear;
	import endings.GoodEnding;
	
	import others.ItemSpot;
	import others.PlayScreen;
	import others.Variables;
	
	import scenesA.AssigningJob;
	import scenesA.Ballroom;
	import scenesA.Cabin;
	import scenesA.GuideMeet;
	import scenesA.HallwayIn;
	import scenesA.HallwayOut;
	import scenesA.Intro;
	import scenesA.Menu;
	import scenesA.MissParkersRoom;
	import scenesA.Opt1Out;
	import scenesA.Opt1Room;
	import scenesA.Opt2Out;
	import scenesA.RebeccaIgnore;
	import scenesA.RebeccaTalk;
	import scenesA.VanityforKnife;
	
	import scenesB.BallroomB;
	import scenesB.BallroomWorking;
	import scenesB.DessertSection;
	import scenesB.DrinkSection;
	import scenesB.HallwayFL;
	import scenesB.MissParkersRoomB;
	import scenesB.NightDeck;
	
	import scenesC.BackDeckC;
	import scenesC.BallroomC;
	import scenesC.CharacterSwimC;
	import scenesC.FrontDeckC;
	import scenesC.FrontDeckFL;
	import scenesC.HallwayC;
	import scenesC.HelpGermanonBoat;
	import scenesC.IntheWater;
	import scenesC.KnifeonBoat;
	import scenesC.MissParkersRoomC;
	import scenesC.PreHelpGerman;
	import scenesC.PreHelpRebecca;
	import scenesC.TowelRoom;
	
	import smallGame.FlashlightTyping;
	import smallGame.SeekingRebecca;
	import smallGame.SwimFast;
	
	import stateBeforeEnding.CharacterDie;
	import stateBeforeEnding.DieC49;
	import stateBeforeEnding.DieC51;
	import stateBeforeEnding.DieC52;
	import stateBeforeEnding.DieinLaundryRoom;
	import stateBeforeEnding.Escape29;
	import stateBeforeEnding.Escape3;
	import stateBeforeEnding.EscapeC20;
	import stateBeforeEnding.EscapeC40;
	import stateBeforeEnding.EscapeC43;
	import stateBeforeEnding.EscapeC48;
	import stateBeforeEnding.EscapeC50;
	
	import transition.Test;
	import transition.TransitionAtoB;
	import transition.TransitionBtoC;
	
	public class FinalVersionTitanic extends Sprite
	{
		//************************scenes in order****************
		private var menu:Menu;
		private var intro:Intro;
		private var aj:AssigningJob;
		private var br:Ballroom;
		private var brb:BallroomB;
		private var cb:Cabin;
		private var gm:GuideMeet;
		private var hwin:HallwayIn;
		private var hwout:HallwayOut;
		private var mpr:MissParkersRoom;
		private var mprb:MissParkersRoomB;
		private var mprc:MissParkersRoomC;
		private var o1o:Opt1Out;
		private var o1r:Opt1Room;
		private var o2o:Opt2Out;
		private var ri:RebeccaIgnore;
		private var rt:RebeccaTalk;
		private var tr:TowelRoom;
		private var drs:DrinkSection;
		private var des:DessertSection;
		private var hwfl:HallwayFL;
		private var vk:VanityforKnife;
		private var nd:NightDeck;
		private var brw:BallroomWorking;
		private var brc:BallroomC;
		private var bdc:BackDeckC;
		private var fdc:FrontDeckC;
		private var hwc:HallwayC;
		private var phg:PreHelpGerman;
		private var phr:PreHelpRebecca;
		private var hgb:HelpGermanonBoat;
		private var kob:KnifeonBoat;
		private var iw:IntheWater;
		private var sf:SwimFast;
		private var fdfl:FrontDeckFL;
		private var csc:CharacterSwimC;
		
		private var curPage:Sprite;
		private var transitionAB:Test;
		private var transitionBC:TransitionBtoC;
		
		private var sr:SeekingRebecca;
		private var flt:FlashlightTyping;
		
		private var cd:CharacterDie;
		private var dlr:DieinLaundryRoom;
		private var ec3:Escape3;
		private var ec20:EscapeC20;
		private var ec29:Escape29;
		private var ec40:EscapeC40;
		private var ec43:EscapeC43;
		private var ec48:EscapeC48;
		private var dc49:DieC49;
		private var ec50:EscapeC50;
		private var dc51:DieC51;
		private var ec52:DieC52;
		
		
		private var badEnding1:BadEndingDisappear;
		private var badEnding2:BadEndingChangeAppearance;
		private var godEnding:GoodEnding;
		
		public var myTimer:Timer;
		public var myTimer1:Timer;
		//***********************effect*************
		private var fadeshift:FadeShift;
		
		//**************************zawu**************************
		private var ps:PlayScreen;
		private var myItemSpot:ItemSpot;
		private var myItemSpotX:Number;
		private var myItemSpotY:Number;
		private var myItemSpotW:Number;
		private var myItemSpotH:Number;
		private var myItemSpotState:Boolean;
		private var corCoe:int = 1;
		
		private var backButton:Loader;
		private var backButtonOver:Loader;
		
		private var itemButton:Loader;
		private var itemButtonOver:Loader;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		private var song1:SoundChannel;
		private var soundFactory1:Sound;
		
		//*********************LuoJiBianLiang**********************
		private var variables:Variables = new Variables();
		
		public function FinalVersionTitanic()
		{
			init();
			//initTimer();
		}
		
		private function init():void{
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			stage.align = StageAlign.TOP;
			
			
			initPages();
		}
		
		private function initPages():void{
			ps = new PlayScreen();
			addChild(ps);
			
			menu = new Menu();
			ps.addChild(menu).addEventListener(Menu.PAGE_CLOSE, closeStartPage);
			
		}
		
		public function closeStartPage(e:Event):void{
			
			
			intro = new Intro();
			intro.alpha = 0;
			intro.addEventListener(Intro.PAGE_CLOSE, closeIntroPage);
			ps.addChild(intro);
			
			fadeshift = new FadeShift(menu, intro);
			fadeshift.play();
			fadeshift.addEventListener(FadeShift.SHIFTFINISH, removeStartPage);
			
			//removeChild(menu).removeEventListener(Menu.PAGE_CLOSE, closeStartPage);
		}
		
		private function removeStartPage(e:Event):void{
			ps.removeEventListener(FadeShift.SHIFTFINISH, removeStartPage);
			ps.removeChild(menu).removeEventListener(Menu.PAGE_CLOSE, closeStartPage);
			fadeshift = null;
		}
		
		public function closeIntroPage(e:Event):void{
			intro.removeEventListener(Intro.PAGE_CLOSE, closeIntroPage);
			ps.removeChild(intro);
			
			aj = new AssigningJob();
			aj.addEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.addEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.addChild(aj);
			
			soundFactory = new Sound(new URLRequest("materials/theme_music.mp3"));
			soundFactory.addEventListener(Event.COMPLETE, completeHandler);
			soundFactory1 = new Sound(new URLRequest("materials/panic_on_deck_mixdown1.mp3"));
			
			initGlobalButton();
			initIS();
			
			
		}
		
		protected function completeHandler1(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory1.removeEventListener(Event.COMPLETE, completeHandler1);
			song1 = soundFactory1.play();
			song1.addEventListener(Event.SOUND_COMPLETE,onComplete1);
		}
		private function onComplete1(eve:Event):void
		{
			song1 = soundFactory1.play();
			song1.addEventListener(Event.SOUND_COMPLETE,onComplete1);
		}
		
		private function onComplete(eve:Event):void
		{
			song = soundFactory.play();
			song.addEventListener(Event.SOUND_COMPLETE,onComplete);
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
			song.addEventListener(Event.SOUND_COMPLETE,onComplete);
		}
		
		private function initGlobalButton():void{
			backButton = new Loader();
			backButton.load(new URLRequest("image/SmallBtns/Save_2.png"));
			backButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setBB);
			
			backButtonOver = new Loader();
			backButtonOver.load(new URLRequest("image/SmallBtns/Save_1.png"));
			backButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setBBO);
			
			itemButton = new Loader();
			itemButton.load(new URLRequest("image/SmallBtns/Inventory_2.png"));
			itemButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setIB);
			
			itemButtonOver = new Loader();
			itemButtonOver.load(new URLRequest("image/SmallBtns/Inventory_1.png"));
			itemButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setIBO);
			
		}
		
		private function initIS():void{
			myItemSpotX = 0.1 * stage.stageWidth;
			myItemSpotY = 0.2 * stage.stageHeight;
			myItemSpotW = 0.8 * stage.stageWidth;
			myItemSpotH = 0.3 * stage.stageHeight;
			myItemSpotState = false;
			myItemSpot = new ItemSpot(myItemSpotW, myItemSpotH);
			myItemSpot.x = myItemSpotX;
			myItemSpot.y = myItemSpotY;
			myItemSpot.alpha = 1;
			myItemSpot.visible = false;
			addChild(myItemSpot);
		}
		
		private function tempOpen():void{
			var timer:Timer = new Timer(1000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, tempclose);
			timer.start();
			myItemSpot.visible = true;
		}
		
		protected function tempclose(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			myItemSpot.visible = false;
		}
		
		protected function setIBO(event:Event):void
		{
			// TODO Auto-generated method stub
			itemButtonOver.x = stage.stageWidth * 0.75;
			itemButtonOver.y = stage.stageHeight * 0.05;
			itemButtonOver.width = stage.stageWidth * 0.17;
			itemButtonOver.height = stage.stageHeight * 0.15;
			itemButtonOver.visible = false;
			itemButtonOver.addEventListener(MouseEvent.MOUSE_OUT, iboOut);
			itemButtonOver.addEventListener(MouseEvent.MOUSE_UP, openAndCloseSpot);
			
			addChild(itemButtonOver);
			itemButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setIBO);
		}
		
		protected function iboOut(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			itemButton.visible = true;
			itemButtonOver.visible = false;
		}
		
		protected function setIB(event:Event):void
		{
			// TODO Auto-generated method stub
			itemButton.x = stage.stageWidth * 0.75;
			itemButton.y = stage.stageHeight * 0.05;
			itemButton.width = stage.stageWidth * 0.17;
			itemButton.height = stage.stageHeight * 0.15;
			itemButton.addEventListener(MouseEvent.MOUSE_OVER, ibRollover);
			
			addChild(itemButton);
			itemButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setIB);
		}
		
		protected function ibRollover(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "button";
			itemButton.visible = false;
			itemButtonOver.visible = true;
		}
		
		protected function openAndCloseSpot(event:MouseEvent):void
		{
			
			myItemSpot.visible = !myItemSpot.visible;
		}
		
		protected function setBBO(event:Event):void
		{
			// TODO Auto-generated method stub
			backButtonOver.x = stage.stageWidth * 0.05;
			backButtonOver.y = stage.stageHeight * 0.05;
			backButtonOver.width = stage.stageWidth * 0.17;
			backButtonOver.height = stage.stageHeight * 0.15;
			backButtonOver.visible = false;
			backButtonOver.addEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.addEventListener(MouseEvent.MOUSE_UP, goBack);
			
			//addChild(backButtonOver);
			backButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBBO);
		}
		
		private function bboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			backButton.visible = true;
			backButtonOver.visible = false;
		}
		
		private function setBB(e:Event):void{
			backButton.x = stage.stageWidth * 0.05;
			backButton.y = stage.stageHeight * 0.05;
			backButton.width = stage.stageWidth * 0.17;
			backButton.height = stage.stageHeight * 0.15;
			backButton.addEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			
			//addChild(backButton);
			backButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBB);
		}
		
		private function bbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			backButton.visible = false;
			backButtonOver.visible = true;
		}
		
		protected function goBack(event:MouseEvent):void{
			bboOut(event);

			aj = new AssigningJob();
			aj.addEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.addEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.addChild(aj);
			
		}
		
		private function closeajPage(e:Event):void{
			aj.removeEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.removeEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.removeChild(aj);
			switch(e.type){
				case "pageClose":
					br = new Ballroom();
					br.addEventListener(Ballroom.PAGE_CLOSE1, closebrPage);
					br.addEventListener(Ballroom.PAGE_CLOSE21, closebrPage);
					br.addEventListener(Ballroom.PAGE_CLOSE22, closebrPage);
					ps.addChild(br);
					break;
				case "pageClose1":
					o1r = new Opt1Room();
					o1r.addEventListener(Opt1Room.PAGE_CLOSE1, closeo1rPage);
					o1r.addEventListener(Opt1Room.PAGE_CLOSE2, closeo1rPage);
					ps.addChild(o1r);
					break;
				default:
					break;
			}
		}
		
		private function resetGobackPosition():void{
			var topPosition:uint = numChildren - 1;
			setChildIndex(backButton, topPosition);
			setChildIndex(backButtonOver, topPosition);
		}
		
		private function closebrPage(e:Event):void{
			br.removeEventListener(Ballroom.PAGE_CLOSE1, closebrPage);
			br.removeEventListener(Ballroom.PAGE_CLOSE21, closebrPage);
			br.removeEventListener(Ballroom.PAGE_CLOSE22, closebrPage);
			ps.removeChild(br);
			
			switch(e.type){
				case "pageClose1":
					rt = new RebeccaTalk();
					rt.addEventListener(RebeccaTalk.PAGE_CLOSE1, closertPage);
					rt.addEventListener(RebeccaTalk.PAGE_CLOSE2, closertPage);
					rt.addEventListener(RebeccaTalk.PAGE_CLOSE3, closertPage);
					rt.addEventListener(RebeccaTalk.PAGE_CLOSE4, closertPage);
					ps.addChild(rt);
					break;
				case "pageClose21":
					tempOpen();
					if(myItemSpot.obK){
						myItemSpot.obK.visible = true;
					}
					hwin = new HallwayIn();
					hwin.addEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
					ps.addChild(hwin);
					break;
				case "pageClose22":
					hwin = new HallwayIn();
					hwin.addEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
					ps.addChild(hwin);
					break;
				default:
					break;
			}
			
		}
		
		private function closeo1rPage(e:Event):void{
			o1r.removeEventListener(Opt1Room.PAGE_CLOSE1, closeo1rPage);
			o1r.removeEventListener(Opt1Room.PAGE_CLOSE2, closeo1rPage);
			ps.removeChild(o1r);
			switch(e.type){
				case "pageClose1":
					variables.knowParker = true;
					hwout = new HallwayOut();
					hwout.addEventListener(HallwayOut.PAGE_CLOSE1, closehwoutPage);
					hwout.addEventListener(HallwayOut.PAGE_CLOSE2, closehwoutPage);
					ps.addChild(hwout);
					break;
				case "pageClose2":
					sr = new SeekingRebecca();
					sr.addEventListener(SeekingRebecca.PAGE_CLOSE, closesrPage);
					ps.addChild(sr);
				default:
					break;
			}
		}
		
		protected function closesrPage(event:Event):void
		{
			// TODO Auto-generated method stub
			sr.removeEventListener(SeekingRebecca.PAGE_CLOSE, closesrPage);
			ps.removeChild(sr);
			
			switch(event.type){
				case "pageClose":
					hwin = new HallwayIn();
					hwin.addEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
					ps.addChild(hwin);
					break;
				case "pageClose1":
					ec43 = new EscapeC43();
					ec43.addEventListener(EscapeC43.PAGE_CLOSE, closeec43Page);
					ps.addChild(ec43);
					break;
				case "pageClose2":
					fdfl = new FrontDeckFL();
					fdfl.isEmpty = !myItemSpot.obF.visible;
					myItemSpot.addEventListener(ItemSpot.ItemClick5, fdfl.close);
					fdfl.addEventListener(FrontDeckFL.PAGE_CLOSE1, closefdflPage);
					fdfl.addEventListener(FrontDeckFL.PAGE_CLOSE2, closefdflPage);
					ps.addChild(fdfl);
					break;
				default:
					break;
			}
			
		}		
		
		protected function closefdflPage(event:Event):void
		{
			// TODO Auto-generated method stub
			fdfl.removeEventListener(FrontDeckFL.PAGE_CLOSE1, closefdflPage);
			fdfl.removeEventListener(FrontDeckFL.PAGE_CLOSE2, closefdflPage);
			ps.removeChild(fdfl);
			variables.diswim = 2;
			
			switch(event.type){
				case "pageClose1":
					flt = new FlashlightTyping();
					flt.addEventListener(FlashlightTyping.PAGE_CLOSE0, closefltPage);
					flt.addEventListener(FlashlightTyping.PAGE_CLOSE1, closefltPage);
					flt.addEventListener(FlashlightTyping.PAGE_CLOSE2, closefltPage);
					flt.addEventListener(FlashlightTyping.PAGE_CLOSE3, closefltPage);
					ps.addChild(flt);
					break;
				case "pageClose2":
					csc = new CharacterSwimC();
					csc.addEventListener(CharacterSwimC.PAGE_CLOSE, closecscPage);
					ps.addChild(csc);
					break;
				default:
					break;
			}
			
		}
		
		protected function closecscPage(event:Event):void
		{
			// TODO Auto-generated method stub
			csc.removeEventListener(CharacterSwimC.PAGE_CLOSE, closecscPage);
			ps.removeChild(csc);
			
			sf = new SwimFast();
			sf.addEventListener(SwimFast.PAGE_CLOSE0, closesfPage);
			sf.addEventListener(SwimFast.PAGE_CLOSE1, closesfPage);
			sf.addEventListener(SwimFast.PAGE_CLOSE2, closesfPage);
			sf.addEventListener(SwimFast.PAGE_CLOSE3, closesfPage);
			ps.addChild(sf);
		}
		
		protected function closefltPage(event:Event):void
		{
			// TODO Auto-generated method stub
			flt.removeEventListener(FlashlightTyping.PAGE_CLOSE0, closefltPage);
			flt.removeEventListener(FlashlightTyping.PAGE_CLOSE1, closefltPage);
			flt.removeEventListener(FlashlightTyping.PAGE_CLOSE2, closefltPage);
			flt.removeEventListener(FlashlightTyping.PAGE_CLOSE3, closefltPage);
			ps.removeChild(flt);
			
			switch(event.type){
				case "pageClose0":
					ec48 = new EscapeC48();
					ec48.addEventListener(EscapeC48.PAGE_CLOSE, closeec48Page);
					ps.addChild(ec48);
					break;
				case "pageClose1":
					ec29 = new Escape29();
					ec29.addEventListener(Escape29.PAGE_CLOSE, closeec29Page);
					ps.addChild(ec29);
				
					break;
				case "pageClose2":
					dc51 = new DieC51();
					dc51.addEventListener(DieC51.PAGE_CLOSE, closedc51Page);
					ps.addChild(dc51);
					break;
				case "pageClose3":
					dc49 = new DieC49();
					dc49.addEventListener(DieC49.PAGE_CLOSE, closedc49Page);
					ps.addChild(dc49);
					break;
				default:
					dc49 = new DieC49();
					dc49.addEventListener(DieC49.PAGE_CLOSE, closedc49Page);
					ps.addChild(dc49);
					break;
			}
		}
		
		protected function closeec29Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec29.removeEventListener(Escape29.PAGE_CLOSE, closeec29Page);
			ps.removeChild(ec29);
			
			badEnding2 = new BadEndingChangeAppearance();
			badEnding2.addEventListener(BadEndingChangeAppearance.PAGE_CLOSE1, closebed2Page);
			ps.addChild(badEnding2);
		}
		
		protected function closedc49Page(event:Event):void
		{
			// TODO Auto-generated method stub
			dc49.removeEventListener(DieC49.PAGE_CLOSE, closedc49Page);
			ps.removeChild(dc49);
			
			badEnding1 = new BadEndingDisappear();
			badEnding1.addEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.addChild(badEnding1);
		}
		
		protected function closeec48Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec48.removeEventListener(EscapeC48.PAGE_CLOSE, closeec48Page);
			ps.removeChild(ec48);
			
			godEnding = new GoodEnding();
			godEnding.addEventListener(GoodEnding.PAGE_CLOSE1, closegoodPage);
			ps.addChild(godEnding);
		}
		
		protected function closeec43Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec43.removeEventListener(EscapeC43.PAGE_CLOSE, closeec43Page);
			ps.removeChild(ec43);
			
			godEnding = new GoodEnding();
			godEnding.addEventListener(GoodEnding.PAGE_CLOSE1, closegoodPage);
			ps.addChild(godEnding);
		}
		
		private function closertPage(e:Event):void{
			rt.removeEventListener(RebeccaTalk.PAGE_CLOSE1, closertPage);
			rt.removeEventListener(RebeccaTalk.PAGE_CLOSE2, closertPage);
			rt.removeEventListener(RebeccaTalk.PAGE_CLOSE3, closertPage);
			rt.removeEventListener(RebeccaTalk.PAGE_CLOSE4, closertPage);
			ps.removeChild(rt);
			
			var temp:int;
			switch(e.type){
				case "pageClose1":
					tempOpen();
					if(myItemSpot.obP){
						myItemSpot.obP.visible = true;
					}
					temp = 1;
					break;
				case "pageClose2":
					temp = 2;
					break;
				case "pageClose3":
					tempOpen();
					if(myItemSpot.obP){
						myItemSpot.obP.visible = true;
					}
					temp = 3;
					break;
				case "pageClose4":
					tempOpen();
					if(myItemSpot.obP){
						myItemSpot.obP.visible = true;
					}
					if(myItemSpot.obP){
						myItemSpot.obP.visible = true;
					}
					temp = 4;
					break;
				default:
					break;
			}
			
			o2o = new Opt2Out();
			o2o.lastS = temp;
			o2o.addEventListener(Opt2Out.PAGE_CLOSE1, closeo2oPage);
			o2o.addEventListener(Opt2Out.PAGE_CLOSE2, closeo2oPage);
			o2o.addEventListener(Opt2Out.PAGE_CLOSE3, closeo2oPage);
			ps.addChild(o2o);
		}
		
		private function closeo2oPage(e:Event):void{
			o2o.removeEventListener(Opt2Out.PAGE_CLOSE1, closeo2oPage);
			o2o.removeEventListener(Opt2Out.PAGE_CLOSE2, closeo2oPage);
			o2o.removeEventListener(Opt2Out.PAGE_CLOSE3, closeo2oPage);
			ps.removeChild(o2o);
			
			switch(e.type){
				case "pageClose1":
					variables.knowRebacca = true;
					variables.likedRebacca = true;
					myItemSpot.obR.visible = false;
					break;
				case "pageClose2":
					variables.knowRebacca = true;
					myItemSpot.obP.visible = false;
					break;
				case "pageClose3":
					break;
				default:
					break;
			}
			
			hwin = new HallwayIn();
			hwin.addEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
			ps.addChild(hwin);
			/*transitionAB = new Test();
			transitionAB.addEventListener(Test.PAGE_CLOSE, closetabPage);
			addChild(transitionAB);
			trace(transitionAB.totalFrames);*/
		}
		
		protected function closehwoutPage(e:Event):void{
			hwout.removeEventListener(HallwayOut.PAGE_CLOSE1, closehwoutPage);
			hwout.removeEventListener(HallwayOut.PAGE_CLOSE2, closehwoutPage);
			ps.removeChild(hwout);
			
			switch(e.type){
				case "pageClose1":
					tempOpen();
					myItemSpot.obC.visible = true;
					break;
				case "pageClose2":
					break;
				default:
					break;
			}
			
			mpr = new MissParkersRoom();
			mpr.addEventListener(MissParkersRoom.PAGE_CLOSE, closemprPage);
			ps.addChild(mpr);
		}
		
		protected function closemprPage(event:Event):void
		{
			// TODO Auto-generated method stub
			mpr.removeEventListener(MissParkersRoom.PAGE_CLOSE, closemprPage);
			ps.removeChild(mpr);
			
			hwin = new HallwayIn();
			hwin.addEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
			ps.addChild(hwin);
			
			
		}		
		
		
		protected function closetabPage(event:Event):void
		{
			// TODO Auto-generated method stub
			/*transitionAB.removeEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
			ps.removeChild(transitionAB);*/
			hwin.removeEventListener(HallwayIn.PAGE_CLOSE, closetabPage);
			ps.removeChild(hwin);
			
			brb = new BallroomB();
			brb.addEventListener(BallroomB.PAGE_CLOSE1, closebrbPage);
			brb.addEventListener(BallroomB.PAGE_CLOSE2, closebrbPage);
			ps.addChild(brb);
		}
		
		protected function closebrbPage(event:Event):void
		{
			// TODO Auto-generated method stub
			brb.removeEventListener(BallroomB.PAGE_CLOSE1, closebrbPage);
			brb.removeEventListener(BallroomB.PAGE_CLOSE2, closebrbPage);
			ps.removeChild(brb);
			
			switch(event.type){
				case "pageClose1":
					des = new DessertSection();
					if(variables.knowRebacca && variables.likedRebacca){
						des.outV = 1;
					}else if(variables.knowRebacca && !variables.likedRebacca){
						des.outV = 2;
					}else if(variables.knowRebacca && variables.findRebacca){
						des.outV = 3;
					}else{
						des.outV = 4;
					}
					des.addEventListener(DessertSection.PAGE_CLOSE, closedesPage);
					ps.addChild(des);
					break;
				case "pageClose2":
					drs = new DrinkSection();
					if(variables.knowParker){
						drs.outV = 1;
					}else{
						drs.outV = 2;
					}
					drs.addEventListener(DrinkSection.PAGE_CLOSE, closedrsPage);
					ps.addChild(drs);
					break;
				default:
					break;
			}
		}
		
		protected function closedesPage(event:Event):void
		{
			// TODO Auto-generated method stub
			des.removeEventListener(DessertSection.PAGE_CLOSE, closedesPage);
			ps.removeChild(des);
			
			if(des.outV == 4){
				brw = new BallroomWorking();
				brw.addEventListener(BallroomWorking.PAGE_CLOSE, closebrwPage);
				ps.addChild(brw);
			}else{
				hwfl = new HallwayFL();
				hwfl.addEventListener(HallwayFL.PAGE_CLOSE1, closehwflPage);
				hwfl.addEventListener(HallwayFL.PAGE_CLOSE2, closehwflPage);
				ps.addChild(hwfl);
			}
			
		}
		
		protected function closebrwPage(event:Event):void
		{
			// TODO Auto-generated method stub
			brw.removeEventListener(BallroomWorking.PAGE_CLOSE, closebrwPage);
			ps.removeChild(brw);
			variables.fromBtoC = 3;
			
			transitionBC = new TransitionBtoC();
			transitionBC.addEventListener(TransitionBtoC.PAGE_CLOSE, closetbcPage);
			ps.addChild(transitionBC);
			
		}
		
		protected function closetbcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			transitionBC.removeEventListener(TransitionBtoC.PAGE_CLOSE, closetbcPage);
			ps.removeChild(transitionBC);
			song.stop();
			song1 = soundFactory1.play();
			song1.addEventListener(Event.SOUND_COMPLETE,onComplete1);
			
			switch(variables.fromBtoC){
				case 1:
					fdc = new FrontDeckC();
					fdc.preS = false;
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE1, closefdcPage);
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE2, closefdcPage);
					ps.addChild(fdc);
					
					//soundFactory1.addEventListener(Event.COMPLETE, completeHandler1);
					
					break;
				case 2:
					mprc = new MissParkersRoomC();
					mprc.addEventListener(MissParkersRoomC.PAGE_CLOSE, closemprcPage);
					ps.addChild(mprc);
					break;
				case 3:
					brc = new BallroomC;
					brc.addEventListener(BallroomC.PAGE_CLOSE, closebrcPage);
					ps.addChild(brc);
					break;
				default:
					break;
			}
		}
		
		protected function closefdcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			fdc.removeEventListener(FrontDeckC.PAGE_CLOSE1, closefdcPage);
			fdc.removeEventListener(FrontDeckC.PAGE_CLOSE2, closefdcPage);
			ps.removeChild(fdc);
			
			switch(event.type){
				case "pageClose1":
					phg = new PreHelpGerman();
					phg.preS = fdc.preS;
					phg.addEventListener(PreHelpGerman.PAGE_CLOSE, closephgPage);
					ps.addChild(phg);
					break;
				case "pageClose2":
					phr = new PreHelpRebecca();
					phr.preS = fdc.preS;
					phr.addEventListener(PreHelpRebecca.PAGE_CLOSE, closephrPage);
					ps.addChild(phr);
					break;
				default:
					break;
			}
		}
		
		protected function closephgPage(event:Event):void
		{
			// TODO Auto-generated method stub
			phg.removeEventListener(PreHelpGerman.PAGE_CLOSE, closephgPage);
			ps.removeChild(phg);
			
			hgb = new HelpGermanonBoat();
			hgb.addEventListener(HelpGermanonBoat.PAGE_CLOSE1, closehgbPage);
			hgb.addEventListener(HelpGermanonBoat.PAGE_CLOSE2, closehgbPage);
			ps.addChild(hgb);
		}
		
		protected function closehgbPage(event:Event):void
		{
			// TODO Auto-generated method stub
			hgb.removeEventListener(HelpGermanonBoat.PAGE_CLOSE1, closehgbPage);
			hgb.removeEventListener(HelpGermanonBoat.PAGE_CLOSE2, closehgbPage);
			ps.removeChild(hgb);
			
			kob = new KnifeonBoat();
			if(event.type == "pageClose1") variables.stopLowing = true;
			kob.isEmpty = !myItemSpot.obK.visible;
			myItemSpot.addEventListener(ItemSpot.ItemClick1, kob.close);
			kob.addEventListener(KnifeonBoat.PAGE_CLOSE1, closekobPage);
			kob.addEventListener(KnifeonBoat.PAGE_CLOSE2, closekobPage);
			ps.addChild(kob);
		}
		
		protected function closekobPage(event:Event):void
		{
			// TODO Auto-generated method stub
			kob.removeEventListener(KnifeonBoat.PAGE_CLOSE1, closekobPage);
			kob.removeEventListener(KnifeonBoat.PAGE_CLOSE2, closekobPage);
			ps.removeChild(kob);
			song1.stop();
			
			if(event.type == "pageClose1"){
				if(variables.stopLowing){
					ec20 = new EscapeC20();
					ec20.addEventListener(EscapeC20.PAGE_CLOSE, closeec20Page);
					ps.addChild(ec20);
				}else{
					ec40 = new EscapeC40();
					ec40.addEventListener(EscapeC40.PAGE_CLOSE, closeec40Page);
					ps.addChild(ec40);
				}
			}else{
				iw = new IntheWater();
				iw.preS = variables.stopLowing;
				iw.isEmpty = !myItemSpot.obF.visible;
				myItemSpot.addEventListener(ItemSpot.ItemClick5, iw.close);
				iw.addEventListener(IntheWater.PAGE_CLOSE1, closeiwPage);
				iw.addEventListener(IntheWater.PAGE_CLOSE2, closeiwPage);
				ps.addChild(iw);
			}
		}
		
		protected function closeec40Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec40.removeEventListener(EscapeC40.PAGE_CLOSE, closeec40Page);
			ps.removeChild(ec40);
			
			godEnding = new GoodEnding();
			godEnding.addEventListener(GoodEnding.PAGE_CLOSE1, closegoodPage);
			ps.addChild(godEnding);
		}
		
		protected function closeiwPage(event:Event):void
		{
			// TODO Auto-generated method stub
			myItemSpot.removeEventListener(ItemSpot.ItemClick5, iw.close);
			myItemSpot.obF.visible = false;
			iw.removeEventListener(IntheWater.PAGE_CLOSE1, closeiwPage);
			iw.removeEventListener(IntheWater.PAGE_CLOSE2, closeiwPage);
			ps.removeChild(iw);
			
			if(event.type == "pageClose1"){
				flt = new FlashlightTyping();
				if(variables.haveLiquor == 2){
					flt.totalTimes = 3;
				}else if (variables.haveLiquor == 1){
					flt.totalTimes = 2;
				}else{
					
				}
				flt.addEventListener(FlashlightTyping.PAGE_CLOSE0, closefltPage);
				flt.addEventListener(FlashlightTyping.PAGE_CLOSE1, closefltPage);
				flt.addEventListener(FlashlightTyping.PAGE_CLOSE2, closefltPage);
				flt.addEventListener(FlashlightTyping.PAGE_CLOSE3, closefltPage);
				ps.addChild(flt);
				
			}else{
				sf = new SwimFast();
				sf.addEventListener(SwimFast.PAGE_CLOSE0, closesfPage);
				sf.addEventListener(SwimFast.PAGE_CLOSE1, closesfPage);
				sf.addEventListener(SwimFast.PAGE_CLOSE2, closesfPage);
				sf.addEventListener(SwimFast.PAGE_CLOSE3, closesfPage);
				ps.addChild(sf);
			}
		}
		
		protected function closeec20Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec20.removeEventListener(EscapeC20.PAGE_CLOSE, closeec20Page);
			ps.removeChild(ec20);
			
			badEnding2 = new BadEndingChangeAppearance();
			badEnding2.addEventListener(BadEndingChangeAppearance.PAGE_CLOSE1, closebed2Page);
			ps.addChild(badEnding2);
		}
		
		protected function closephrPage(event:Event):void
		{
			// TODO Auto-generated method stub
			phr.removeEventListener(PreHelpRebecca.PAGE_CLOSE, closephrPage);
			ps.removeChild(phr);
			
			sr = new SeekingRebecca();
			sr.addEventListener(SeekingRebecca.PAGE_CLOSE1, closesrPage);
			sr.addEventListener(SeekingRebecca.PAGE_CLOSE2, closesrPage);
			sr.preS = true;
			ps.addChild(sr);
		}
		
		protected function closemprcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			mprc.removeEventListener(MissParkersRoomC.PAGE_CLOSE, closemprcPage);
			ps.removeChild(mprc);
			
			hwc = new HallwayC();
			hwc.addEventListener(HallwayC.PAGE_CLOSE, closehwcPage);
			ps.addChild(hwc);
		}
		
		protected function closehwcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			hwc.removeEventListener(HallwayC.PAGE_CLOSE, closehwcPage);
			ps.removeChild(hwc);
			
			tr = new TowelRoom();
			//if(myItemSpot.isEmpty()) tr.isEmpty = true;
			tr.isEmpty = myItemSpot.isEmpty();
			tr.addEventListener(TowelRoom.PAGE_CLOSE1, closetrPage);
			tr.addEventListener(TowelRoom.PAGE_CLOSE2, closetrPage);
			myItemSpot.addEventListener(ItemSpot.ItemClick4, tr.close);
			ps.addChild(tr);
			
		}
		
		protected function closetrPage(event:Event):void
		{
			// TODO Auto-generated method stub
			tr.removeEventListener(TowelRoom.PAGE_CLOSE1, closetrPage);
			tr.removeEventListener(TowelRoom.PAGE_CLOSE2, closetrPage);
			ps.removeChild(tr);
			
			switch(event.type){
				case "pageClose1":
					myItemSpot.obC.visible = false;
					myItemSpot.visible = false;
					fdc = new FrontDeckC();
					fdc.preS = true;
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE1, closefdcPage);
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE2, closefdcPage);
					ps.addChild(fdc);
					break;
				case "pageClose2":
					dlr = new DieinLaundryRoom();
					dlr.addEventListener(DieinLaundryRoom.PAGE_CLOSE, closedlrPage);
					ps.addChild(dlr);
					break;
				default:
					break;
			}
		}
		
		protected function closedlrPage(event:Event):void
		{
			// TODO Auto-generated method stub
			dlr.removeEventListener(DieinLaundryRoom.PAGE_CLOSE, closedlrPage);
			ps.removeChild(dlr);
			
			badEnding1 = new BadEndingDisappear();
			badEnding1.addEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.addChild(badEnding1);
		}
		
		protected function closebrcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			brc.removeEventListener(BallroomC.PAGE_CLOSE, closebrcPage);
			ps.removeChild(brc);
			
			bdc = new BackDeckC();
			bdc.addEventListener(BackDeckC.PAGE_CLOSE1, closebdcPage);
			bdc.addEventListener(BackDeckC.PAGE_CLOSE2, closebdcPage);
			ps.addChild(bdc);
		}
		
		protected function closebdcPage(event:Event):void
		{
			// TODO Auto-generated method stub
			bdc.removeEventListener(BackDeckC.PAGE_CLOSE1, closebdcPage);
			bdc.removeEventListener(BackDeckC.PAGE_CLOSE2, closebdcPage);
			ps.removeChild(bdc);
			variables.diswim = 1;
			
			switch(event.type){
				case "pageClose1":
					fdc = new FrontDeckC();
					fdc.preS = false;
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE1, closefdcPage);
					fdc.addEventListener(FrontDeckC.PAGE_CLOSE2, closefdcPage);
					ps.addChild(fdc);
					break;
				case "pageClose2":
					sf = new SwimFast();
					sf.addEventListener(SwimFast.PAGE_CLOSE0, closesfPage);
					sf.addEventListener(SwimFast.PAGE_CLOSE1, closesfPage);
					sf.addEventListener(SwimFast.PAGE_CLOSE2, closesfPage);
					sf.addEventListener(SwimFast.PAGE_CLOSE3, closesfPage);
					ps.addChild(sf);
					break;
				default:
					break;
			}
			
		}
		
		protected function closesfPage(event:Event):void
		{
			// TODO Auto-generated method stub
			sf.removeEventListener(SwimFast.PAGE_CLOSE0, closesfPage);
			sf.removeEventListener(SwimFast.PAGE_CLOSE1, closesfPage);
			sf.removeEventListener(SwimFast.PAGE_CLOSE2, closesfPage);
			sf.removeEventListener(SwimFast.PAGE_CLOSE3, closesfPage);
			ps.removeChild(sf);
			
			if(variables.diswim == 1){
				switch(event.type){
					case "pageClose0":
						ec3 = new Escape3();
						ec3.addEventListener(Escape3.PAGE_CLOSE, closeec3Page);
						ps.addChild(ec3);
						break;
					case "pageClose1":
						ec50 = new EscapeC50();
						ec50.addEventListener(EscapeC50.PAGE_CLOSE, closeec50Page);
						ps.addChild(ec50);
						break;
					default:
						ec52 = new DieC52();
						ec52.addEventListener(DieC52.PAGE_CLOSE, closeec52Page);
						ps.addChild(ec52);
						break;
					
				}
			}else if(variables.diswim == 2){
				switch(event.type){
					case "pageClose0":
						ec50 = new EscapeC50();
						ec50.addEventListener(EscapeC50.PAGE_CLOSE, closeec50Page);
						ps.addChild(ec50);
						break;
					case "pageClose1":
						dc51 = new DieC51();
						dc51.addEventListener(DieC51.PAGE_CLOSE, closedc51Page);
						ps.addChild(dc51);
						break;
					default:
						ec52 = new DieC52();
						ec52.addEventListener(DieC52.PAGE_CLOSE, closeec52Page);
						ps.addChild(ec52);
						break;
					
				}
			}else{
				switch(event.type){
					case "pageClose0":
						ec3 = new Escape3();
						ec3.addEventListener(Escape3.PAGE_CLOSE, closeec3Page);
						ps.addChild(ec3);
						break;
					case "pageClose1":
						ec29 = new Escape29();
						ec29.addEventListener(Escape29.PAGE_CLOSE, closeec29Page);
						ps.addChild(ec29);
						break;
					case "pageClose2":
						dc51 = new DieC51();
						dc51.addEventListener(DieC51.PAGE_CLOSE, closedc51Page);
						ps.addChild(dc51);
						break;
					case "pageClose3":
						ec52 = new DieC52();
						ec52.addEventListener(DieC52.PAGE_CLOSE, closeec52Page);
						ps.addChild(ec52);
						break;
					default:
						break;
				}
			}
			
			
		}
		
		protected function closedc51Page(event:Event):void
		{
			// TODO Auto-generated method stub
			dc51.removeEventListener(DieC51.PAGE_CLOSE, closedc51Page);
			ps.removeChild(dc51);
			
			badEnding1 = new BadEndingDisappear();
			badEnding1.addEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.addChild(badEnding1);
		}
		
		protected function closeec3Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec3.removeEventListener(Escape3.PAGE_CLOSE, closeec3Page);
			ps.removeChild(ec3);
			
			godEnding = new GoodEnding();
			godEnding.addEventListener(GoodEnding.PAGE_CLOSE1, closegoodPage);
			ps.addChild(godEnding);
		}
		
		protected function closeec50Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec50.removeEventListener(EscapeC50.PAGE_CLOSE, closeec50Page);
			ps.removeChild(ec50);
			
			badEnding2 = new BadEndingChangeAppearance();
			badEnding2.addEventListener(BadEndingChangeAppearance.PAGE_CLOSE1, closebed2Page);
			ps.addChild(badEnding2);
		}
		
		protected function closeec52Page(event:Event):void
		{
			// TODO Auto-generated method stub
			ec52.removeEventListener(DieC52.PAGE_CLOSE, closeec52Page);
			ps.removeChild(ec52);
			
			badEnding1 = new BadEndingDisappear();
			badEnding1.addEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.addChild(badEnding1);
		}
		
		protected function closehwflPage(event:Event):void
		{
			// TODO Auto-generated method stub
			hwfl.removeEventListener(HallwayFL.PAGE_CLOSE1, closehwflPage);
			hwfl.removeEventListener(HallwayFL.PAGE_CLOSE2, closehwflPage);
			ps.removeChild(hwfl);
			
			switch(event.type){
				case "pageClose1":
					tempOpen();
					myItemSpot.obF.visible = true;
					break;
				case "pageClose2":
					break;
				default:
					break;
			}
			nd = new NightDeck();
			nd.addEventListener(NightDeck.PAGE_CLOSE, closendPage);
			ps.addChild(nd);
		}
		
		protected function closendPage(event:Event):void
		{
			// TODO Auto-generated method stub
			nd = new NightDeck();
			nd.addEventListener(NightDeck.PAGE_CLOSE, closendPage);
			ps.addChild(nd);
			variables.fromBtoC = 1;
			
			transitionBC = new TransitionBtoC();
			transitionBC.addEventListener(TransitionBtoC.PAGE_CLOSE, closetbcPage);
			ps.addChild(transitionBC);
		}
		
		protected function closedrsPage(event:Event):void
		{
			// TODO Auto-generated method stub
			drs.removeEventListener(DrinkSection.PAGE_CLOSE, closedrsPage);
			ps.removeChild(drs);
			
			if(variables.knowParker){
				mprb = new MissParkersRoomB();
				mprb.addEventListener(MissParkersRoomB.PAGE_CLOSE1, closemprbPage);
				mprb.addEventListener(MissParkersRoomB.PAGE_CLOSE2, closemprbPage);
				ps.addChild(mprb);
			}else{
				brw = new BallroomWorking();
				brw.addEventListener(BallroomWorking.PAGE_CLOSE, closebrwPage);
				ps.addChild(brw);
			}
			
		}
		
		protected function closemprbPage(event:Event):void
		{
			// TODO Auto-generated method stub
			mprb.removeEventListener(MissParkersRoomB.PAGE_CLOSE1, closemprbPage);
			mprb.removeEventListener(MissParkersRoomB.PAGE_CLOSE2, closemprbPage);
			ps.removeChild(mprb);
			switch(event.type){
				case "pageClose1":
					variables.haveLiquor = 2;
					break;
				case "pageClose2":
					variables.haveLiquor = 1;
					break;
				default:
					break;
			}
			variables.fromBtoC = 2;
			
			transitionBC = new TransitionBtoC();
			transitionBC.addEventListener(TransitionBtoC.PAGE_CLOSE, closetbcPage);
			ps.addChild(transitionBC);
		}
		
		protected function closecdPage(event:Event):void
		{
			// TODO Auto-generated method stub
			cd.removeEventListener(CharacterDie.PAGE_CLOSE, closecdPage);
			ps.removeChild(cd);
			
			badEnding1 = new BadEndingDisappear();
			badEnding1.addEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.addChild(badEnding1);
		}
		
		protected function closebed1Page(event:Event):void
		{
			// TODO Auto-generated method stub
			badEnding1.removeEventListener(BadEndingDisappear.PAGE_CLOSE1, closebed1Page);
			ps.removeChild(badEnding1);
			
			aj = new AssigningJob();
			aj.addEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.addEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.addChild(aj);
			
			variables.clear();
		}
		
		protected function closebed2Page(event:Event):void
		{
			// TODO Auto-generated method stub
			badEnding2.removeEventListener(BadEndingChangeAppearance.PAGE_CLOSE1, closebed2Page);
			ps.removeChild(badEnding2);
			
			aj = new AssigningJob();
			aj.addEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.addEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.addChild(aj);
			
			variables.clear();
		}
		
		protected function closegoodPage(event:Event):void
		{
			// TODO Auto-generated method stub
			godEnding.removeEventListener(GoodEnding.PAGE_CLOSE1, closegoodPage);
			ps.removeChild(godEnding);
			
			aj = new AssigningJob();
			aj.addEventListener(AssigningJob.PAGE_CLOSE, closeajPage);
			aj.addEventListener(AssigningJob.PAGE_CLOSE1, closeajPage);
			ps.addChild(aj);
			
			variables.clear();
		}
		
		private function reSize(e:Event):void{
			stage.width = stage.stageWidth;
			stage.height = stage.stageHeight;
		}
	}
}
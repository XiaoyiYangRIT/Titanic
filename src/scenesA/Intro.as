package scenesA
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	import behavior.Dialogue;
	
	import scenesC.TowelRoom;
	
	
	public class Intro extends Sprite
	{
		public static const PAGE_CLOSE:String = "pageClose";
		
		private var speed:int = 5;
		
		private var gameBG:Loader;
		private var upBG:Loader;
		private var downBG:Loader;
		
		
		private var rightArrow:Loader;
		private var vibrate:Number = 2.5;
		
		private var _duration:Number;
		
		public var connection:NetConnection;
		public var stream:NetStream;
		public var videoURL:String="materials/Interview.flv";
		public var video:Video = new Video();
		
		public var connection1:NetConnection;
		public var stream1:NetStream;
		public var videoURL1:String="materials/BasementBook.flv";
		public var video1:Video = new Video();
		
		public var connection2:NetConnection;
		public var stream2:NetStream;
		public var videoURL2:String="materials/Transition_1sec.flv";
		public var video2:Video = new Video();
		
		private var TVFrame:Loader;
		
		private var skipButton:Loader;
		private var skipButtonOver:Loader;
		
		private var upStairButton:Loader;
		private var upStairButtonOver:Loader;
		
		private var downStairButton:Loader;
		private var downStairButtonOver:Loader;
		
		private var backButton:Loader;
		private var backButtonOver:Loader;
		
		private var diary:Loader;
		private var diaryOver:Loader;
		
		private var song:SoundChannel;
		private var soundFactory:Sound;
		
		private var video1playfinished:Boolean;
		
		private var speaking:Dialogue;
		private var diashift:Boolean;
		private var diadown:Boolean;
		
		public function Intro()
		{
			init();
			super();
		}
		
		private function init():void{
			
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/GrandpaRoom.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setHallway);
			
			upBG = new Loader();
			upBG.load(new URLRequest("image/scene/grandpaBDRoomMichael.jpg"));
			upBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setUpstair);
			
			downBG = new Loader();
			downBG.load(new URLRequest("image/scene/Basement_Begin_sm.jpg"));
			downBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setDownstair);
		}
		
		protected function setDownstair(event:Event):void
		{
			// TODO Auto-generated method stub
			downBG.width = stage.stageWidth;
			downBG.height = stage.stageHeight;
			downBG.visible = false;
			addChild(downBG);
			downBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDownstair);
		}
		
		protected function setUpstair(event:Event):void
		{
			// TODO Auto-generated method stub
			upBG.width = stage.stageWidth;
			upBG.height = stage.stageHeight;
			upBG.visible = false;
			addChild(upBG);
			upBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setUpstair);
		}		
		
		private function setHallway(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setHallway);
			
			initButton();
			
			connection=new NetConnection();
			connection.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler);
			connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
			connection.connect(null);
			var infoObject:Object=new Object();
			infoObject.onMetaData=function(info:Object):void{};
			stream.client=infoObject;
			stream.client.onMetaData = function(infoObject:Object):void {};
			stream.client = {};
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onMD(data:Object):void
		{
			_duration = data.duration;
		}
		
		private function initButton():void{
			skipButton = new Loader();
			skipButton.load(new URLRequest("image/SmallBtns/SkipIntro_2.png"));
			skipButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setSB);
			
			skipButtonOver = new Loader();
			skipButtonOver.load(new URLRequest("image/SmallBtns/SkipIntro_1.png"));
			skipButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setSBO);
			
			upStairButton = new Loader();
			upStairButton.load(new URLRequest("image/SmallBtns/Stairs_Up_2.png"));
			upStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSB);
			
			upStairButtonOver = new Loader();
			upStairButtonOver.load(new URLRequest("image/SmallBtns/Stairs_Up_1.png"));
			upStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setUSBO);
			
			downStairButton = new Loader();
			downStairButton.load(new URLRequest("image/SmallBtns/Stairs_Down_2.png"));
			downStairButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSB);
			
			downStairButtonOver = new Loader();
			downStairButtonOver.load(new URLRequest("image/SmallBtns/Stairs_Down_1.png"));
			downStairButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setDSBO);
			
			backButton = new Loader();
			backButton.load(new URLRequest("image/SmallBtns/BackBtn_1.png"));
			backButton.contentLoaderInfo.addEventListener(Event.COMPLETE, setBB);
			
			backButtonOver = new Loader();
			backButtonOver.load(new URLRequest("image/SmallBtns/BackBtn_2.png"));
			backButtonOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setBBO);
			
			diary = new Loader();
			diary.load(new URLRequest("image/objects/Diary_closed.png"));
			diary.contentLoaderInfo.addEventListener(Event.COMPLETE, setD);
			
			diaryOver = new Loader();
			diaryOver.load(new URLRequest("image/objects/Diary_rollover.png"));
			diaryOver.contentLoaderInfo.addEventListener(Event.COMPLETE, setDO);
		}
		
	
		private function netStatusHandler(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case "NetConnection.Connect.Success" :
					connectStream();
					break;
				case "NetStream.Play.StreamNotFound" :
					trace("Unable to locate video: " + videoURL);
					break;
				case "NetStream.Buffer.Full" :
					break;
				case  "NetStream.Play.Stop" :
					//removeChild(video);
					video1playfinished = true;
					stream.seek(0);
					stream.pause();
					soundFactory = new Sound(new URLRequest("materials/introduction_mixdown.mp3"));
					soundFactory.addEventListener(Event.COMPLETE, completeHandler);
					trace("finish playing！");
					break;
			}
		}
		
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			soundFactory.removeEventListener(Event.COMPLETE, completeHandler);
			song = soundFactory.play();
		}
		
		
		private function connectStream():void
		{
			stream=new NetStream(connection);
			stream.client=this;
			stream.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler);
			stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR,asyncErrorHandler);
			
			video.attachNetStream(stream);
			stream.play(videoURL);
			video.x = gameBG.width * 0.57;
			video.y = gameBG.height * 0.59;
			video.width = gameBG.width * 0.09;
			video.height = gameBG.height * 0.1;
			addChild(video);
			
			TVFrame = new Loader();
			TVFrame.load(new URLRequest("image/objects/tv_low.png"));
			TVFrame.contentLoaderInfo.addEventListener(Event.COMPLETE, setTVF);
		}
		
		private function setTVF(e:Event):void{
			TVFrame.width = video.width * 2;
			TVFrame.height = video.height * 2;
			TVFrame.x = video.x - TVFrame.width * 0.2;
			TVFrame.y = video.y - TVFrame.height * 0.2;
			addChild(TVFrame);
		
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function asyncErrorHandler(event:AsyncErrorEvent):void
		{
			
		}
		
		
		protected function setSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			skipButtonOver.x = gameBG.width * 0.9;
			skipButtonOver.y = gameBG.height * 0.9;
			skipButtonOver.width = gameBG.width * 0.1;
			skipButtonOver.height = gameBG.height * 0.1;
			skipButtonOver.visible = false;
			skipButtonOver.addEventListener(MouseEvent.MOUSE_OUT, sboOut);
			skipButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, close);
			
			addChild(skipButtonOver);
			skipButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setSBO);
		}
		
		private function sboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			skipButton.visible = true;
			skipButtonOver.visible = false;
		}
		
		private function setSB(e:Event):void{
			skipButton.x = gameBG.width * 0.9;
			skipButton.y = gameBG.height * 0.9;
			skipButton.width = gameBG.width * 0.1;
			skipButton.height = gameBG.height * 0.1;
			skipButton.addEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			
			addChild(skipButton);
			skipButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setSB);
		}
		
		private function sbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			skipButton.visible = false;
			skipButtonOver.visible = true;
		}
		
		
		protected function setUSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			upStairButtonOver.x = gameBG.width * 0.7;
			upStairButtonOver.y = gameBG.height * 0.2;
			upStairButtonOver.width = gameBG.width * 0.1;
			upStairButtonOver.height = gameBG.height * 0.2;
			upStairButtonOver.visible = false;
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goUpstair);
			
			addChild(upStairButtonOver);
			upStairButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setUSBO);
		}
		
		protected function goUpstair(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			upStairButton.removeEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goUpstair);
			
			gameBG.visible = false;
			upBG.visible = true;
			
			upStairButton.visible = false;
			upStairButtonOver.visible = false;
			
			downStairButton.visible = false;
			downStairButtonOver.visible = false;
			
			backButton.visible = true;
			if(!backButton.hasEventListener(MouseEvent.MOUSE_OVER)) backButton.addEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			if(!backButtonOver.hasEventListener(MouseEvent.MOUSE_OUT)) backButtonOver.addEventListener(MouseEvent.MOUSE_OUT, bboOut);
			if(!backButtonOver.hasEventListener(MouseEvent.MOUSE_DOWN)) backButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			TVFrame.visible = false;
			
			video.visible = false;
			stream.pause();
			
			setDialog();
		}
		
		private function setDialog():void{
			diashift = true;
			diadown = false;
			speaking = new Dialogue('us', 0, upBG.height, upBG.width, upBG.height * 0.2);
			addChild(speaking);
			
			addEventListener(MouseEvent.CLICK, mouseclick);
			addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		private function usboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			upStairButton.visible = true;
			upStairButtonOver.visible = false;
		}
		
		private function setUSB(e:Event):void{
			upStairButton.x = gameBG.width * 0.7;
			upStairButton.y = gameBG.height * 0.2;
			upStairButton.width = gameBG.width * 0.1;
			upStairButton.height = gameBG.height * 0.2;
			upStairButton.addEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			
			addChild(upStairButton);
			upStairButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setUSB);
		}
		
		private function usbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			upStairButton.visible = false;
			upStairButtonOver.visible = true;
		}
		
		protected function setDSBO(event:Event):void
		{
			// TODO Auto-generated method stub
			downStairButtonOver.x = gameBG.width * 0.7;
			downStairButtonOver.y = gameBG.height * 0.5;
			downStairButtonOver.width = gameBG.width * 0.1;
			downStairButtonOver.height = gameBG.height * 0.2;
			downStairButtonOver.visible = false;
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, dsboOut);
			downStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goDpstair);
			
			addChild(downStairButtonOver);
			downStairButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDSBO);
		}
		
		protected function goDpstair(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			
			downStairButton.removeEventListener(MouseEvent.MOUSE_OVER, dsbRollover);
			downStairButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, dsboOut);
			downStairButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goDpstair);
			
			diary.visible = true;
			
			gameBG.visible = false;
			downBG.visible = true;
			
			upStairButton.visible = false;
			upStairButtonOver.visible = false;
			
			downStairButton.visible = false;
			downStairButtonOver.visible = false;
			
			TVFrame.visible = false;
			video.visible = false;
			stream.pause();
			
		}
		
		private function dsboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			downStairButton.visible = true;
			downStairButtonOver.visible = false;
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			//skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
		}
		
		private function setDSB(e:Event):void{
			downStairButton.x = gameBG.width * 0.7;
			downStairButton.y = gameBG.height * 0.5;
			downStairButton.width = gameBG.width * 0.1;
			downStairButton.height = gameBG.height * 0.2;
			downStairButton.addEventListener(MouseEvent.MOUSE_OVER, dsbRollover);
			
			addChild(downStairButton);
			downStairButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDSB);
		}
		
		private function dsbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			downStairButton.visible = false;
			downStairButtonOver.visible = true;
		}
		
		protected function setBBO(event:Event):void
		{
			// TODO Auto-generated method stub
			backButtonOver.x = 0;
			backButtonOver.y = gameBG.height * 0.7;
			backButtonOver.width = gameBG.width * 0.12;
			backButtonOver.height = gameBG.height * 0.1;
			backButtonOver.visible = false;
			backButtonOver.addEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			addChild(backButtonOver);
			backButtonOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBBO);
		}
		
		protected function goBack(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			backButton.removeEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			backButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, bboOut);
			backButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goBack);
			
			gameBG.visible = true;
			upBG.visible = false;
			
			upStairButton.visible = true;
			if(!upStairButton.hasEventListener(MouseEvent.MOUSE_OVER)) upStairButton.addEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			if(!upStairButtonOver.hasEventListener(MouseEvent.MOUSE_OUT)) upStairButtonOver.addEventListener(MouseEvent.MOUSE_OUT, usboOut);
			if(!upStairButtonOver.hasEventListener(MouseEvent.MOUSE_DOWN)) upStairButtonOver.addEventListener(MouseEvent.MOUSE_DOWN, goUpstair);
			//upStairButtonOver.visible = false;
			
			downStairButton.visible = true;
			//downStairButtonOver.visible = false;
			
			backButton.visible = false;
			backButtonOver.visible = false;
			
			TVFrame.visible = true;
			video.visible = true;
			if(!video1playfinished){
				stream.resume();
			}
			
		}
		
		private function bboOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			backButton.visible = true;
			backButtonOver.visible = false;
		}
		
		private function setBB(e:Event):void{
			backButton.x = 0;
			backButton.y = gameBG.height * 0.7;
			backButton.width = gameBG.width * 0.12;
			backButton.height = gameBG.height * 0.1;
			backButton.visible = false;
			backButton.addEventListener(MouseEvent.MOUSE_OVER, bbRollover);
			
			addChild(backButton);
			backButton.contentLoaderInfo.removeEventListener(Event.COMPLETE, setBB);
		}
		
		private function bbRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			backButton.visible = false;
			backButtonOver.visible = true;
		}
		
		protected function setDO(event:Event):void
		{
			// TODO Auto-generated method stub
			diaryOver.x = gameBG.width * 0.2;
			diaryOver.y = gameBG.height * 0.7;
			diaryOver.width = gameBG.width * 0.2;
			diaryOver.height = gameBG.height * 0.2;
			diaryOver.visible = false;
			diaryOver.addEventListener(MouseEvent.MOUSE_OUT, doOut);
			diaryOver.addEventListener(MouseEvent.MOUSE_DOWN, goD);
			
			addChild(diaryOver);
			diaryOver.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDO);
		}
		
		protected function goD(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
			
			connection1=new NetConnection();
			connection1.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler1);
			connection1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler1);
			connection1.connect(null);
			var infoObject:Object=new Object();
			infoObject.onMetaData=function(info:Object):void{};
			stream1.client=infoObject;
			stream1.client.onMetaData = function(infoObject:Object):void {};
			stream1.client = {};
			
		}
		
		
		private function doOut(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			diary.visible = true;
			diaryOver.visible = false;
		}
		
		private function setD(e:Event):void{
			diary.x = gameBG.width * 0.2;
			diary.y = gameBG.height * 0.7;
			diary.width = gameBG.width * 0.2;
			diary.height = gameBG.height * 0.2;
			diary.visible = false;
			diary.addEventListener(MouseEvent.MOUSE_OVER, dRollover);
			
			addChild(diary);
			diary.contentLoaderInfo.removeEventListener(Event.COMPLETE, setD);
		}
		
		private function dRollover(e:MouseEvent):void{
			Mouse.cursor = "button";
			diary.visible = false;
			diaryOver.visible = true;
		}
		
		private function onEnterFrame(e:Event):void{
			reSize();
			movedialog();
		}
		
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
							cleanDialog();
							break one;
						}
						speaking.diaContent.text = speaking.curdia[speaking.count];
					}
				}else if(!diadown && speaking.y > upBG.height * 0.8 && speaking.diaContent ){
					two:
					speaking.y -= 20;
					speaking.diaContent.y -= 20;
				}
				//*************坐标重设***********
				if(speaking.y < upBG.height * 0.8){
					speaking.y = upBG.height * 0.8;
				}
			}
		}
		
		private function cleanDialog():void{
			diashift = false;
			
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
			if(!diadown && diashift && speaking.diaContent){
				diadown = true;
				diashift = true;
			}
		}
		
		private function netStatusHandler1(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case "NetConnection.Connect.Success" :
					connectStream1();
					break;
				case "NetStream.Play.StreamNotFound" :
					trace("Unable to locate video: " + videoURL1);
					break;
				case "NetStream.Buffer.Full" :
					break;
				case  "NetStream.Play.Stop" :
					connection2=new NetConnection();
					connection2.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler2);
					connection2.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler2);
					connection2.connect(null);
					var infoObject:Object=new Object();
					infoObject.onMetaData=function(info:Object):void{};
					stream2.client=infoObject;
					stream2.client.onMetaData = function(infoObject:Object):void {};
					stream2.client = {};
					trace("finish playing！");
					break;
			}
		}
		private function connectStream1():void
		{
			stream1=new NetStream(connection1);
			stream1.client=this;
			stream1.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler1);
			stream1.addEventListener(AsyncErrorEvent.ASYNC_ERROR,asyncErrorHandler1);
			
			video1.attachNetStream(stream1);
			stream1.play(videoURL1);
			video1.width = gameBG.width;
			video1.height = gameBG.height;
			addChild(video1);
			
		}
		
		private function securityErrorHandler1(event:SecurityErrorEvent):void
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function asyncErrorHandler1(event:AsyncErrorEvent):void
		{
			
		}
		
		private function netStatusHandler2(event:NetStatusEvent):void
		{
			switch (event.info.code)
			{
				case "NetConnection.Connect.Success" :
					connectStream2();
					break;
				case "NetStream.Play.StreamNotFound" :
					trace("Unable to locate video: " + videoURL2);
					break;
				case "NetStream.Buffer.Full" :
					break;
				case  "NetStream.Play.Stop" :
					cleanandclose();
					break;
			}
		}
		private function connectStream2():void
		{
			stream2=new NetStream(connection2);
			stream2.client=this;
			stream2.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler2);
			stream2.addEventListener(AsyncErrorEvent.ASYNC_ERROR,asyncErrorHandler2);
			
			video2.attachNetStream(stream2);
			stream2.play(videoURL2);
			video2.width = gameBG.width;
			video2.height = gameBG.height;
			addChild(video2);
			
		}
		
		private function securityErrorHandler2(event:SecurityErrorEvent):void
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function asyncErrorHandler2(event:AsyncErrorEvent):void
		{
			
		}
		
		private function close(e:Event):void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			Mouse.cursor = "arrow";
			stream.seek(0);
			stream.pause();
			if(soundFactory){
				song.stop();
			}
			removeChild(video);
			skipButton.removeEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
			//removeChild(gameBG);
			//removeChild(mainCharater);
			dispatchEvent(new Event(Intro.PAGE_CLOSE));
		}
		
		private function cleanandclose():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			skipButton.removeEventListener(MouseEvent.MOUSE_OVER, sbRollover);
			skipButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, sboOut);
			skipButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, close);
			upStairButton.removeEventListener(MouseEvent.MOUSE_OVER, usbRollover);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_OUT, usboOut);
			upStairButtonOver.removeEventListener(MouseEvent.MOUSE_DOWN, goUpstair);
			diary.removeEventListener(MouseEvent.MOUSE_OVER, dRollover);
			diaryOver.removeEventListener(MouseEvent.MOUSE_OUT, doOut);
			diaryOver.removeEventListener(MouseEvent.MOUSE_DOWN, goD);
			removeChild(video);
			removeChild(video1);
			removeChild(video2);
			dispatchEvent(new Event(Intro.PAGE_CLOSE));
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
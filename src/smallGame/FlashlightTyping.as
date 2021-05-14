package smallGame
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	
	public class FlashlightTyping extends Sprite
	{
		public static const PAGE_CLOSE0:String = "pageClose0";
		public static const PAGE_CLOSE1:String = "pageClose1";
		public static const PAGE_CLOSE2:String = "pageClose2";
		public static const PAGE_CLOSE3:String = "pageClose3";
		
		private var gameBG:Loader;
		private var des:Loader;
		
		private var tTimer:Timer;
		private var dTimer:Timer;
		
		private var loader:Loader=new Loader();
		private var index:Number=0;//图片起始序号
		private var maxIndex:Number=3;//图片最终序号
		private var str:String="image/objects/number"+index.toString()+".png";//第一张数字图片的路径
		private var arr:Array=[];//装数字图片的数组
		private var numIndex:Number = 3;
		
		private var loaderA:Loader=new Loader();
		private var indexA:Number=0;//图片起始序号
		private var arrA:Array=[];//装箭头图片的数组
		private var maxIndexA:Number=5;//图片最终序号
		private var strA:String="image/objects/Arrow"+indexA.toString()+".png";//第一张数字图片的路径
		private var arrowIndex:Number = 3;
		
		private var showArrow:Array = [];
		private var indexS:Number=0;//图片起始序号
		private var maxIndexS:Number=5;//图片最终序号
		
		private var typeNumber:Number = 0;
		private var arrNum:Array = [0];
		
		public var totalTimes:int = 1;
		public var count:int = 1;
		public function FlashlightTyping()
		{
			super();
			init();
		}
		
		private function init():void{
			
			gameBG = new Loader();
			gameBG.load(new URLRequest("image/scene/rescueboat.jpg"));
			gameBG.contentLoaderInfo.addEventListener(Event.COMPLETE, setGBG);
			
			
			tTimer = new Timer(1000, 5);
			tTimer.addEventListener(TimerEvent.TIMER, changeNumber);
			tTimer.addEventListener(TimerEvent.TIMER_COMPLETE, gameStart);
			//tTimer.start();
			dTimer = new Timer(1000, 1);
			dTimer.addEventListener(TimerEvent.TIMER_COMPLETE, disappear);
			
			
		}
		
		protected function keypress(event:KeyboardEvent):void
		{
			// TODO Auto-generated method stub
			var input:Number;
			switch(event.keyCode){
				case Keyboard.UP:
					input = 0;
					break;
				case Keyboard.DOWN:
					input = 1;
					break;
				case Keyboard.LEFT:
					input = 2;
					break;
				case Keyboard.RIGHT:
					input = 3;
					break;
				default:
					break;
			}
			testInput(input, typeNumber);
			typeNumber++;
		}
		
		private function testInput(_in:Number, _count:Number):void{
			if(_in == arrNum[_count]){
				arrA[_count].visible = true;
				if(_count == maxIndexS){
					close();
				}
			}else{
				if(count == totalTimes){
					dispatchEvent(new Event(FlashlightTyping.PAGE_CLOSE3));
				}else{
					reStart();
				}
				count++;
			}
		}
		
		private function close():void{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			dispatchEvent(new Event(FlashlightTyping.PAGE_CLOSE0));
			
		}
		
		private function reStart():void{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keypress);
			for(var i:int; i<arrA.length; i++){
				arrA[i].visible = false;
			}
			
			index=0;//图片起始序号
			maxIndex=3;//图片最终序号
			str="image/objects/number"+index.toString()+".png";//第一张数字图片的路径
			arr=[];//装数字图片的数组
			numIndex = 3;
			
			indexA=0;//图片起始序号
			arrA=[];//装箭头图片的数组
			maxIndexA=5;//图片最终序号
			strA="image/objects/Arrow"+indexA.toString()+".png";//第一张数字图片的路径
			arrowIndex = 3;
			
			showArrow = [];
			indexS=0;//图片起始序号
			maxIndexS=5;//图片最终序号
			
			typeNumber = -1;
			arrNum = [0];
			
			tTimer = new Timer(1000, 5);
			tTimer.addEventListener(TimerEvent.TIMER, changeNumber);
			tTimer.addEventListener(TimerEvent.TIMER_COMPLETE, gameStart);
			//tTimer.start();
			dTimer = new Timer(1000, 1);
			dTimer.addEventListener(TimerEvent.TIMER_COMPLETE, disappear);
			
			repeadLoad();
			repeadLoad1();
		}
		
		private function repeadLoad():void
		{
			loader.load(new URLRequest(str));//加载
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, setNum);//监听加载完成事件
		}
		
		protected function setNum(event:Event):void
		{
			// TODO Auto-generated method stub
			arr.push(event.target.content);//先把加载进来的图片放进数组
			loader.unload();//再删除loader的加载项，以便loader可以重用
			addChild(arr[index]);//根据数组的索引显示图片
			arr[index].visible = false;
			arr[index].width = gameBG.width * 0.5;//统一设置图片的宽度为100
			arr[index].height = gameBG.height * 0.5;//图片的高度根据图片的宽度等比例调整，使图片不会变形
			arr[index].x=gameBG.width * 0.5 - arr[index].width * 0.5;
			arr[index].y=gameBG.height * 0.5 - arr[index].height * 0.5;
			index++;//序号递增
			str="image/objects/number"+index.toString()+".png";//更新加载路径
			if(index<=maxIndex){ //判断：只要序号不超过图片的最终序号
				repeadLoad();//回调函数（即再次调用函数，由于路径已更新，就会加载新的图片进来）
			}else{
				tTimer.start();
			}
		}
		
		private function repeadLoad1():void
		{
			loaderA.load(new URLRequest(strA));//加载
			loaderA.contentLoaderInfo.addEventListener(Event.COMPLETE, setArrow);//监听加载完成事件
		}
		
		protected function setArrow(event:Event):void
		{
			// TODO Auto-generated method stub
			// TODO Auto-generated method stub
			arrA.push(event.target.content);
			loaderA.unload();
			addChild(arrA[indexA]);
			arrA[indexA].visible = false;
			arrA[indexA].width = gameBG.width * 0.07;
			arrA[indexA].height = gameBG.height * 0.07;
			arrA[indexA].x=gameBG.width * 0.3 + gameBG.width * 0.07 * indexA;
			arrA[indexA].y=gameBG.height * 0.2;
			indexA++;
			var temp:Number = Math.floor(Math.random() * 3);
			arrNum.push(temp);
			strA="image/objects/Arrow"+temp.toString()+".png";
			if(indexA<=maxIndexA){ 
				repeadLoad1();
			}
		}
		
		
		protected function changeNumber(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			if(numIndex < 3){
				arr[numIndex + 1].visible = false;
			}
			if(numIndex >= 0){
				arr[numIndex].visible = true;
			}
			
			numIndex--;
		}
		
		protected function gameStart(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			tTimer.stop();
			tTimer.removeEventListener(TimerEvent.TIMER, changeNumber);
			tTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, gameStart);
			//arr[numIndex + 1].visible = false;
			numIndex = 3;
			
			for(var i:Number = 0; i < arrA.length; i++){
				arrA[i].visible = true;
			}
			dTimer.start();
			
		}
		
		protected function disappear(event:TimerEvent):void
		{
			// TODO Auto-generated method stub
			for(var i:Number = 0; i < arrA.length; i++){
				arrA[i].visible = false;
			}
			dTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, disappear);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypress);
		}
		
		
		private function setGBG(e:Event):void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
			addChild(gameBG);
			gameBG.contentLoaderInfo.removeEventListener(Event.COMPLETE, setGBG);
			
			des = new Loader();
			des.load(new URLRequest("image/description/flashlightGameDescription.png"));
			des.contentLoaderInfo.addEventListener(Event.COMPLETE, setDes);
			
			repeadLoad();
			repeadLoad1();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		protected function setDes(event:Event):void
		{
			// TODO Auto-generated method stub
			des.width = stage.stageWidth;
			des.height = stage.stageHeight;
			addChild(des);
			des.contentLoaderInfo.removeEventListener(Event.COMPLETE, setDes);
		}
		
		private function onEnterFrame(event:Event):void{
			reSize();
			
		}
		
		private function reSize():void{
			gameBG.width = stage.stageWidth;
			gameBG.height = stage.stageHeight;
		}
	}
}
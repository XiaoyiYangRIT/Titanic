package others
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	
	
	public class ItemSpot extends Sprite
	{
		public static const ItemClick:String = "itemClick";
		public static const ItemClick1:String = "itemClick1";
		public static const ItemClick2:String = "itemClick2";
		public static const ItemClick3:String = "itemClick3";
		public static const ItemClick4:String = "itemClick4";
		public static const ItemClick5:String = "itemClick5";
		
		public var backg:Loader;
		
		private var FrameX:Number;
		private var FrameY:Number;
		private var FrameW:Number;
		private var FrameH:Number;
		private var arr:Array/* = new Array(5)*/;
		
		public var obK:Loader;
		public var obR:Loader;
		public var obP:Loader;
		public var obC:Loader;
		public var obF:Loader;
		
		public function ItemSpot(_w:Number, _h:Number)
		{
			super();
			FrameW = _w;
			FrameH = _h;
			init();
			
			
		}
		
		private function init():void{
			backg = new Loader();
			backg.load(new URLRequest("image/objects/InventoryHolder.png"));
			backg.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		}
		
		protected function completeHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			backg.width = FrameW;
			backg.height = FrameH;
			//backg.alpha = 0.6;
			addChild(backg);
			
			initobjects();
		}
		
		private function initobjects():void{
			obK = new Loader();
			obK.load(new URLRequest("image/objects/A_Knife.png"));
			obK.contentLoaderInfo.addEventListener(Event.COMPLETE, setK);
			
			obR = new Loader();
			obR.load(new URLRequest("image/objects/rose_web.png"));
			obR.contentLoaderInfo.addEventListener(Event.COMPLETE, setR);
			
			obP = new Loader();
			obP.load(new URLRequest("image/objects/Pencil_web.png"));
			obP.contentLoaderInfo.addEventListener(Event.COMPLETE, setP);
			
			obC = new Loader();
			obC.load(new URLRequest("image/objects/A_PaperClip.png"));
			obC.contentLoaderInfo.addEventListener(Event.COMPLETE, setC);
			
			obF = new Loader();
			obF.load(new URLRequest("image/objects/B_FlashLight.png"));
			obF.contentLoaderInfo.addEventListener(Event.COMPLETE, setF);
		}
		
		protected function setK(event:Event):void
		{
			// TODO Auto-generated method stub
			//loadCK = true;
			obK.x = 0.05 * FrameW;
			obK.y = 0.2 * FrameH;
			obK.width = 0.14 * FrameW;
			obK.height = 0.6 * FrameH;
			obK.addEventListener(MouseEvent.MOUSE_OVER, handcursor);
			obK.addEventListener(MouseEvent.MOUSE_OUT, arrawcursor);
			obK.addEventListener(MouseEvent.CLICK, itemClick);
			obK.visible = false;
			addChild(obK);
		}
		
		protected function setR(event:Event):void
		{
			// TODO Auto-generated method stub
			//loadCR = true;
			obR.x = 0.05 * FrameW + 0.1 * FrameW * 1 + 0.085 * FrameW * 1;
			obR.y = 0.2 * FrameH;
			obR.width = 0.14 * FrameW;
			obR.height = 0.6 * FrameH;
			obR.addEventListener(MouseEvent.MOUSE_OVER, handcursor);
			obR.addEventListener(MouseEvent.MOUSE_OUT, arrawcursor);
			obR.addEventListener(MouseEvent.CLICK, itemClick);
			obR.visible = false;
			addChild(obR);
		}
		
		protected function setP(event:Event):void
		{
			// TODO Auto-generated method stub
			//loadCP = true;
			obP.x = 0.05 * FrameW + 0.1 * FrameW * 2 + 0.085 * FrameW * 2;
			obP.y = 0.2 * FrameH;
			obP.width = 0.14 * FrameW;
			obP.height = 0.6 * FrameH;
			obP.addEventListener(MouseEvent.MOUSE_OVER, handcursor);
			obP.addEventListener(MouseEvent.MOUSE_OUT, arrawcursor);
			obP.addEventListener(MouseEvent.CLICK, itemClick);
			obP.visible = false;
			addChild(obP);
		}
		
		protected function setC(event:Event):void
		{
			// TODO Auto-generated method stub
			//loadCC = true;
			obC.x = 0.05 * FrameW + 0.1 * FrameW * 3 + 0.085 * FrameW * 3;
			obC.y = 0.2 * FrameH;
			obC.width = 0.14 * FrameW;
			obC.height = 0.6 * FrameH;
			obC.addEventListener(MouseEvent.MOUSE_OVER, handcursor);
			obC.addEventListener(MouseEvent.MOUSE_OUT, arrawcursor);
			obC.addEventListener(MouseEvent.CLICK, itemClick);
			obC.visible = false;
			addChild(obC);
		}
		
		protected function setF(event:Event):void
		{
			// TODO Auto-generated method stub
			//loadCF = true;
			obF.x = 0.05 * FrameW + 0.1 * FrameW * 4 + 0.085 * FrameW * 4;
			obF.y = 0.2 * FrameH;
			obF.width = 0.14 * FrameW;
			obF.height = 0.6 * FrameH;
			obF.addEventListener(MouseEvent.MOUSE_OVER, handcursor);
			obF.addEventListener(MouseEvent.MOUSE_OUT, arrawcursor);
			obF.addEventListener(MouseEvent.CLICK, itemClick);
			obF.visible = false;
			addChild(obF);
		}	
		
		protected function itemClick(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			//dispatchEvent(new Event(ItemSpot.ItemClick));
			switch(event.target){
				case obK:
					dispatchEvent(new Event(ItemSpot.ItemClick1));
					break;
				case obR:
					dispatchEvent(new Event(ItemSpot.ItemClick2));
					break;
				case obP:
					dispatchEvent(new Event(ItemSpot.ItemClick3));
					break;
				case obC:
					dispatchEvent(new Event(ItemSpot.ItemClick4));
					break;
				case obF:
					dispatchEvent(new Event(ItemSpot.ItemClick5));
					break;
				default:
					trace("没点到东西！！");
					break;
			}
		}
		
		protected function handcursor(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "button";
		}
		
		protected function arrawcursor(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			Mouse.cursor = "arrow";
		}
		
		public function isEmpty():Boolean{
			if(!obK.visible && !obR.visible && !obP.visible && !obC.visible && !obF.visible){
				return true;
			}else{
				return false;
			}
		}
		/*public function showImg():void{
			for(var i:int = 0; i < arr.length; i++){
				arr[i].w
			}
		}*/
		
	}
}
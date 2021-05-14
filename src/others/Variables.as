package others
{
	public class Variables
	{
		private var _dialogSelect:int;
		private var _isSelect:Boolean;
		
		private var _knowRebacca:Boolean = false;
		private var _knowParker:Boolean = false;
		private var _likedRebacca:Boolean = false;
		private var _findRebacca:Boolean = false;
		//private var _getPaperClip:Boolean = false;
		//private var _getSwissKnife:Boolean = false;
		//private var _getFlashLight:Boolean = false;
		private var _fromBtoC:int = 0;
		
		private var _useKnife:Boolean = false;
		private var _stopLowing:Boolean = false;
		private var _haveLiquor:int;
		private var _diswim:int;
		
		public function get diswim():int
		{
			return _diswim;
		}

		public function set diswim(value:int):void
		{
			_diswim = value;
		}

		public function get haveLiquor():int
		{
			return _haveLiquor;
		}

		public function set haveLiquor(value:int):void
		{
			_haveLiquor = value;
		}

		public function get stopLowing():Boolean
		{
			return _stopLowing;
		}

		public function set stopLowing(value:Boolean):void
		{
			_stopLowing = value;
		}

		public function get useKnife():Boolean
		{
			return _useKnife;
		}

		public function set useKnife(value:Boolean):void
		{
			_useKnife = value;
		}

		public function get fromBtoC():int
		{
			return _fromBtoC;
		}

		public function set fromBtoC(value:int):void
		{
			_fromBtoC = value;
		}

		public function get findRebacca():Boolean
		{
			return _findRebacca;
		}

		public function set findRebacca(value:Boolean):void
		{
			_findRebacca = value;
		}

		public function get likedRebacca():Boolean
		{
			return _likedRebacca;
		}

		public function set likedRebacca(value:Boolean):void
		{
			_likedRebacca = value;
		}
		
		public function get knowParker():Boolean
		{
			return _knowParker;
		}
		
		public function set knowParker(value:Boolean):void
		{
			_knowParker = value;
		}
		
		public function get dialogSelect():int
		{
			return _dialogSelect;
		}

		public function set dialogSelect(value:int):void
		{
			_dialogSelect = value;
		}

		public function get knowRebacca():Boolean
		{
			return _knowRebacca;
		}

		public function set knowRebacca(value:Boolean):void
		{
			_knowRebacca = value;
		}

		public function get isSelect():Boolean
		{
			return _isSelect;
		}

		public function set isSelect(value:Boolean):void
		{
			_isSelect = value;
		}
		
		public function Variables()
		{
			//clear();
		}

		public function clear():void{
			dialogSelect(0);
			isSelect(false);
			knowRebacca(false);
			knowParker(false);
			likedRebacca(false);
			//getPaperClip(false);
			//getSwissKnife(false);
			findRebacca(false);
			//getFlashLight(false);
			fromBtoC(0);
			
			useKnife(false);
			stopLowing(false);
			haveLiquor(0);
			diswim(0);
		}
	}
}
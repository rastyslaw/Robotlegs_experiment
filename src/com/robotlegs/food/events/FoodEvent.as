package com.robotlegs.food.events {
	
	import flash.events.Event;
	/**
	 * ...
	 * @author waltassar
	 */
	public class FoodEvent extends Event {
		
		public static const SELECT_DROP_DOWN:String = 'selectDropDown';
		public static const SELECT_SEARCH:String    = 'selectSearch'; 
		public static const SELECT_LIST:String      = 'selectList';
		public static const ADD:String 				= 'add'; 
		public static const TAB_CHANGE:String 		= 'tabChange'; 
		public static const DELETE:String 			= 'delete';   
		public static const PRINT:String 			= 'print';   
		public static const PIROG:String			= 'pirog'; 
		 
		public var num:int;  
		public var search:String; 
		
		public function FoodEvent(type:String, id:int, s:String=null, bubbles:Boolean=false, cancelable:Boolean = false) {
			this.num = id;
			this.search = s;  
			super(type, bubbles, cancelable);   
		} 
		
		override public function clone():Event {
			return new FoodEvent(type, num, search, bubbles, cancelable);    
		}
//-----		
	}
}
package com.robotlegs.food.events {
	import flash.events.Event;
	
	public class WindowEvent extends Event {
		
		public static const DATA_CHANGE:String = "data_change";
		public var tar:String;
		
		public function WindowEvent(type:String, bubbles:Boolean=false, 
									 cancelable:Boolean = false) {
			super(type, bubbles, cancelable); 
		}
		
	}

}
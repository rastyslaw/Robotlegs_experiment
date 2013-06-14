package com.robotlegs.food.events {
	
	import flash.events.Event;
	/**
	 * ...
	 * @author waltassar
	 */
	public class CorrectEvent extends Event {
		
		public static const CHANGED:String = 'changed'; 
		
		public var obj:int;  
		public var ident:int;
		
		public function CorrectEvent(type:String, obi:int, id:int, bubbles:Boolean=false, cancelable:Boolean = false) {
			this.obj = obi; 
			this.ident = id;
			super(type, bubbles, cancelable);   
		} 
		 
		override public function clone():Event {
			return new CorrectEvent(type, obj, ident,  bubbles, cancelable);    
		}
//-----		
	}
}
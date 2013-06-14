package com.robotlegs.food.model.events {
	 
	import flash.events.Event;
	
	public class FoodModelEvent extends Event {
		 
		public static const CHANGE:String = 'change';  
		
		public function FoodModelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);  
		}
		
		override public function clone():Event
		{
			return new FoodModelEvent(type, bubbles, cancelable); 
		}
	
	}
}
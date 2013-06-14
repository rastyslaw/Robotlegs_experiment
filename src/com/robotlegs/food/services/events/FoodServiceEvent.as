package com.robotlegs.food.services.events {
	 
	import flash.events.Event;
	
	public class FoodServiceEvent extends Event {
		 
		public static const LOAD:String = 'load'; 
		public static const LOADED:String = 'loaded';
		public static const LIST:String = 'list'; 
		public static const DATA:String = 'data'; 
		
		public function FoodServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);  
		}
		
		override public function clone():Event
		{
			return new FoodServiceEvent(type, bubbles, cancelable); 
		}
	
	}
}
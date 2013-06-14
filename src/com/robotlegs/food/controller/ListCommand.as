package com.robotlegs.food.controller { 
	
	import com.robotlegs.food.events.FoodEvent;  
	import com.robotlegs.food.services.*;  
	 
	import org.robotlegs.mvcs.Command; 
	/**
	 * ...
	 * @author waltassar 
	 */
	public class ListCommand extends Command {  
		
		[Inject] 
		public var event:FoodEvent; 
			
		[Inject] 
		public var service:IFoodService;   
		 
		override public function execute():void {
			service.getData(event.search);       
		}
//----- 		
	}
}
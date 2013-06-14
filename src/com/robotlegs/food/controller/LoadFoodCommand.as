package com.robotlegs.food.controller {
	
	import com.robotlegs.food.services.events.*;
	import com.robotlegs.food.services.*;
	
	import org.robotlegs.mvcs.Command; 
	/**
	 * ...
	 * @author waltassar 
	 */
	public class LoadFoodCommand extends Command {
		
		[Inject]
		public var event:FoodServiceEvent;
			
		[Inject]
		public var service:IFoodService;   
		 
		override public function execute():void { 
			service.getCategories(); 
		}
	}

}
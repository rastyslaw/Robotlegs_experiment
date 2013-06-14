package com.robotlegs.food.controller { 
	
	import com.robotlegs.food.events.FoodEvent;  
	import com.robotlegs.food.model.*;  
	 
	import org.robotlegs.mvcs.Command; 
	/**
	 * ...
	 * @author waltassar 
	 */
	public class DeleteCommand extends Command {  
		
		[Inject]   
		public var event:FoodEvent; 
			
		[Inject] 
		public var model:FoodModel; 
		 
		override public function execute():void {
			model.deteleFromGrid(event.num);         
		}
//----- 		
	}
}
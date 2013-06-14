package com.robotlegs.food.controller { 
	
	import com.robotlegs.food.events.CorrectEvent;  
	import com.robotlegs.food.model.*;  
	  
	import org.robotlegs.mvcs.Command; 
	/**
	 * ...
	 * @author waltassar 
	 */
	public class CorrectCommand extends Command {  
		
		[Inject]   
		public var event:CorrectEvent; 
			
		[Inject] 
		public var model:FoodModel; 
		 
		override public function execute():void {
			model.changedGrid(event.obj, event.ident);          
		}
//----- 		
	}
}
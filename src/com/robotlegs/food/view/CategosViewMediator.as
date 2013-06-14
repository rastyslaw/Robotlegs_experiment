package com.robotlegs.food.view {
	
	import com.robotlegs.food.events.*;
	import com.robotlegs.food.services.events.*;
	import com.robotlegs.food.model.*;
	
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author waltassar
	 */
	public class CategosViewMediator extends Mediator {
		 [Inject]
		 public var view:CategosView;
		  
		 [Inject] 
		 public var model:FoodModel; 
		 
		 override public function onRegister():void { 
			 eventMap.mapListener(eventDispatcher, FoodServiceEvent.LOADED, categoriesLoaded);
			    
			 eventMap.mapListener(view, FoodEvent.SELECT_DROP_DOWN, dispatch); 
			 eventMap.mapListener(view, FoodEvent.SELECT_SEARCH, dispatch);
			 eventMap.mapListener(view, FoodEvent.PRINT, dispatch);   
			 
			 dispatch(new FoodServiceEvent(FoodServiceEvent.LOAD)); 
		 }
		 
		 protected function categoriesLoaded(event:FoodServiceEvent):void {
			 view.dataProvider = model.categories;   
		 }
//-----		
	}
}
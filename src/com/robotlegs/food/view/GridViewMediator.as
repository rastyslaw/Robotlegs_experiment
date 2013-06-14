package com.robotlegs.food.view {
	
	import com.robotlegs.food.events.*;
	import com.robotlegs.food.model.*; 
	import com.robotlegs.food.model.events.*;
	import com.robotlegs.food.services.events.*; 
	
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author waltassar
	 */
	public class GridViewMediator extends Mediator { 
		 [Inject]
		 public var view:GridView;  
		 
		 [Inject] 
		 public var model:FoodModel; 
		 
		 override public function onRegister():void {
			eventMap.mapListener(eventDispatcher, FoodModelEvent.CHANGE, gridChanged);
			eventMap.mapListener(eventDispatcher, FoodEvent.PRINT, getprintdata);
			 
			eventMap.mapListener(view, FoodEvent.TAB_CHANGE, dispatch);
			eventMap.mapListener(view, FoodEvent.DELETE, dispatch); 
			eventMap.mapListener(view, CorrectEvent.CHANGED, dispatch); 
		 }

		protected function gridChanged(event:FoodModelEvent):void {
			view.dataProvider = model.curcollect; 
		}
		
		 protected function getprintdata(event:FoodEvent):void {
			view.printData = model.getDataForPrint();
			view.goprint();  
		 }
//-----		
	}
}
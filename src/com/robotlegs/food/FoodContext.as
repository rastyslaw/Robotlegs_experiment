package com.robotlegs.food {
	
	import com.robotlegs.food.controller.*;
	import com.robotlegs.food.events.*;
	import com.robotlegs.food.view.*;
	import com.robotlegs.food.services.events.*;
	import com.robotlegs.food.model.*; 
	import com.robotlegs.food.services.*;
	
	import org.robotlegs.mvcs.Context;
	/**
	 * ...
	 * @author waltassar
	 */
	public class FoodContext extends Context {
		
		override public function startup():void {
			injector.mapSingleton(FoodModel);
			injector.mapSingletonOf(IFoodService, FoodService); 
			
			mediatorMap.mapView(CategosView, CategosViewMediator);
			mediatorMap.mapView(ListView, ListViewMediator); 
			mediatorMap.mapView(GridView, GridViewMediator);
			mediatorMap.mapView(AlldayView, AlldayViewMediator);   
			 
			commandMap.mapEvent(FoodServiceEvent.LOAD, LoadFoodCommand, FoodServiceEvent);
			commandMap.mapEvent(FoodEvent.SELECT_DROP_DOWN, DropCommand);
			commandMap.mapEvent(FoodEvent.SELECT_SEARCH, SearchCommand);
			commandMap.mapEvent(FoodEvent.SELECT_LIST, ListCommand);
			commandMap.mapEvent(FoodEvent.ADD, AddComand); 
			commandMap.mapEvent(FoodEvent.TAB_CHANGE, TabCommand); 
			commandMap.mapEvent(FoodEvent.DELETE, DeleteCommand); 
			commandMap.mapEvent(CorrectEvent.CHANGED, CorrectCommand); 
		}
//-----		
	}
}
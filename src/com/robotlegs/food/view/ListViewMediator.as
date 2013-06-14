package com.robotlegs.food.view {
	
	import com.robotlegs.food.events.*;
	import com.robotlegs.food.services.events.*;
	import com.robotlegs.food.model.*;
	import com.robotlegs.food.model.vo.*;
	import com.robotlegs.food.model.events.*;
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author waltassar
	 */
	public class ListViewMediator extends Mediator { 
		 [Inject]
		 public var view:ListView; 
		 
		 [Inject] 
		 public var model:FoodModel;
		 
		 override public function onRegister():void {
			eventMap.mapListener(eventDispatcher, FoodServiceEvent.LIST, listLoaded);
			eventMap.mapListener(eventDispatcher, FoodServiceEvent.DATA, dataLoaded); 
			
			eventMap.mapListener(view, FoodEvent.SELECT_LIST, dispatch);
			eventMap.mapListener(view, FoodEvent.ADD, dispatch);  
		 }
		  
		protected function listLoaded(event:FoodServiceEvent):void {
			 view.listCollect = model.list; 
			 view.sortGrid.dataProvider = null; 
		} 
		 
		protected function dataLoaded(event:FoodServiceEvent):void {
			 var mas:ArrayCollection = new ArrayCollection([model.data as VOData]);
			 view.sortGrid.dataProvider = mas;  
		}
//-----		
	}
}
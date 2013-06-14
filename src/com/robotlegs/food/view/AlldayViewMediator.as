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
	public class AlldayViewMediator extends Mediator { 
		 [Inject] 
		 public var view:AlldayView;   
		 
		 [Inject]  
		 public var model:FoodModel;  
		 
		override public function onRegister():void { 
			eventMap.mapListener(eventDispatcher, FoodModelEvent.CHANGE, gridChanged);
			
			eventMap.mapListener(view, FoodEvent.DELETE, dispatch);
			eventMap.mapListener(view, FoodEvent.PIROG, getpirogdata);   
		}
		   
		protected function gridChanged(event:FoodModelEvent):void {
			view.dataProvider = model.getSummedResult();
			view.dataProvider2 = model.getTotalSummed();
		}
		
		protected function getpirogdata(event:FoodEvent):void { 
			view.pwindow.mas = model.getPirog(event.search);   
		}
//-----		
	}
}
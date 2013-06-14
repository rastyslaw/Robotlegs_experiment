package com.robotlegs.food.services {
	
	import com.robotlegs.food.model.FoodModel;
	import com.robotlegs.food.model.vo.*; 
	import com.robotlegs.food.services.events.FoodServiceEvent;
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import org.robotlegs.mvcs.Actor;
	import mx.rpc.remoting.RemoteObject;
	import mx.controls.Alert;
	import mx.rpc.remoting.RemoteObject; 
	/**  
	 * ... 
	 * @author waltassar
	 */
	public class FoodService extends Actor implements IFoodService { 
		
		[Inject]
		public var model:FoodModel;
		
		private var delegate:LibraryDelegate;
		private var service:RemoteObject;
		
		public function getCategories():void {
			delegate = LibraryDelegate.getInstance(); 
			service = delegate.serv; 
			var call:* = service.getCategories(); 
			service.addEventListener("result", result);    
			service.addEventListener("fault", fault);  
		}  
		
		public function getList(id:int):void {
			delegate = LibraryDelegate.getInstance();
			service = delegate.serv; 
			var call:* = service.getList(id);    
			service.addEventListener("result", result_drop);    
			service.addEventListener("fault", fault);  
		}
		
		public function getFood(id:String):void {
			delegate = LibraryDelegate.getInstance();
			service = delegate.serv; 
			var call:* = service.getFood(id);      
			service.addEventListener("result", result_drop);     
			service.addEventListener("fault", fault);  
		}
		
		public function getData(id:String):void {
			delegate = LibraryDelegate.getInstance(); 
			service = delegate.serv; 
			var call:* = service.getData(id);        
			service.addEventListener("result", result_list);     
			service.addEventListener("fault", fault);  
		}
	    	  
		private function result_list(event:ResultEvent):void {
			service.removeEventListener("result", result_list); 
			model.data = event.result as VOData;
			dispatch(new FoodServiceEvent(FoodServiceEvent.DATA));
		}
		
		private function result(event:ResultEvent):void { 
			service.removeEventListener("result", result); 
			model.categories = event.result as ArrayCollection;
			dispatch(new FoodServiceEvent(FoodServiceEvent.LOADED));
		}
		
		private function result_drop(event:ResultEvent):void {
			service.removeEventListener("result", result_drop); 
			model.list = event.result as ArrayCollection;  
			dispatch(new FoodServiceEvent(FoodServiceEvent.LIST)); 
		}
		
		private function fault(event:FaultEvent):void {
			Alert.show(event.fault.message, "Error"); 
		}
//-----		
	}
}
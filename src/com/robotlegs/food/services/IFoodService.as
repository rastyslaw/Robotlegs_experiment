package com.robotlegs.food.services {
	
	import mx.rpc.remoting.RemoteObject; 
	/**
	 * ...
	 * @author waltassar
	 */ 
	public interface IFoodService { 
		function getData(id:String):void; 
		function getCategories():void;  
		function getList(id:int):void; 
		function getFood(id:String):void;  
	}
} 
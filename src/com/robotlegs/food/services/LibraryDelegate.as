package com.robotlegs.food.services {
	
	import mx.rpc.remoting.RemoteObject;
	
	public class LibraryDelegate {
		
		private var service:RemoteObject;
		private static var instance:LibraryDelegate; 
		 
		public function LibraryDelegate() {
			
			service = new RemoteObject();
	    	service.endpoint="http://testerok.xe0.ru/ZendAMF/"; 
	    	service.destination="zend";
	    	service.makeObjectsBindable=true; 
	    	service.showBusyCursor=true;  
	    	service.source = "Comments";  
		} 
		
		public function get serv():RemoteObject { 
			return service; 
		}
		
		public static function getInstance():LibraryDelegate { 
			if (instance == null) {
				LibraryDelegate.instance = new LibraryDelegate(); 
			}
			return LibraryDelegate.instance;
		}
//-----
	}
}
package com.robotlegs.food.model {
	
	import com.robotlegs.food.model.vo.VOData;
	import com.robotlegs.food.model.events.*; 
	import mx.collections.ArrayCollection;
	import org.robotlegs.mvcs.Actor; 
	
	/**
	 * ...
	 * @author waltassar 
	 */
	public class FoodModel extends Actor {
		
		private var _categories:ArrayCollection;
		private var _list:ArrayCollection;
		
		private var breakfast:ArrayCollection = new ArrayCollection();
		private var lunch:ArrayCollection = new ArrayCollection();
		private var dinner:ArrayCollection = new ArrayCollection();
		private var _curcollect:ArrayCollection = breakfast; 
		
		private var _data:VOData;
		private var _curTab:int;  
		private var zou:String = "завтрак";
		
		public function curTab(value:int):void {
			_curTab = value; 
			switch(_curTab) {  
				case 0: 
					_curcollect = breakfast;
					zou = "завтрак";
				break;  
				case 1: 
					_curcollect = lunch;
					zou = "обед";
				break;  
				case 2:  
					_curcollect = dinner;
					zou = "ужин";
				break;
			}
			dispatch(new FoodModelEvent(FoodModelEvent.CHANGE));  
		}
 
		public function get curcollect():ArrayCollection {
			return _curcollect;
		} 
		 
		public function set curcollect(value:ArrayCollection):void {
			_curcollect = value;  
		}
		
		public function get data():VOData {
			return _data; 
		}
		 
		public function set data(value:VOData):void {
			_data = value;  
		}
		 
		public function get categories():ArrayCollection {
			return _categories; 
		}
		
		public function set categories(value:ArrayCollection):void {
			_categories = value;  
		} 
		
		public function get list():ArrayCollection {
			return _list; 
		}
		 
		public function set list(value:ArrayCollection):void {
			_list = value;  
		}
		 
		public function addToGrid(value:String):void {
			var bol:Boolean;
			label: for each (var s:* in _curcollect) {   
				if (s.name == value) {
					bol = true; 
					break label;
				} 
			} 
			if (!bol) {
				var obj:Object = { name:value, calories:_data.calories, protein:_data.protein, fat:_data.fat, carbs:_data.carbs};
				obj.size = 100; 
				_curcollect.addItemAt(obj, _curcollect.length);
				dispatch(new FoodModelEvent(FoodModelEvent.CHANGE));    
			}
		}
		
		public function changedGrid(i:int, newvalue:int):void {
			  var obg:Object = _curcollect[i]; 
			  var cof:Number = newvalue / obg.size; 
				 if (cof != 1) {   
					obg.size = newvalue;
					obg.calories = int(obg.calories * cof);
					obg.protein = roundToDecimal(obg.protein * cof,10);
					obg.fat = roundToDecimal(obg.fat * cof,10);
					obg.carbs = roundToDecimal(obg.carbs * cof,10); 
				} 
			_curcollect.refresh();
			dispatch(new FoodModelEvent(FoodModelEvent.CHANGE));  
		} 
		
		private static function roundToDecimal(base:Number, decimalPlace:int):Number{
				return Math.round(base * decimalPlace)/decimalPlace;
		}
		
		public function deteleFromGrid(value:int):void {
			if (value >= 0) _curcollect.removeItemAt(value);
				else _curcollect.removeAll();   
			dispatch(new FoodModelEvent(FoodModelEvent.CHANGE));  
		}
		
		public function getSummedResult(s:String = null):ArrayCollection { 
			var mas:ArrayCollection; 
			if (s == null) mas = _curcollect;
			else if (s == "Весь день") return getTotalSummed(); 
			else {
				switch(s) { 
					case "Завтрак": 
						mas = breakfast;
					break;
					case "Обед":
						mas = lunch;  
					break;
					case "Ужин": 
						mas = dinner;
					break;
				}
			}
			var summedResult:Object = new Object();
			summedResult.name = "всего за " + zou;     
			summedResult.size = 0;
			summedResult.calories = 0;
			summedResult.protein = 0;
			summedResult.fat = 0;   
			summedResult.carbs = 0;
  
			for each (var data:Object in mas) {  
				summedResult.size += int(data.size); 
				summedResult.calories += int(data.calories);
				summedResult.protein = roundToDecimal(summedResult.protein + Number(data.protein), 10); 
				summedResult.fat = roundToDecimal(summedResult.fat+Number(data.fat),10);  
				summedResult.carbs = roundToDecimal(summedResult.carbs+Number(data.carbs),10); 
			}
			return new ArrayCollection([summedResult]);
		}
		
		public function getPirog(s:String):ArrayCollection {
			var mas:ArrayCollection = getSummedResult(s);
			var mas2:ArrayCollection;
			if (s == "Весь день") { 
				mas2 = new ArrayCollection( [
					{name:"Protein", col:mas[0].protein },
					{name:"Fat", col:mas[0].fat }, 
					{name:"Carbs", col:mas[0].carbs}  
				]);
			}
			else {
				mas2 = new ArrayCollection([ 
					   {name:"Protein", col:mas[0].protein }, 
					   {name:"Fat", col:mas[0].fat }, 
					   {name:"Carbs", col:mas[0].carbs}   
				]);   
			}
			return mas2; 
		}
		
		public function getTotalSummed():ArrayCollection { 
			var summedResult:Object = new Object(); 
			summedResult.name = "всего за день";  
			summedResult.size = 0;
			summedResult.calories = 0;
			summedResult.protein = 0;
			summedResult.fat = 0;  
			summedResult.carbs = 0;
			
			for each (var data1:Object in breakfast) {
				summedResult.size += int(data1.size); 
				summedResult.calories += int(data1.calories);
				summedResult.protein = roundToDecimal(summedResult.protein + Number(data1.protein), 10); 
				summedResult.fat = roundToDecimal(summedResult.fat+Number(data1.fat),10);  
				summedResult.carbs = roundToDecimal(summedResult.carbs+Number(data1.carbs),10); 
			}
			for each (var data2:Object in lunch) {
				summedResult.size += int(data2.size); 
				summedResult.calories += int(data2.calories);
				summedResult.protein = roundToDecimal(summedResult.protein + Number(data2.protein), 10); 
				summedResult.fat = roundToDecimal(summedResult.fat+Number(data2.fat),10);  
				summedResult.carbs = roundToDecimal(summedResult.carbs+Number(data2.carbs),10); 
			}
			for each (var data3:Object in dinner) {  
				summedResult.size += int(data3.size); 
				summedResult.calories += int(data3.calories);
				summedResult.protein = roundToDecimal(summedResult.protein + Number(data3.protein), 10); 
				summedResult.fat = roundToDecimal(summedResult.fat+Number(data3.fat),10);   
				summedResult.carbs = roundToDecimal(summedResult.carbs+Number(data3.carbs),10); 
			}
			return new ArrayCollection([summedResult]); 
		}
		
		public function getDataForPrint():ArrayCollection { 
			var summedResult:Object = new Object(); 
			var mas:ArrayCollection = new ArrayCollection();
			var obj:Object;
			mas.addItem({name:"Завтрак"}); 
			for (obj in breakfast) {
				mas.addItem(breakfast[obj]);
			}
			mas.addItem({name:"Обед"});
			for (obj in lunch) {
				mas.addItem(lunch[obj]); 
			}
			mas.addItem({name:"Ужин"});  
			for (obj in dinner) {
				mas.addItem(dinner[obj]);
			}
			return mas;
		}
//-----		
	}
}
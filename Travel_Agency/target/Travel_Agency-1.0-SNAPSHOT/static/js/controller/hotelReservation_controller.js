'use strict';

app.factory('HotelReservation', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/myTravel/hotels/hotelReservation/:hotelId', {hotelId: '@hotelId'},
	{
		updateHotel: {method: 'PUT'}
	}
    );
}]);


app.controller('AddHotelController', ['$scope', 'HotelReservation', function($scope, HotelReservation) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new HotelReservation(); 
    ob.fetchAllHotel = function(){
        ob.objArray = HotelReservation.query();
    };
    ob.fetchAllHotel();
    ob.addHotel = function(){
	console.log('Inside save');
	if($scope.objForm.$valid) {
	  ob.obj.$save(function(object){
	     console.log(object); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllHotel();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
    ob.editHotel = function(id){
	    console.log('Inside edit');
        ob.obj = HotelReservation.get({ hotelId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };    
    ob.updateHotelDetail = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updateHotel(function(object){
    		console.log(object); 
		ob.updatedId = object.hotelId;
		ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllHotel();
           });
	}
    };	
    ob.deleteHotel = function(id){
	    console.log('Inside delete');
	    ob.obj = HotelReservation.delete({ hotelId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllHotel(); 
	    });
    };		
    ob.reset = function(){
    	ob.obj = new TspInfo();
        $scope.objForm.$setPristine();
    };	
    ob.cancelUpdate = function(id){
	    ob.obj = new HotelReservation();
	    ob.flag= '';	
   	    ob.fetchAllHotel();
    };    
}]); 



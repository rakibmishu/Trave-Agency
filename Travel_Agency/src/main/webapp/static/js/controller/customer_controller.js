'use strict';

app.factory('CustomerRegistration', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/myTravel/customers/customerRegistration/:custId', {custId: '@custId'},
	{
		updateCustomer: {method: 'PUT'}
	}
    );
}]);
app.controller('AddCustomerController', ['$scope', 'CustomerRegistration', function($scope, CustomerRegistration) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new CustomerRegistration(); 
    //getAllAdmin
    ob.fetchAllCustomer = function(){
        ob.objArray = CustomerRegistration.query();
    };
    ob.fetchAllCustomer();
    
    //add admin
    ob.addCustomer = function(){
	console.log('Inside save');
	if($scope.objForm.$valid) {
	  ob.obj.$save(function(object){
	     console.log(object); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllCustomer();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
    
    //edit Acustomer
    ob.editCustomer = function(id){
	    console.log('Inside edit');
        ob.obj = CustomerRegistration.get({ custId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };  
    
    //Update Admin
    ob.updateCustomerDetail = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updateCustomer(function(object){
    		console.log(object); 
		ob.updatedId = object.custId;
		ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllCustomer();
           });
	}
    };
    //Delete Admin
    ob.deleteCustomer = function(id){
	    console.log('Inside delete');
	    ob.obj = CustomerRegistration.delete({ custId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllCustomer(); 
	    });
    };	
    //Reset All
    ob.reset = function(){
    	ob.obj = new CustomerRegistration();
        $scope.objForm.$setPristine();
    };
    //Cancel Update
    ob.cancelUpdate = function(id){
	    ob.obj = new CustomerRegistration();
	    ob.flag= '';	
   	    ob.fetchAllCustomer();
    };    
}]); 



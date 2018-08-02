'use strict';

app.factory('AdminRegistration', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/myTravel/admins/adminRegistration/:adminId', {adminId: '@adminId'},
	{
		updateAdmin: {method: 'PUT'}
	}
    );
}]);
app.controller('AddAdminController', ['$scope', 'AdminRegistration', function($scope, AdminRegistration) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new AdminRegistration(); 
    //getAllAdmin
    ob.fetchAllAdmin = function(){
        ob.objArray = AdminRegistration.query();
    };
    ob.fetchAllAdmin();
    
    //add admin
    ob.addAdmin = function(){
	console.log('Inside save');
	if($scope.objForm.$valid) {
	  ob.obj.$save(function(object){
	     console.log(object); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllAdmin();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
    
    //edit Admin
    ob.editAdmin = function(id){
	    console.log('Inside edit');
        ob.obj = AdminRegistration.get({ adminId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };  
    
    //Update Admin
    ob.updateAdminDetail = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updateAdmin(function(object){
    		console.log(object); 
		ob.updatedId = object.adminId;
		ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllAdmin();
           });
	}
    };
    //Delete Admin
    ob.deleteAdmin = function(id){
	    console.log('Inside delete');
	    ob.obj = AdminRegistration.delete({ adminId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllAdmin(); 
	    });
    };	
    //Reset All
    ob.reset = function(){
    	ob.obj = new AdminRegistration();
        $scope.objForm.$setPristine();
    };
    //Cancel Update
    ob.cancelUpdate = function(id){
	    ob.obj = new AdminRegistration();
	    ob.flag= '';	
   	    ob.fetchAllAdmin();
    };    
}]); 



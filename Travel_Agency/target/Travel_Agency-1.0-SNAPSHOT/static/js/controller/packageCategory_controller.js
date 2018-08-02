'use strict';

app.factory('PackageCategory', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/myTravel/packages/packageCategory/:packCatId', {packCatId: '@packCatId'},
	{
		updatePackageCategory: {method: 'PUT'}
	}
    );
}]);


app.controller('AddPackageCategoryController', ['$scope', 'PackageCategory', function($scope, PackageCategory) {
    var ob = this;
    ob.objArray=[];
    ob.obj = new PackageCategory(); 
    ob.fetchAllPackageCategory = function(){
        ob.objArray = PackageCategory.query();
    };
    ob.fetchAllPackageCategory();
    ob.addPackage = function(){
	console.log('Inside save');
	if($scope.objForm.$valid) {
	  ob.obj.$save(function(object){
	     console.log(object); 
	     ob.flag= 'created';	
	     ob.reset();	
	     ob.fetchAllPackageCategory();
	  },
	  function(err){
	     console.log(err.status);
	     ob.flag='failed';
	  }
          );
        }
    }; 
    ob.editPackage = function(id){
	    console.log('Inside edit');
        ob.obj = PackageCategory.get({ packCatId: id}, function() {
	       ob.flag = 'edit'; 
	    });
    };    
    ob.updatePackageCategory = function(){
	console.log('Inside update');
	if($scope.objForm.$valid) {
    	   ob.obj.$updatePackageCategory(function(object){
    		console.log(object); 
		ob.updatedId = object.packCatId;
	        ob.reset();
		ob.flag = 'updated'; 
    		ob.fetchAllPackageCategory();
           });
	}
    };	
    ob.deletePackageCategory = function(id){
	    console.log('Inside delete');
	    ob.obj = PackageCategory.delete({ packCatId: id}, function() {
		ob.reset();  
		ob.flag = 'deleted';
    		ob.fetchAllPackageCategory(); 
	    });
    };		
    ob.reset = function(){
    	ob.obj = new PackageCategory();
        $scope.objForm.$setPristine();
    };	
    ob.cancelUpdate = function(id){
	    ob.obj = new PackageCategory();
	    ob.flag= '';	
   	    ob.fetchAllPackageCategory();
    };    
}]); 



'use strict';

app.factory('PackageCategory', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/packages/packageCategory/:packCatId', {packCatId: '@packCatId'},
        {
            updatePackage: {method: 'PUT'}
        }
        );
    }]);
app.factory('PackageSubCategory', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/subPackages/packageSubCategory/:packSubCatId', {packSubCatId: '@packSubCatId'},
        {
            updateSubPackage: {method: 'PUT'}
        }
        );
    }]);

app.controller('AddPackSubCatController', ['$scope', 'PackageSubCategory', 'PackageCategory', function ($scope, PackageSubCategory, PackageCategory) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.obj = new PackageSubCategory();
        ob.obj2 = new PackageCategory();
        ob.fetchAllSubCategory = function () {
            ob.objArray = PackageSubCategory.query();
            $scope.names= ob.objArray2 = PackageCategory.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllSubCategory();
        ob.addSubPackage = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllSubCategory();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editSubCategory = function (id) {
            console.log('Inside edit');
            ob.obj = PackageSubCategory.get({packSubCatId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateSubCategoryDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateSubPackage(function (object) {
                    console.log(object);
                    ob.updatedId = object.packSubCatId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllSubCategory();
                });
            }
        };
        ob.deleteSubPackage = function (id) {
            console.log('Inside delete');
            ob.obj = PackageSubCategory.delete({packSubCatId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllSubCategory();
            });
        };
        ob.reset = function () {
            ob.obj = new PackageSubCategory();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new PackageSubCategory();
            ob.flag = '';
            ob.fetchAllSubCategory();
        };
    }]);



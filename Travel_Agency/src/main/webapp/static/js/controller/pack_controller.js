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
app.factory('Pack', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/pacs/pack/:packId', {packId: '@packId'},
        {
            updatePack: {method: 'PUT'}
        }
        );
    }]);

app.controller('AddPackController', ['$scope', 'Pack', 'PackageSubCategory', 'PackageCategory', function ($scope, Pack, PackageSubCategory, PackageCategory) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new Pack();
         ob.obj2 = new PackageCategory();
         ob.obj3 = new PackageSubCategory();
        ob.fetchAllPack = function () {
            ob.objArray = Pack.query();
            $scope.names= ob.objArray2 = PackageCategory.query();
             $scope.name= ob.objArray3 = PackageSubCategory.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllPack();
        ob.addPack = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllPack();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editPack = function (id) {
            console.log('Inside edit');
            ob.obj = Pack.get({packId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updatePackDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updatePack(function (object) {
                    console.log(object);
                    ob.updatedId = object.packId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllPack();
                });
            }
        };
        ob.deletePack = function (id) {
            console.log('Inside delete');
            ob.obj = Pack.delete({packId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllPack();
            });
        };
        ob.reset = function () {
            ob.obj = new Pack();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Pack();
            ob.flag = '';
            ob.fetchAllPack();
        };
    }]);



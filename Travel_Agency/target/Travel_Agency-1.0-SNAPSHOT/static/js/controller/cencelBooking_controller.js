'use strict';

app.factory('ConfirmBooking', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/booking/confirmBooking/:bookingId', {bookingId: '@bookingId'},
        {
            updateBooking: {method: 'PUT'}
        }
        );
    }]);
app.factory('CustomerRegistration', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/customers/customerRegistration/:custId', {custId: '@custId'},
        {
            updateCustomer: {method: 'PUT'}
        }
        );
    }]);
app.factory('CencelBooking', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/cencel/cencelBooking/:cencelBookingId', {cencelBookingId: '@cencelBookingId'},
        {
            updateCencellation: {method: 'PUT'}
        }
        );
    }]);

app.controller('CencelBookingController', ['$scope', 'CencelBooking', 'ConfirmBooking', 'CustomerRegistration', function ($scope, CencelBooking, ConfirmBooking, CustomerRegistration) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new CencelBooking();
        ob.obj2 = new ConfirmBooking();
        ob.obj3 = new CustomerRegistration();
        ob.fetchAllCencel = function () {
            ob.objArray = CencelBooking.query();
            $scope.names= ob.objArray2 = ConfirmBooking.query();
            $scope.nams= ob.objArray3 = CustomerRegistration.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllCencel();
        ob.addCencellation = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllCencel();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editCencel = function (id) {
            console.log('Inside edit');
            ob.obj = CencelBooking.get({cencelBookingId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateCencelDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateCencellation(function (object) {
                    console.log(object);
                    ob.updatedId = object.cencelBookingId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllCencel();
                });
            }
        };
        ob.deleteCencellation = function (id) {
            console.log('Inside delete');
            ob.obj = CencelBooking.delete({cencelBookingId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllCencel();
            });
        };
        ob.reset = function () {
            ob.obj = new CencelBooking();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new CencelBooking();
            ob.flag = '';
            ob.fetchAllCencel();
        };
    }]);



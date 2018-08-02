'use strict';

app.factory('CustomerRegistration', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/customers/customerRegistration/:custId', {custId: '@custId'},
        {
            updateCustomer: {method: 'PUT'}
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
app.factory('ConfirmBooking', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/booking/confirmBooking/:bookingId', {bookingId: '@bookingId'},
        {
            updateBooking: {method: 'PUT'}
        }
        );
    }]);

app.controller('ConfirmBookingController', ['$scope', 'ConfirmBooking', 'CustomerRegistration', 'Pack', function ($scope, ConfirmBooking, CustomerRegistration, Pack) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new ConfirmBooking();
        ob.obj2 = new CustomerRegistration();
        ob.obj3 = new Pack();
        ob.fetchAllBooking = function () {
            ob.objArray = ConfirmBooking.query();
            $scope.names= ob.objArray2 = CustomerRegistration.query();
            $scope.nams= ob.objArray3 = Pack.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllBooking();
        ob.addBooking = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllBooking();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editBooking = function (id) {
            console.log('Inside edit');
            ob.obj = ConfirmBooking.get({bookingId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateBookingDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateBooking(function (object) {
                    console.log(object);
                    ob.updatedId = object.bookingId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllBooking();
                });
            }
        };
        ob.deleteBooking = function (id) {
            console.log('Inside delete');
            ob.obj = ConfirmBooking.delete({bookingId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllBooking();
            });
        };
        ob.reset = function () {
            ob.obj = new ConfirmBooking();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new ConfirmBooking();
            ob.flag = '';
            ob.fetchAllBooking();
        };
    }]);



'use strict';

app.factory('HotelReservation', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/hotels/hotelReservation/:hotelId', {hotelId: '@hotelId'},
        {
            updateHotel: {method: 'PUT'}
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
app.factory('ConfirmHotelReservation', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/confirm/confirmHotelReservation/:hotelReservationId', {hotelReservationId: '@hotelReservationId'},
        {
            updateConfirmedHotel: {method: 'PUT'}
        }
        );
    }]);

app.controller('ConfrmHotelReservationController', ['$scope', 'ConfirmHotelReservation', 'CustomerRegistration', 'HotelReservation', function ($scope, ConfirmHotelReservation, CustomerRegistration, HotelReservation) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new ConfirmHotelReservation();
        ob.obj2 = new CustomerRegistration();
        ob.obj3 = new HotelReservation();
        ob.fetchAllConfirmedHotel = function () {
            ob.objArray = ConfirmHotelReservation.query();
            $scope.names= ob.objArray2 = CustomerRegistration.query();
            $scope.nams= ob.objArray3 = HotelReservation.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllConfirmedHotel();
        ob.addConfirmedHotel = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllConfirmedHotel();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editConfirmedHotel = function (id) {
            console.log('Inside edit');
            ob.obj = ConfirmHotelReservation.get({hotelReservationId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateConfirmHotel = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateConfirmedHotel(function (object) {
                    console.log(object);
                    ob.updatedId = object.hotelReservationId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllConfirmedHotel();
                });
            }
        };
        ob.deleteConfirmedHotel = function (id) {
            console.log('Inside delete');
            ob.obj = ConfirmHotelReservation.delete({hotelReservationId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllConfirmedHotel();
            });
        };
        ob.reset = function () {
            ob.obj = new ConfirmHotelReservation();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new ConfirmHotelReservation();
            ob.flag = '';
            ob.fetchAllConfirmedHotel();
        };
    }]);



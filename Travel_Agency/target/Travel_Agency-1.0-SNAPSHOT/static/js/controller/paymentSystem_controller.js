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
app.factory('PaymentSystem', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/payment/paymentSystem/:paymentId', {paymentId: '@paymentId'},
        {
            updatePayment: {method: 'PUT'}
        }
        );
    }]);

app.controller('PaymentSystemController', ['$scope', 'PaymentSystem', 'ConfirmBooking', 'CustomerRegistration', function ($scope, PaymentSystem, ConfirmBooking, CustomerRegistration) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new PaymentSystem();
        ob.obj2 = new ConfirmBooking();
        ob.obj3 = new CustomerRegistration();
        ob.fetchAllPayment = function () {
            ob.objArray = PaymentSystem.query();
            $scope.names= ob.objArray2 = ConfirmBooking.query();
            $scope.nams= ob.objArray3 = CustomerRegistration.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllPayment();
        ob.addPayment = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllPayment();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editPayment = function (id) {
            console.log('Inside edit');
            ob.obj = PaymentSystem.get({paymentId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updatePaymentDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updatePayment(function (object) {
                    console.log(object);
                    ob.updatedId = object.paymentId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllPayment();
                });
            }
        };
        ob.deletePayment = function (id) {
            console.log('Inside delete');
            ob.obj = PaymentSystem.delete({paymentId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllPayment();
            });
        };
        ob.reset = function () {
            ob.obj = new PaymentSystem();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new PaymentSystem();
            ob.flag = '';
            ob.fetchAllPayment();
        };
    }]);



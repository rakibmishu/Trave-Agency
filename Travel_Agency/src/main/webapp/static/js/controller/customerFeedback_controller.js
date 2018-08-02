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

app.factory('CustomerFeedback', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/myTravel/feedback/customerFeedback/:feedbackId', {feedbackId: '@feedbackId'},
        {
            updateFeedback: {method: 'PUT'}
        }
        );
    }]);

app.controller('FeedbackController', ['$scope', 'CustomerFeedback', 'CustomerRegistration', 'Pack', function ($scope, CustomerFeedback, CustomerRegistration, Pack) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new CustomerFeedback();
        ob.obj2 = new CustomerRegistration();
        ob.obj3 = new Pack();
        ob.fetchAllFeedback = function () {
            ob.objArray = CustomerFeedback.query();
            $scope.names= ob.objArray2 = CustomerRegistration.query();
            $scope.nams= ob.objArray3 = Pack.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllFeedback();
        ob.addFeedback = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllFeedback();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editFeedback = function (id) {
            console.log('Inside edit');
            ob.obj = CustomerFeedback.get({feedbackId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateFeedbackDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateFeedback(function (object) {
                    console.log(object);
                    ob.updatedId = object.feedbackId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllFeedback();
                });
            }
        };
        ob.deleteFeedback = function (id) {
            console.log('Inside delete');
            ob.obj = CustomerFeedback.delete({feedbackId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllFeedback();
            });
        };
        ob.reset = function () {
            ob.obj = new CustomerFeedback();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new CustomerFeedback();
            ob.flag = '';
            ob.fetchAllFeedback();
        };
    }]);



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <link href="../../static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../static/js/lib/jquery.min.js" type="text/javascript"></script>
        <script src="../../static/js/lib/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../static/js/lib/angular.min.js" type="text/javascript"></script>
        <script src="../../static/js/lib/angular-resource.min.js" type="text/javascript"></script>
        <script src="../../static/js/app.js" type="text/javascript"></script>
        <script src="../../static/js/controller/paymentSystem_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
          <title> Payment System</title>
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.2/angular.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-resource/1.7.2/angular-resource.min.js"></script>
        <script src="../../static/js/app.js" type="text/javascript"></script>
        <script src="../../static/js/controller/admin_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>-->
      </head>
    <body ng-app="myApp">
        <div ng-controller="PaymentSystemController as objCtrl">
            <h1> Payment System Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add Payment System </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update PaymentSystem for ID: {{ objCtrl.obj.paymentId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td> Booking ID</td>
                        <td>
                            <select ng-model="objCtrl.obj.confirmBooking" ng-options="x.bookingId for x in names">
</select>
                        </td>
                        <td>Customer Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.customerRegistration" ng-options="y.userName for y in nams">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Card No: </td> <td><input type="text" name="cardNo" ng-model="objCtrl.obj.cardNo" required/> 
                            <span ng-show="objForm.cardNo.$error.required" class="msg-val">Card No is required.</span> </td>
                    </tr>
                    <tr>
                        <td>CVV No: </td> <td><input type="text" name="cvvNo" ng-model="objCtrl.obj.cvvNo" required/> 
                            <span ng-show="objForm.cvvNo.$error.required" class="msg-val">CVV No is required.</span> </td>
                    </tr>
                     <tr>
                        <td>Expire date: </td> <td><input type="date" name="expireDate" ng-model="objCtrl.obj.expireDate" required/> 
                            <span ng-show="objForm.expireDate.$error.required" class="msg-val">Expire date is required.</span> </td>
                    </tr>
                    <!--
                    <tr>
                        <td>Nprice: </td> <td><input type="text" name="bookNetPrice" ng-model="objCtrl.obj.bookNetPrice" required/> 
                            <span ng-show="objForm.bookNetPrice.$error.required" class="msg-val">Nprice is required.</span> </td>
                    </tr>-->
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Payment successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Payment already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addPayment()" value="Add Payment"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updatePaymentDetail()" value="Update Booking"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Payment successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>Payment_ID </th> 
                    <th>Booking Id</th>
                    <th>User Name</th>
                    <th>Card No</th> 
                    <th>CVV No</th>
                    <th>Expire Date</th>

                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.paymentId"></span></td>
                    <td><span ng-bind="row.confirmBooking.bookingId"></span></td>
                    <td><span ng-bind="row.customerRegistration.userName"></span></td>
                   <td><span ng-bind="row.cardNo"></span></td>
                    <td><span ng-bind="row.cvvNo"></span></td>
                     <td><span ng-bind="row.expireDate"></span></td>

                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deletePayment(row.paymentId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editPayment(row.paymentId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.paymentId == objCtrl.updatedId" class="msg-success">Payment successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>

    </body>
</html> 
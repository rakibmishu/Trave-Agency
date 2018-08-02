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
        <script src="../../static/js/controller/cencelBooking_controller.js" type="text/javascript"></script>
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
        <div ng-controller="CencelBookingController as objCtrl">
            <h1> Canceled Booking Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add Cancel System </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update CancelBooking for ID: {{ objCtrl.obj.cencelBookingId}} </h3> 
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
                        <td>Cancel Date: </td> <td><input type="date" name="cenceletionDate" ng-model="objCtrl.obj.cenceletionDate" required/> 
                            <span ng-show="objForm.cenceletionDate.$error.required" class="msg-val">Cancellation Date is required.</span> </td>
                    </tr>
                    
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Cancel is successfully Done.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val"> already Cancel.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addCencellation()" value="Add Cancel"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateCencelDetail()" value="Update Cancel"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Cancel successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>Cancel_ID </th> 
                    <th>Booking Id</th>
                    <th>User Name</th>
                    
                    <th>Cancel Date</th>

                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.cencelBookingId"></span></td>
                    <td><span ng-bind="row.confirmBooking.bookingId"></span></td>
                    <td><span ng-bind="row.customerRegistration.userName"></span></td>
                     <td><span ng-bind="row.cenceletionDate"></span></td>

                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteCencellation(row.cencelBookingId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editCencel(row.cencelBookingId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.cencelBookingId == objCtrl.updatedId" class="msg-success">Booking Cancel successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>

    </body>
</html> 
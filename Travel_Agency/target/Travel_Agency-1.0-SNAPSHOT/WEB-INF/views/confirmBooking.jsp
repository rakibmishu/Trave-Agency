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
        <script src="../../static/js/controller/confirmBooking_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
          <title> Booking Confirm</title>
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
        <div ng-controller="ConfirmBookingController as objCtrl">
            <h1> Confirm Booking Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add ConfirmBooking </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update ConfirmBooking for ID: {{ objCtrl.obj.bookingId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Customer Registration</td>
                        <td>
                            <select ng-model="objCtrl.obj.customerRegistration" ng-options="x.userName for x in names">
</select>
                        </td>
                        <td>Place</td>
                        <td>
                            <select ng-model="objCtrl.obj.pack" ng-options="y.place for y in nams">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirmatiom date: </td> <td><input type="date" name="confirmDate" ng-model="objCtrl.obj.confirmDate" required/> 
                            <span ng-show="objForm.confirmDate.$error.required" class="msg-val">Confirmation Date is required.</span> </td>
                    </tr>
<!--                    <tr>
                        <td>Price: </td> <td><input type="text" name="bookPrice" ng-model="objCtrl.obj.bookPrice" required/> 
                            <span ng-show="objForm.bookPrice.$error.required" class="msg-val">Price is required.</span> </td>
                    </tr>
                     <tr>
                        <td>Discount: </td> <td><input type="text" name="bookDiscount" ng-model="objCtrl.obj.bookDiscount" required/> 
                            <span ng-show="objForm.bookDiscount.$error.required" class="msg-val">Discount is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Nprice: </td> <td><input type="text" name="bookNetPrice" ng-model="objCtrl.obj.bookNetPrice" required/> 
                            <span ng-show="objForm.bookNetPrice.$error.required" class="msg-val">Nprice is required.</span> </td>
                    </tr>-->
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Booking successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Booking already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addBooking()" value="Add Booking"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateBookingDetail()" value="Update Booking"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Booking successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>Booking_ID </th> 
                    <th>User_Name</th>
                    <th>Place</th>
                    <th>Confirm_Date</th> 

                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.bookingId"></span></td>
                    <td><span ng-bind="row.customerRegistration.userName"></span></td>
                    <td><span ng-bind="row.pack.place"></span></td>
                   <td><span ng-bind="row.confirmDate"></span></td>

                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteBooking(row.bookingId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editBooking(row.bookingId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.bookingId == objCtrl.updatedId" class="msg-success">Booking successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>

    </body>
</html> 
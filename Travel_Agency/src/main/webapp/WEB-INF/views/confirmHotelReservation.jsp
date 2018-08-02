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
        <script src="../../static/js/controller/confirmHotelReservation_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
          <title>Hotel Confirm</title>
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
        <div ng-controller="ConfrmHotelReservationController as objCtrl">
            <h1> Confirmation Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add Confirm Hotel </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Confirmed Hotel for ID: {{ objCtrl.obj.hotelReservationId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td> User Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.customerRegistration" ng-options="x.userName for x in names">
</select>
                        </td>
                        <td>Hotel Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.hotelReservation" ng-options="y.hotelName for y in nams">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Reservation Date: </td> <td><input type="date" name="reservationDate" ng-model="objCtrl.obj.reservationDate" required/> 
                            <span ng-show="objForm.reservationDate.$error.required" class="msg-val">Reservation Date is required.</span> </td>
                    </tr>
                    
                     <tr>
                        <td>Check In Date: </td> <td><input type="date" name="checkIn" ng-model="objCtrl.obj.checkIn" required/> 
                            <span ng-show="objForm.checkIn.$error.required" class="msg-val">Check In Date is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Check Out Date: </td> <td><input type="date" name="checkOut" ng-model="objCtrl.obj.checkOut" required/> 
                            <span ng-show="objForm.checkOut.$error.required" class="msg-val">Check Out Date is required.</span> </td>
                    </tr>
                    
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Hotel Resarvation is successfully Done.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val"> Resarvation Cancel.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addConfirmedHotel()" value="Add Confirm Hotel"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateConfirmHotel()" value="Update Confirm Hotel"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Confirmed Hotel successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>Reservation_ID </th> 
                    <th>User_Name</th>
                    <th>Hotel_Name</th>
                    
                    <th>Reservation_Date</th>
                     <th>CheckIN_Date</th>
                     

                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.hotelReservationId"></span></td>
                    <td><span ng-bind="row.customerRegistration.userName"></span></td>
                    <td><span ng-bind="row.hotelReservation.hotelName"></span></td>
                     <td><span ng-bind="row.reservationDate"></span></td>
                     <td><span ng-bind="row.checkIn"></span></td>
                     <td><span ng-bind="row.checkOut"></span></td>

                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteConfirmedHotel(row.hotelReservationId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editConfirmedHotel(row.hotelReservationId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.hotelReservationId == objCtrl.updatedId" class="msg-success">Hotel Reservation successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>

    </body>
</html> 
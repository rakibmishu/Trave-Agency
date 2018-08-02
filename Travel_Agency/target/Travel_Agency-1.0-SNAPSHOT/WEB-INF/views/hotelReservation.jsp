<%-- 
    Document   : home
    Created on : Jan 24, 2018, 4:40:48 PM
    Author     : Faculty
--%>

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
        <script src="../../static/js/controller/hotelReservation_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
          <title> Spring MVC 4 REST + AngularJS </title>
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
        <div ng-controller="AddHotelController as objCtrl">
            <h1>All Hotel Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Hotel </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Hotel for ID: {{ objCtrl.obj.@hotelId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td> Place: </td> <td><input type="text" name="hotelPlace" ng-model="objCtrl.obj.hotelPlace" required/> 
                            <span ng-show="objForm.hotelPlace.$error.required" class="msg-val">Place Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Hotel Name: </td> <td> <input type="text" name="hotelName" ng-model="objCtrl.obj.hotelName" required/> 
                            <span ng-show="objForm.hotelName.$error.required" class="msg-val">Hotel Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Accommodation Cost: </td> <td><input type="text" name="roomTypeCost" ng-model="objCtrl.obj.roomTypeCost" required/> 
                            <span ng-show="objForm.roomTypeCost.$error.required" class="msg-val">Accommodation Cost is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Facilities Cost: </td> <td> <input type="text" name="facilitiesCost" ng-model="objCtrl.obj.facilitiesCost" required/> 
                            <span ng-show="objForm.facilitiesCost.$error.required" class="msg-val">Facilities Cost is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Available Room: </td> <td><input type="text" name="availableRoom" ng-model="objCtrl.obj.availableRoom" required/> 
                            <span ng-show="objForm.availableRoom.$error.required" class="msg-val">Available Room No. is required.</span> </td>
                    </tr>
<!--                    <tr>
                        <td>Password: </td> <td> <input type="text" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="msg-val"Password is required.</span> </td>
                    </tr>-->
                    
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Hotel successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Hotel already exists.</span> </td>
                    </tr>
                    
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addHotel()" value="Add Hotel"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateHotelDetail()" value="Update Hotel"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Hotel successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> <th>Place</th> <th>Hotel_Name</th> <th>Accommodation_Cost</th>  <th>Facilities_Cost</th> <th>Available Room</th> </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.hotelId"></span></td>
                    <td><span ng-bind="row.hotelPlace"></span></td>
                    <td><span ng-bind="row.hotelName"></span></td>
                    <td><span ng-bind="row.roomTypeCost"></span></td>
                    <td><span ng-bind="row.facilitiesCost"></span></td>
                    <td><span ng-bind="row.availableRoom"></span></td>
<!--                    <td><span ng-bind="row.password"></span></td>-->
                    
                    <td>
                        <input type="button" ng-click="objCtrl.deleteHotel(row.hotelId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editHotel(row.hotelId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.hotelId == objCtrl.updatedId" class="msg-success">Hotel successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        
    </body>
</html> 


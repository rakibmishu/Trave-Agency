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
        <script src="../../static/js/controller/admin_controller.js" type="text/javascript"></script>
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
        <div ng-controller="AddAdminController as objCtrl">
            <h1>Admin Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Admin </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Admin for ID: {{ objCtrl.obj.@adminId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>First Name: </td> <td><input type="text" name="firstName" ng-model="objCtrl.obj.firstName" required/> 
                            <span ng-show="objForm.firstName.$error.required" class="msg-val">First Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Last Name: </td> <td> <input type="text" name="lastName" ng-model="objCtrl.obj.lastName" required/> 
                            <span ng-show="objForm.lastName.$error.required" class="msg-val">Last Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Mobile: </td> <td><input type="text" name="mobile" ng-model="objCtrl.obj.mobile" required/> 
                            <span ng-show="objForm.mobile.$error.required" class="msg-val">Mobile no. is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Email: </td> <td> <input type="text" name="email" ng-model="objCtrl.obj.email" required/> 
                            <span ng-show="objForm.email.$error.required" class="msg-val">Email is required.</span> </td>
                    </tr>
                    <tr>
                        <td>User Name: </td> <td><input type="text" name="userName" ng-model="objCtrl.obj.userName" required/> 
                            <span ng-show="objForm.userName.$error.required" class="msg-val">User Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Password: </td> <td> <input type="text" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="msg-val"Password is required.</span> </td>
                    </tr>
                    
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Admin successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Admin already exists.</span> </td>
                    </tr>
                    
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addAdmin()" value="Add Admin"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateAdminDetail()" value="Update Admin"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Admin successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> <th>First_NAme</th> <th>Last_Name</th> <th>Mobile</th>  <th>Email</th> <th>User_name</th> <th>Password</th></tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.adminId"></span></td>
                    <td><span ng-bind="row.firstName"></span></td>
                    <td><span ng-bind="row.lastName"></span></td>
                    <td><span ng-bind="row.mobile"></span></td>
                    <td><span ng-bind="row.email"></span></td>
                    <td><span ng-bind="row.userName"></span></td>
                    <td><span ng-bind="row.password"></span></td>
                    
                    <td>
                        <input type="button" ng-click="objCtrl.deleteAdmin(row.adminId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editAdmin(row.adminId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.adminId == objCtrl.updatedId" class="msg-success">Admin successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        
    </body>
</html> 


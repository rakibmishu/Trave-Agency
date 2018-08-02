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
        <script src="../../static/js/controller/packageCategory_controller.js" type="text/javascript"></script>
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
        <div ng-controller="AddPackageCategoryController as objCtrl">
            <h1>Package Category Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Package Category </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Package Category for ID: {{ objCtrl.obj.@packCatId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Package Category Name: </td> <td><input type="text" name="packCatName" ng-model="objCtrl.obj.packCatName" required/> 
                            <span ng-show="objForm.packCatName.$error.required" class="msg-val">Package Category Name is required.</span> </td>
                    </tr>
<!--                    <tr>
                        <td>Last Name: </td> <td> <input type="text" name="lastName" ng-model="objCtrl.obj.lastName" required/> 
                            <span ng-show="objForm.lastName.$error.required" class="msg-val">Last Name is required.</span> </td>
                    </tr>-->
<!--                    <tr>
                        <td>Mobile: </td> <td><input type="text" name="mobile" ng-model="objCtrl.obj.mobile" required/> 
                            <span ng-show="objForm.mobile.$error.required" class="msg-val">Mobile no. is required.</span> </td>
                    </tr>-->
<!--                    <tr>
                        <td>Email: </td> <td> <input type="text" name="email" ng-model="objCtrl.obj.email" required/> 
                            <span ng-show="objForm.email.$error.required" class="msg-val">Email is required.</span> </td>
                    </tr>-->
<!--                    <tr>
                        <td>User Name: </td> <td><input type="text" name="userName" ng-model="objCtrl.obj.userName" required/> 
                            <span ng-show="objForm.userName.$error.required" class="msg-val">User Name is required.</span> </td>
                    </tr>-->
<!--                    <tr>
                        <td>Password: </td> <td> <input type="text" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="msg-val"Password is required.</span> </td>
                    </tr>-->
                    
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Package Category successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Package Category already exists.</span> </td>
                    </tr>
                    
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addPackage()" value="Add Package Category"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updatePackageCategory()" value="Update Package Category"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Package Category successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr> <th>ID </th> <th>Package_Category_Name</th> </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.packCatId"></span></td>
                    <td><span ng-bind="row.packCatName"></span></td>
<!--                    <td><span ng-bind="row.lastName"></span></td>
                    <td><span ng-bind="row.mobile"></span></td>
                    <td><span ng-bind="row.email"></span></td>
                    <td><span ng-bind="row.userName"></span></td>
                    <td><span ng-bind="row.password"></span></td>-->
                    
                    <td>
                        <input type="button" ng-click="objCtrl.deletePackageCategory(row.packCatId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editPackage(row.packCatId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.packCatId == objCtrl.updatedId" class="msg-success">Package Category successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        
    </body>
</html> 


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
        <script src="../../static/js/controller/packageSubCategory_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
          <title>Package SubCategory </title>

      </head>
    <body ng-app="myApp">
        <div ng-controller="AddPackSubCatController as objCtrl">
            <h1> SubCategory Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New SubCategory </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update SubCategory for ID: {{ objCtrl.obj.packSubCatId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Category Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.packageCategory" ng-options="x.packCatName for x in names">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>SubCategory Name: </td> <td><input type="text" name="packSubCatName" ng-model="objCtrl.obj.packSubCatName" required/> 
                            <span ng-show="objForm.packSubCatName.$error.required" class="msg-val">SubCategory Name is required.</span> </td>
                    </tr>
                   
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">SubCategory successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">SubCategory already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addSubPackage()" value="Add SubCategory"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateSubCategoryDetail()" value="Update Order"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">SubCategory successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> 
                    <th>Category Name</th> 
                    <th>SubCategory Name</th> 
                    
                    
                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.packSubCatId"></span></td>
                    <td><span ng-bind="row.packageCategory.packCatName"></span></td>
                    <td><span ng-bind="row.packSubCatName"></span></td>
                    
                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteSubPackage(row.packSubCatId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editSubCategory(row.packSubCatId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.packSubCatId == objCtrl.updatedId" class="msg-success">SubCategory successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>
        
    </body>
</html> 
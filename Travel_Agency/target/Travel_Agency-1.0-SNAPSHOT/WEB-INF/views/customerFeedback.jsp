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
        <script src="../../static/js/controller/customerFeedback_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
        <title> Customer Feedback based on Individual Packages</title>
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
        <div ng-controller="FeedbackController as objCtrl">
            <h1> Feedback Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add Feedback </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Feedback for ID: {{ objCtrl.obj.feedbackId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td> User Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.customerRegistration" ng-options="x.userName for x in names">
                            </select>
                        </td>
                        <td>Place</td>
                        <td>
                            <select ng-model="objCtrl.obj.pack" ng-options="y.place  for y in nams">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Comment: </td> <td><input type="text" name="comment" ng-model="objCtrl.obj.comment" required/> 
                            <span ng-show="objForm.comment.$error.required" class="msg-val">Card No is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Feedback Date: </td> <td><input type="date" name="feedbackDate" ng-model="objCtrl.obj.feedbackDate" required/> 
                            <span ng-show="objForm.feedbackDate.$error.required" class="msg-val">Feedback Date is required.</span> </td>
                    </tr>
                    


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Feedback successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Feedback already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addFeedback()" value="Add Feedback"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateFeedbackDetail()" value="Update Feedback"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Feedback successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>Feedback_ID </th> 
                    <th>User Name</th>
                    <th>Place</th> 
                    <th>Comment</th>
                    <th>Feedback Date</th>


                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.feedbackId"></span></td>
                    <td><span ng-bind="row.customerRegistration.userName"></span></td>
                    <td><span ng-bind="row.pack.place"></span></td>
                    <td><span ng-bind="row.comment"></span></td>
                    <td><span ng-bind="row.feedbackDate"></span></td>



                    <td>
                        <input type="button" ng-click="objCtrl.deleteFeedback(row.feedbackId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editFeedback(row.feedbackId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.feedbackId == objCtrl.updatedId" class="msg-success">Feedback successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>

    </body>
</html> 
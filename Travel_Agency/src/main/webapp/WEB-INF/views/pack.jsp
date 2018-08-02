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
        <script src="../../static/js/controller/pack_controller.js" type="text/javascript"></script>
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
         
        <link href="../../static/css/app.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/flexslider.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/jquery.desoslide.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/lightbox.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="../../static/css/style_1.css" rel="stylesheet" type="text/css"/>
        
    <a href="../../static/fonts/FontAwesome.otf"></a>
    <a href="../../static/fonts/fontawesome-webfont.eot"></a>
    <a href="../../static/fonts/fontawesome-webfont.svg"></a>
    <a href="../../static/fonts/fontawesome-webfont.ttf"></a>
      <a href="../../static/fonts/fontawesome-webfont.woff"></a>
      <a href="../../static/fonts/fontawesome-webfont.woff2"></a>
      <a href="../../static/fonts/glyphicons-halflings-regular.woff"></a>
      <a href="../../static/fonts/glyphicons-halflings-regular.woff2"></a>
      
      <script src="../../static/js/bars.js" type="text/javascript"></script>
      <script src="../../static/js/bootstrap.js" type="text/javascript"></script>
      <script src="../../static/js/easing.js" type="text/javascript"></script>
      <script src="../../static/js/jquery-2.2.3.min.js" type="text/javascript"></script>
      <script src="../../static/js/jquery.desoslide.js" type="text/javascript"></script>
       <script src="../../static/js/jquery.flexslider.js" type="text/javascript"></script>
        <script src="../../static/js/lightbox-plus-jquery.min.js" type="text/javascript"></script>
        <script src="../../static/js/move-top.js" type="text/javascript"></script>
        <script src="../../static/js/owl.carousel.js" type="text/javascript"></script>
        <script src="../../static/js/smoothscroll.min.js" type="text/javascript"></script>
        <style>
            body{ background-color: #EAE7E7;}
            .banner{ 
	
        width: 2300px;
        
} 
        </style>
      
    <title> SopnoVubon </title>
   
  
    


</head>
    <body ng-app="myApp">

        <div class="banner w3about wid">
            <!-- header -->
            <div class="header">
                <div class="container">
                    <div class="header-w3lsrow"> 
                        <div class="menu"> 
                            <div class="toggle"></div> 
                            <ul class="w3nav">
                                <li><a href="http://localhost:8080/myTravel/"><strong> Home </strong></a></li>
                                <li><a href="#about" class="active"> About</a></li> 
                                <li><a href="gallery.html"> Gallery</a></li> 
                                <li><a href="http://localhost:8080/myTravel/pacs/home/">Packages</a></li>
                                <!--                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Short Codes <span class="caret"></span></a>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="icons.html">Web Icons</a></li>
                                                                    <li><a href="codes.html">Typography</a></li>     
                                                                </ul>
                                                            </li> -->
                                <li><a href="contact.html"> Contact Us</a></li>
                            </ul>
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="logo">
                            <h1><a href="index.html">SOPNOVUBON</a></h1>
                        </div>  
                        <div class="header-right">   
                            <ul>
                                <li><a href="">SignIn</a></li>
                                <li><a href="http://localhost:8080/myTravel/signup/home/">SignUp</a></li> 
                            </ul>
                            <div class="clearfix"> </div> 
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!-- //header --> 
            <!-- banner-text -->
            <div class="banner-text"> 
                <div class="container"> 
                    <div class="banner-w3lstext">
                        <!--                    <h2>SOPNOVUBON</h2>-->
                        <h2>Dream with Nature</h2>
                        <h2>A Promising Travel Agency</h2>
                    </div> 	 
                </div>
            </div>
            <!-- //banner-text --> 
        </div>
        <!-- //banner -->
<!--        pack-->
 <strong>
     <div class="strong">
   
         <div ng-controller="AddPackController as objCtrl">
             
            <h1> Pack Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add Package </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Pack for ID: {{ objCtrl.obj.packId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Add Category</td><br>
                        <td>
                            <select ng-model="objCtrl.obj.packageCategory" ng-options="x.packCatName for x in names">
</select>
<!--                            //<select ng-model="objCtrl.obj.packageCategory" ng-options="x.packCatName for x in names">-->
                        </td>
                        <td>Add SubCategory</td>
                        <td>
                            <select ng-model="objCtrl.obj.packageSubCategory" ng-options="y.packSubCatName for y in name">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Place: </td> <td><input type="text" name="place" ng-model="objCtrl.obj.place" required/> 
                            <span ng-show="objForm.place.$error.required" class="msg-val">Place is required.</span> </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>Number of day: </td> <td><input type="text" name="numberOfDay" ng-model="objCtrl.obj.numberOfDay" required/> 
                            <span ng-show="objForm.numberOfDay.$error.required" class="msg-val">Number of Day is required.</span> </td>
                    </tr>
                     <tr>
                        <td>Number of Night: </td> <td><input type="text" name="numberOfNight" ng-model="objCtrl.obj.numberOfNight" required/> 
                            <span ng-show="objForm.numberOfNight.$error.required" class="msg-val">Number of Night is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Number of Adult: </td> <td><input type="text" name="numberOfAdult" ng-model="objCtrl.obj.numberOfAdult"/>
                    </tr>
                    <tr>
                        <td>Number of Child </td> <td><input type="text" name="numberOfChild" ng-model="objCtrl.obj.numberOfChild" /></td> 
                             
                    </tr>
                    <tr>
                        <td>Accommodation Cost: </td> <td><input type="text" name="accommodationCost" ng-model="objCtrl.obj.accommodationCost" required/> 
                            <span ng-show="objForm.accommodationCost.$error.required" class="msg-val">Accommodation Cost is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Bus Cost: </td> <td><input type="text" name="busCost" ng-model="objCtrl.obj.busCost" /> 
                    </tr>
                    <tr>
                        <td>Train Cost: </td> <td><input type="text" name="trainCost" ng-model="objCtrl.obj.trainCost" /> 
                    </tr>
                    <tr>
                        <td>Air Cost: </td> <td><input type="text" name="airCost" ng-model="objCtrl.obj.airCost" /> 
                    </tr>
                    <tr>
                        <td>Guide Service Cost: </td> <td><input type="text" name="guideServiceCost" ng-model="objCtrl.obj.guideServiceCost" /> 
                    </tr>
                    <tr>
                        <td>Departure Date: </td> <td><input type="date" name="departureDate" ng-model="objCtrl.obj.departureDate" required/> 
                            <span ng-show="objForm.departureDate.$error.required" class="msg-val">Depurture Date is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Return Date: </td> <td><input type="date" name="returnDate" ng-model="objCtrl.obj.returnDate" required/> 
                            <span ng-show="objForm.returnDate.$error.required" class="msg-val">Return Date is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Extra Service Cost: </td> <td><input type="text" name="extraService" ng-model="objCtrl.obj.extraService" />                     </tr>
                    <tr>
                        <td>total Cost: </td> <td><input type="text" name="total" ng-model="objCtrl.obj.total" required/> 
                            <span ng-show="objForm.total.$error.required" class="msg-val">total Cost is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Available Package: </td> <td><input type="text" name="availablePackage" ng-model="objCtrl.obj.availablePackage" required/> 
                            <span ng-show="objForm.availablePackage.$error.required" class="msg-val">Available Package is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Hotel Name: </td> <td><input type="text" name="hotelName" ng-model="objCtrl.obj.hotelName" required/> 
                            <span ng-show="objForm.hotelName.$error.required" class="msg-val">Hotel Name is required.</span> </td>
                    </tr>
                    
                     <tr>
                        <td>Image: </td> <td><input type="text" name="imageUrl" ng-model="objCtrl.obj.imageUrl" required/> 
                            <span ng-show="objForm.imageUrl.$error.required" class="msg-val">Image URL is required.</span> </td>
                    </tr>
                    
                    
                    
<!--                    //-->
                    
                     <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Package successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Package already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addPack()" value="Add Package"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updatePackDetail()" value="Update Package"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Package successfully deleted.</span>
                    </tr>
                </table>     
            </form>
         
            <table class="table table-bordered">
                <tr><th>ID</th>
                    <th>Package_Category</th>
                    <th>Package_SubCategory</th>
                    <th>Place</th> 
                    <th>Number_Of_Day</th> 
                    <th>Number_of_Night</th> 
                    <th>Number_of_Adult</th>
                    <th>Number_of_Child</th>
                    <th>Accommodation_Cost</th>
                    <th>Bus_Cost</th>
                    <th>Train_Cost</th> 
                    <th>Air_Cost</th> 
                    <th>Guide_Service_Cost</th>
                    <th>Departure_Date</th>
                    <th>Return_Date</th>
                    <th>Extra_Service</th> 
                    <th>Total</th> 
                    <th>Available_Package</th>
                     <th>Hotel_Name</th>
                     <th>Image_URL</th>
                </tr>
                    
                    
                    
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.packId"></span></td>
                    <td><span ng-bind="row.packageCategory.packCatName"></span></td>
                    <td><span ng-bind="row.packageSubCategory.packSubCatName"></span></td>
                    <td><span ng-bind="row.place"></span></td>
                    <td><span ng-bind="row.numberOfDay"></span></td>
                    <td><span ng-bind="row.numberOfNight"></span></td>
                    <td><span ng-bind="row.numberOfAdult"></span></td>
                    <td><span ng-bind="row.numberOfChild"></span></td>
                    <td><span ng-bind="row.accommodationCost"></span></td>
                    <td><span ng-bind="row.busCost"></span></td>
                    <td><span ng-bind="row.trainCost"></span></td>
                    <td><span ng-bind="row.airCost"></span></td>
                    <td><span ng-bind="row.guideServiceCost"></span></td>
                    <td><span ng-bind="row.departureDate"></span></td>
                    <td><span ng-bind="row.returnDate"></span></td>
                    <td><span ng-bind="row.extraService"></span></td>
                    <td><span ng-bind="row.total"></span></td>
                    <td><span ng-bind="row.availablePackage"></span></td>
                    <td><span ng-bind="row.hotelName"></span></td>
                    <td><span ng-bind="row.imageUrl"></span></td>
                 
                   
                    <td>
                        <input type="button" ng-click="objCtrl.deletePack(row.packId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editPack(row.packId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.packId == objCtrl.updatedId" class="msg-success">Package successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>  	
            </div>	 			
         	</strong>		
    			
    <!-- //services -->
    <!-- team -->
    
    <!-- //team -->   
    <div class="footer">
        <div class="container">
            <div class="col-sm-6 footer-grids">
                <h1>Review</h1>
                <h3>This is one of the most popular travel agency.Stay with sopnovubon</h3>
            </div>
            <div class="col-sm-6 footer-grids">
                <h1>Contact Us</h1>
                <h3>23,VIP Road,Kakrail,Dhaka-1200</h3><br>
                <span>Office:017325489652</span>
                </p>
                <div class="footer-bottom">
                    <a href="#"><i class="fa fa-facebook"> </i><span>Facebook</span></a>
                    <a href="#"><i class="fa fa-twitter"> </i><span>Twitter</span></a>
                    <a href="#"><i class="fa fa-google-plus"> </i><span>Google +</span></a>

                </div>
            </div>

            <div class="clearfix"> </div>
            <div class="footer-copy">
                <p>© 2018 copyright. All rights reserved to sopnovubon| Design by Rakib Mishu Talukder</p>
            </div>
        </div>
    </div>
    <!-- //footer -->  
    <!-- menu js -->
    <script>
        $('.toggle').on('click', function () {
            $('.menu').toggleClass('open');
            $('.w3nav').toggleClass('show-w3nav');
            $('.w3nav a').toggleClass('show-w3nav-link');
            $('.toggle').toggleClass('close');
        });
    </script>
    <!-- //menu js -->
    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>	
<!--    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>-->
    <!-- //end-smooth-scrolling -->	
    <!-- smooth-scrolling-of-move-up -->
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear' 
             };
             */

            $().UItoTop({easingType: 'easeOutQuart'});

        });
    </script>
</body>
</html> 


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        h1{color: chartreuse;
            font-size:xx-large   }
        strong{font: bolder xx-large larger sans-serif;}
          body{background-color: #c1e2b3;}
        h5{font-size: 60px;}
        h4{font-size: 25px;}
       ul{ font-size: 15px;}
        list{font-weight: 900;}
       
        span{font-size: xx-large;
        color: #f0ad4e;
        b{font-size: 40px;}
    </style>

    <title> SopnoVubon </title>





</head>

<body ng-app="myApp">

    <!-- banner -->
    <div class="banner w3about">
        <!-- header -->
        <div class="header">
            <div class="container">
                <div class="header-w3lsrow"> 
                    <div class="menu"> 
                        <div class="toggle"></div> 
                        <ul class="w3nav">
                            <li><a href="#"><strong> Home </strong></a></li>
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
<!--                            <li><a href="http://localhost:8080/myTravel/signup/home/">SignUp</a></li> -->
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
    <!-- //banner-text -->
    <!-- //banner -->
    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-5 about-left">
                <img src="${pageContext.request.contextPath}/static/images/img1.jpg"  class="img-responsive" alt="Image"/>
            </div>  
            <div class="col-sm-7"><br><br>
                <div ng-controller="SignUpController as objCtrl">         
                    <form name="objForm" action="signIn.jsp" method="POST"> 
                        <center><br/><br><br><br><br><br><br><br>

                        <div >
                            <h2>SIGN UP HERE</h2>
                            <h1> <button type="button" class=" btn btn-success btn-lg">Admin</button>
                              <button type="button" class="btn btn-success btn-lg">User</button></h1>
                        </div>
                        </center>


                    </form>
                </div>
            </div> 
        </div>
    </div>	
    <!-- //services -->

    <!-- footer -->
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
               <b> <p>© 2018 copyright. All rights reserved to sopnovubon| Design by Rakib Mishu Talukder</p></b>
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
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
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


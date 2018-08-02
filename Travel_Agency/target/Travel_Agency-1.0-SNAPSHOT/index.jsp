

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
        <script src="../../static/js/controller/packageCategory_controller.js" type="text/javascript"></script>

        <script src="static/js/bars.js" type="text/javascript"></script>
        <script src="static/js/bootstrap.js" type="text/javascript"></script>
        <script src="static/js/easing.js" type="text/javascript"></script>
        <script src="static/js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="static/js/jquery.desoslide.js" type="text/javascript"></script>
        <script src="static/js/jquery.flexslider.js" type="text/javascript"></script>
        <script src="static/js/lightbox-plus-jquery.min.js" type="text/javascript"></script>
        <script src="static/js/move-top.js" type="text/javascript"></script>
        <script src="static/js/owl.carousel.js" type="text/javascript"></script>
        <script src="static/js/smoothscroll.min.js" type="text/javascript"></script>

        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>


        <link href="static/css/app.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/flexslider.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/jquery.desoslide.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/lightbox.css" rel="stylesheet" type="text/css"/>
        <link href="static/css/owl.carousel.css" rel="stylesheet" type="text/css"/> 
        <link href="static/css/style_1.css" rel="stylesheet" type="text/css"/>

    <a href="static/fonts/FontAwesome.otf"></a>
    <a href="static/fonts/fontawesome-webfont.eot"></a>
    <a href="static/fonts/fontawesome-webfont.svg"></a>
    <a href="static/fonts/fontawesome-webfont.ttf"></a>
    <a href="static/fonts/fontawesome-webfont.woff"></a>
    <a href="static/fonts/fontawesome-webfont.woff2"></a>
    <a href="static/fonts/glyphicons-halflings-regular.woff"></a>
    <a href="static/fonts/glyphicons-halflings-regular.woff2"></a>
    <title> SopnoVubon </title>
    <style>
        body{background-color: #c1e2b3;}
        h5{font-size: 60px;}
        h4{font-size: 25px;}
        ul{ font-size: 15px;}
        list{font-weight: 900;}
        h1{color: chartreuse;}
        span{font-size: xx-large;
             color: #f0ad4e;}
        </style>



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
                    </div
                    <center>
                    <div class="logo">
                        <h1>SOPNOVUBON</h1>
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
    <!-- about -->
    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-5 about-left">
                <img src="${pageContext.request.contextPath}/static/images/img1.jpg"  class="img-responsive" alt="Image"/>
            </div>  
            <div class="col-sm-7 span"><br><br>
                <h5><span class="btn btn-info btn-lg">About</span> <span class="btn btn-success btn-lg">History</span></h5><br>
                <h4>Sopnovubon is one of the most popular travel agency in Bangladesh.We help you to find the most attractive and divine natural place of Bangladesh.We support you to provide all type of information and services with our experienced team.So you can enjoy yourself with you and your family.We Provide you......</h4><br><br>
                <ul>
                    <li><i class="fa fa-check-square-o"></i>Stay in a good hotel with best comportness</li>
                    <li><i class="fa fa-check-square-o"></i>Testy and Healthy Food </li>
                    <li><i class="fa fa-check-square-o"></i> Extra Services for Couple </li>
                    <li><i class="fa fa-check-square-o"></i>Always provided Guide </li> 
                </ul>
                <br><br>
            </div> 
        </div>
    </div>

    <list>
    <div class="services agileits-bar"> 
        <div class="container">	 
            <h3 class="w3agileits-title">Package Rating</h3> 
            <div class="services-w3ls-row"> 
                <div class="progress">
                    <div class="progress-bar  progress-bar-success progress-bar-striped active" role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                        <strong>Cox's Bazar 100% </strong>
                    </div>
                </div> 
                <div class="progress">
                    <div class="progress-bar  progress-bar-info  progress-bar-striped active" role="progressbar"
                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                        <strong>Sylhet 100%</strong> 
                    </div>
                </div> 


                <div class="progress">
                    <div class="progress-bar progress-bar-warning  progress-bar-striped active" role="progressbar"
                         aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:85%">
                        <strong> Hill Tracks 85%</strong>
                    </div>
                </div>
                <div class="progress">
                    <div class="progress-bar progress-bar-info  progress-bar-striped active" role="progressbar"
                         aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
                        <strong> Kuakata 80%</strong>
                    </div>
                </div>

                <div class="progress">
                    <div class="progress-bar progress-bar-danger  progress-bar-striped active" role="progressbar"
                         aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
                        <strong>Saint MArtin's 70%</strong> 
                    </div>
                </div>
                </list>


            </div>	 			
        </div>	 			
    </div>			
    <!-- //services -->
    <!-- team -->

    <!--    <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-4 about-left">
                    <img src="${pageContext.request.contextPath}/static/images/edt2.jpg"  class="img-responsive" alt="Image"/>
                    <div class="view-caption">
                        <div class="w3ls-info">
                            <h4>Rakib Mishu</h4>
                            <h5>Manager</h5>
                        </div>
                        <ul>
                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
                        </ul>
                    </div>
                </div>  
                <div class="col-sm-4"><br><br>
    
                </div> 
                <div class="col-sm-4"><br><br>
    
                </div>
            </div>
        </div>-->
    <div class="container-fluid">
        <div class="row content">

            <div class="team-info">
                <h3 class="w3agileits-title">Our Team</h3> 
                <div class="team-row">
                    <div class="col-sm-4 about-left">
                        <div class="team-agile-img"> 
                            <a href="#"> <img src="${pageContext.request.contextPath}/static/images/edt2.jpg" class="img-responsive" alt="Rakib Mishu"/></a>
                            <div class="view-caption">
                                <div class="w3ls-info">
                                    <h1>Rakib Mishu</h1> 
                                    <h4>Founder</h4>
                                </div>
                                <ul>
                                    <li><a href="https://www.facebook.com/oronye.orkid"><span class="fa fa-facebook"></span></a></li>
                                    <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fa fa-instagram"></span></a></li>
                                </ul>
                            </div>    
                        </div>
                    </div>					
                    <div class="col-sm-4">
                        <div class="team-agile-img"> 
                            <a href="#"> <img src="${pageContext.request.contextPath}/static/images/mohsin.jpg" class="img-responsive" alt="Mohsin Kabir"/></a>

                            <div class="view-caption">
                                <div class="w3ls-info">
                                    <h1>Mohsin Kabir</h1> 
                                    <h4>Admin</h4>
                                </div>
                                <ul>
                                    <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                    <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fa fa-instagram"></span></a></li>
                                </ul>
                            </div>    
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="team-agile-img"> 
                            <a href="#"> <img src="${pageContext.request.contextPath}/static/images/mostafa.jpg" class="img-responsive" alt="Golam Mostafa"/></a>
                            <div class="view-caption">
                                <div class="w3ls-info">
                                    <h1>Golam Mostafa</h1> 
                                    <h4>Admin</h4>
                                </div>
                                <ul>
                                    <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                    <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fa fa-instagram"></span></a></li>
                                </ul>
                            </div>    
                        </div>
                    </div>

                    <div class="clearfix"> </div>
                </div>

            </div>

        </div>
    </div>
    <!--    //team    -->
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


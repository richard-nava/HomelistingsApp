<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link href="static/Eterna/css/bootstrap.css" rel="stylesheet" />
  <link href="static/Eterna/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="static/Eterna/css/flexslider.css" rel="stylesheet" />
  <link href="static/Eterna/css/prettyPhoto.css" rel="stylesheet" />
  <link href="static/Eterna/css/camera.css" rel="stylesheet" />
  <link href="static/Eterna/css/jquery.bxslider.css" rel="stylesheet" />
  <link href="static/Eterna/css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link href="static/Eterna/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />

  <!-- =======================================================
    Theme Name: Eterna
    Theme URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>

  <div id="wrapper">

    <!-- start header -->
    <jsp:include page="header.jsp"/>
    <!-- end header -->

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="inner-heading">
              <ul class="breadcrumb">
                <li><a href="index">Home</a> <i class="icon-angle-right"></i></li>
                <li class="active">Login</li>
              </ul>
              <h2>Login</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span4">

            <aside class="left-sidebar">
              <div class="widget">

                <h5 class="widgetheading">Categories</h5>

                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a href="#">Web design</a><span> (20)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Online business</a><span> (11)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Marketing strategy</a><span> (9)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">Technology</a><span> (12)</span></li>
                  <li><i class="icon-angle-right"></i> <a href="#">About finance</a><span> (18)</span></li>
                </ul>
              </div>
    </aside>
          </div>

          <div class="span8">
            <article>
              <div class="row">

                <div class="span8">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3><a href="#">Login</a></h3>
                    </div>
					<form action="Login" method="post" class="form-horizontal">
                  <h3>                
                      <span class="text-success"> ${msg}</span>
                      <span class="text-success"> ${success}</span>
                      <span class="alert-error">${error}</span>
                 </h3>
                  <div class="control-group">
                    <div class="controls">
                      <input type="email" name="email" id="user" placeholder="Username">
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                      <input type="password" name="password" id="pwd" placeholder="Password">
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" id="submiter" class="btn">Sign in</button>
                    </div>
                    
                  </div>
                </form>
                    </div>                              
                </div>
              </div>
            </article>            
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp"/>
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="static/Eterna/js/jquery.js"></script>
  <script src="static/Eterna/js/jquery.easing.1.3.js"></script>
  <script src="static/Eterna/js/bootstrap.js"></script>

  <script src="static/Eterna/js/modernizr.custom.js"></script>
  <script src="static/Eterna/js/toucheffects.js"></script>
  <script src="static/Eterna/js/google-code-prettify/prettify.js"></script>
  <script src="static/Eterna/js/jquery.bxslider.min.js"></script>

  <script src="static/Eterna/js/jquery.prettyPhoto.js"></script>
  <script src="static/Eterna/js/portfolio/jquery.quicksand.js"></script>
  <script src="static/Eterna/js/portfolio/setting.js"></script>

  <script src="static/Eterna/js/jquery.flexslider.js"></script>
  <script src="static/Eterna/js/animate.js"></script>
  <script src="static/Eterna/js/inview.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/Eterna/js/custom.js"></script>


</body>

</html>
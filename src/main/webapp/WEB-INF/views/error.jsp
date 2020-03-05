<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>Error</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div>
 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="inner-heading">
              <ul class="breadcrumb">
                <li><a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
                <li><a href="#">Pages</a> <i class="icon-angle-right"></i></li>
                <li class="active">404</li>
              </ul>
              <h2>404</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">



        <div class="row">
          <div class="span12">
            <div class="aligncenter">
              <i class="icon-circled icon-bgwarning icon-remove icon-4x"></i>
            </div>
            <div class="blankline30"></div>
            <h3 class="aligncenter">Sorry, requested page not found</h3>
            <p class="aligncenter"><strong>You definitely messed up somewhere. Please step away from your computer, have a V8, maybe pet your cat...idk.
            </strong> </p>
            <p class="aligncenter">
            <small>Are you normally this bad at doing things?</small>
            </p>
          </div>

        </div>



      </div>
    </section>
</div>
	
<jsp:include page="footer.jsp"/>

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
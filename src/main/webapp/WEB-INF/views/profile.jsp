<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_profile" value="active" />

<c:if test="${empty loggedInUser.email}">
<%response.sendRedirect("/Login");%>
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Profile</title>
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

   <style>
.preview {
width: 159px; height: 159px; border-radius: 50%;
}
   </style>
  
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
                <li><a href="#">Profile</a> <i class="icon-angle-right"></i></li>
                <li class="active">profile</li>
              </ul>
              
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      
      <div class="container">
        <div class="row">
          <div class="span8">
            <h4 class="title"><strong>Welcome ${loggedInUser.fname} !</strong> 
            <a  href="#" data-toggle="modal" data-target="#add-images" class="btn btn-danger">
				<c:if test="${not empty loggedInUser.image}">
				Change Photo 
				<i class="icon-camera"></i>
				<i class="fa fa-pencil"></i>
				</c:if>
				<c:if test="${empty loggedInUser.image}">
				Add Photo 
				<i class="icon-camera"></i>
				<i class="fa fa-plus"></i>
				</c:if>
				</a>
				</h4>

            <div id="sendmessage">${msg} </div>
            <div id="errormessage">${error}</div>
            
            <div class="tabs">
                  <ul class="nav nav-tabs bold">
                    <li class="active"><a href="#one" data-toggle="tab"><i class="icon-user"></i> Update Profile</a></li>
                    <li><a href="#two" data-toggle="tab"><i class="icon-briefcase"></i> My Contact Info</a></li>
                    <li><a href="#three" data-toggle="tab">Add Comment</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="one">
                    <form:form action="update" modelAttribute="loggedInUser" method="post" role="form" class="contactForm">
              
	                    <div class="span5 form-group">
	                    
						    <form:input type="hidden" path="id"/>
						    <form:input path="fname" placeholder="Enter First name"/>
						    <form:input path="lname" placeholder="Enter Last name" />
						    <form:input path="phone" placeholder="Enter phone" />
						    <form:input path="address" placeholder="Enter Address"/>
						    <form:input path="city" placeholder="Enter City" />    
						    <form:select class="span5 form-control lg" path="state" id="state" required="true">
			                    <c:choose>
				                      <c:when test="${empty loggedInUser.state}">
				                      <option value="">Select State</option>
				                      </c:when>
				                      <c:otherwise>
				                      <option value="${loggedInUser.state}">${loggedInUser.state}</option> 
				                      </c:otherwise>
			                     </c:choose>                                 
								<c:forEach items="${states}" var="state">
								<option value="${state}">${state.id}</option>
								</c:forEach>
							</form:select>
		
		                    <button class="btn btn-theme btn-medium margintop10" type="submit">Update</button>
	                   </div>
                	<h2> ${msg}</h2>
              
          		  </form:form>
                    </div>
                    <div class="tab-pane" id="two">
                     <h5 class="widgetheading">
                     ${loggedInUser.fname} ${loggedInUser.lname}
                     <c:if test="${not empty loggedInUser.image}">
					<img src="static/Eterna/img/users/${loggedInUser.id}/profile/${loggedInUser.image}" 
					alt="Profile Image" style="width: 50px; height: 45px; border-radius: 50%;">
					</c:if>
					                     </h5>
					<div class="span4">
                <ul class="contact-info">
                  <li><label>Address :</label> ${loggedInUser.address} <br>${loggedInUser.city} ${loggedInUser.state}<br /> </li>
                  <li><label>Phone :</label> ${loggedInUser.phone} </li>
                  <li><label>Email : </label>${loggedInUser.email}</li>
                </ul>
               </div>
               
             </div>
                    <div class="tab-pane" id="three">
                      <form action="" method="post" role="form" class="contactForm">
              <div class="row">
                
                <div class="span7 form-group">
                  <textarea name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                  <div class="validation"></div>
                  <div class="text-left">
                    <button class="btn btn-theme btn-medium margintop10" type="submit">Add </button>
                  </div>
                </div>
              </div>
            </form>
                    </div>
                  </div>
                </div>
             
            
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

		<div class="span3">
		<div class="text-center">
		<c:if test="${not empty loggedInUser.image}">
		<img src="static/Eterna/img/users/${loggedInUser.id}/profile/${loggedInUser.image}" 
		alt="Profile Image" style="width: 159px; height: 159px; border-radius: 50%;">
		    </c:if>
		                      
			<span class="text-danger text-center">${error}</span>  
		
		   </div>
		    </div>  
   
              <div class="widget">
                <h5 class="widgetheading">${loggedInUser.fname} ${loggedInUser.lname}<span></span></h5>

                <ul class="contact-info">
                  <li><label>Address :</label> ${loggedInUser.address} <br>${loggedInUser.city} ${loggedInUser.state}<br /> </li>
                  <li><label>Phone :</label> ${loggedInUser.phone} </li>
                  <li><label>Email : </label>${loggedInUser.email}</li>
                </ul>

              </div>
            </aside>
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

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/Eterna/js/custom.js"></script>
  <script type="text/javascript">
     function preview_image(event) 
     {
      var reader = new FileReader();
      reader.onload = function()
      {
       var output = document.getElementById('output_image');
       output.classList.add("preview");
       output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
     }
     </script>
     
        <div class="modal fade" id="add-images">
<div class="modal-dialog modal-lg">
<div class="modal-content">       
<!-- Modal Header -->
<div class="modal-header">
<h4 class="modal-title">Upload Picture</h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>         
<!-- Modal body -->
<div class="modal-body">
    
  <form method="POST" action="addimages" enctype="multipart/form-data">                  
     <img id="output_image" />
     <div class="control-group">
                    <div class="controls">
                     <input type="file" name="file" onchange="preview_image(event)">                              
<input type="hidden" name="id" value="${loggedInUser.id}">
                    </div>
                  </div>                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" >Upload</button>
                    </div>                    
                  </div>        
         </form>
                     </div>
</div>         
   <div class="modal-footer">
<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
</div>
    </div>
</div> 
</body>           

</html>

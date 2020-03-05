<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_index" value="active" />

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Users</title>
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
                <li class="active">Users</li>
              </ul>
              <h2>Users</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span3">

            <aside class="left-sidebar">
              <div class="widget">
             <spring:message code="welcome.message" />
              
              
              <form class="float-right" action="search" method="post">
                  <div class="input-append">
                    <input class="span2" type="text" name="name" placeholder="Search here">
                    <button class="btn btn-theme" type="submit">Search</button>
                  </div>
                </form>

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

          <div class="span9">
            <article>
              <div class="row">

                <div class="span9">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3>
                      <a href="#">Users</a>   
                      ${users.size()} ${msg} ${success}                   
           			  </h3>
                    </div>
                    <input type="text" id="searchnow" 
          			   placeholder=" Filter Names (${users.size()}) " 
          			   class="form-control"  >
                    <table class="table table-bordered">
						<tr class="text-success">
							<th>#</th>
							<th>Image <i class="icon-camera"></i></th>
							<th>Name</th>
							<th>Email</th>
							<th>Address</th>
							<th>Phone</th>
							<c:if test="${loggedInUser.role eq 'ADMIN' }">
							<th>Roles</th>
							<th>Edit</th>
							</c:if>
						</tr>
						<tbody>
							<c:forEach var="item" items="${users}" >
								<tr>
									<td>${users.indexOf(item)+1}</td>
									<td>
										<c:if test="${not empty item.image}">
											<img src="static/Eterna/img/users/${item.id}/profile/${item.image}" 
											alt="${item.fname} ${item.lname}" style="width: 50px; height: 45px; border-radius: 50%;">
										</c:if>
											<c:if test="${empty item.image}">
											<p>No Image</p>
										</c:if>
									</td>
									<td>${item.fname} ${item.lname}</td>
									<td>${item.email}</td>
									<td>${item.address} ${item.city}</td>
									<td>${item.phone}</td>
									<c:if test="${loggedInUser.role eq 'ADMIN' }">
									
									<td>
									   <form method="POST" action="editrole" >    
										<input type="hidden" name="id" value="${item.id}" />      
										<select onchange="this.form.submit()" name="role" class="form-control">
										<option value="${item.role}">${item.role}</option>
										<option value="USER">USER </option>
										<option value="DBA">DBA</option>
										<option value="ADMIN">ADMIN</option>  
										</select>
									   </form>
			               			 </td>
			                   		 <td>
			                	   	  	<a href="update?id=${item.id}" class="text-success"> <i class="icon-pencil"></i></a>
			                	   	  	<a href="delete?id=${item.id}" onclick="confirmed(); return false;" > <i class="icon-trash"></i></a>
			                   	 	 </td>
			                   	 	 </c:if>
								 
								</tr>
							</c:forEach>
						</tbody>
					 
					</table>
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
  <script>
    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
            } else {
               return false;
            }
         }

    
    $("#searchnow").keyup(function () {
        var value = this.value.toLowerCase().trim();

        $("table tr").each(function (index) {
            if (!index) return;
            $(this).find("td").each(function () {
                var id = $(this).text().toLowerCase().trim();
                var not_found = (id.indexOf(value) == -1);
                $(this).closest('tr').toggle(!not_found);
                return not_found;
            });
        });
    });
    </script>

</body>

</html>
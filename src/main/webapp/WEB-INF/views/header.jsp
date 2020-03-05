  
  <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
  
  
  
  
  
  
    <!-- start header -->
  <header>
      <div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
              <p class="topcontact"><i class="icon-phone"></i> +888777873</p>
            </div>
            <div class="span6">

              <ul class="social-network">
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-linkedin icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-pinterest  icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-google-plus icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Dribbble"><i class="icon-dribbble icon-white"></i></a></li>
              </ul>

            </div>
          </div>
        </div>
      </div>
      <div class="container">


        <div class="row nomargin">
          <div class="span4">
            <div class="logo">
              <a href="index"><img src="static/img/logo.png" alt="" /></a>
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li class="dropdown ${_index}">
                      <a href="index"><i class="icon-home"></i> Home <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                     	 <li><a href="users">Members</a></li>
                     	  <li><a href="#">Add Property</a></li>
                        <li><a href="#">Services</a></li>                        
                      </ul>
                    </li>                    
                    <li class="${_about}">
                      <a href="about">About-Us </a>
                    </li>
                    <li class="${_services}">
                      <a href="services">Services </a>
                    </li>
                    <li class="${_contact}">
                      <a href="contact">Contact </a>
                    </li>
					   <c:choose>
						   <c:when test="${empty loggedInUser}">
							   <li class="${_login}">
							   <a href="Login">Login</a>
							   </li>
							   <li class="${_register}">
							   <a href="Register">Register</a>
							   </li>
						   </c:when>
						   <c:otherwise>
							   <li>
							   <a href="profile">My Profile</a>
							   </li>
							   <li>
							   <a href="logout"> ${loggedInUser.email} | Logout</a>
							   </li>   
						   </c:otherwise>
					   </c:choose>
					                    
                    
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
    </header>    

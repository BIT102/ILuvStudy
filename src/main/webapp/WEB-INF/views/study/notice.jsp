﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>I Luv Study</title>
<!-- Bootstrap tag -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesom.css">


<!------ Include the above in your HEAD tag ---------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>\

@import url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700');
@import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.row-section{float:left; width:100%; background: #42275a;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #734b6d, #42275a);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #734b6d, #42275a); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
.row-section h2{float:left; width:100%; color:#fff; margin-bottom:30px; font-size: 14px;}
.row-section h2 span{font-family: 'Libre Baskerville', serif; display:block; font-size:45px; text-transform:none; margin-bottom:20px; margin-top:30px;font-weight:700;}
.row-section h2 a{color:#d2abce;}
.row-section .row-block{background:#fff; padding:20px; margin-bottom:50px;}
.row-section .row-block ul{margin:0; padding:0;}
.row-section .row-block ul li{list-style:none; margin-bottom:20px;}
.row-section .row-block ul li:last-child{margin-bottom:0;}
.row-section .row-block ul li:hover{cursor:grabbing;}
.row-section .row-block .media{border:1px solid #d5dbdd; padding:5px 20px; border-radius: 5px; box-shadow:0px 2px 1px rgba(0,0,0,0.04); background:#fff;}
.row-section .media .media-left img{width:75px;}
.row-section .media .media-body p{padding: 0 15px; font-size:14px;}
.row-section .media .media-body h4 {color: #6b456a; font-size: 18px; font-weight: 600; margin-bottom: 0; padding-left: 14px; margin-top:12px;}
.btn-default{background:#6B456A; color:#fff; border-radius:30px; border:none; font-size:16px;}


</style>
    
</head>
<body style="background:#262626;">

<%@include file="../nav.jsp"%>


<section class="row-section" style="background:#262626;">
    <div class="container">
	    <div class="row">
		    <h2 class="text-center"><span>공 지 사 항</span></h2>
	    </div>
	    <div class="col-md-10 offset-md-1 row-block">
	        <ul id="sortable">
	            <li><div class="media">
	            <div class="media-left align-self-center">
	                <img class="rounded-circle" src="https://randomuser.me/api/portraits/women/50.jpg">
	            </div>
	            <div class="media-body">
	                <h4>Camila Terry</h4>
	                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="#" class="btn btn-default">Contact Now</a>
	            </div>
	        </div></li>
	            <li><div class="media">
	            <div class="media-left align-self-center">
	                <img class="rounded-circle" src="https://randomuser.me/api/portraits/men/42.jpg">
	            </div>
	            <div class="media-body">
	                <h4>Joel Williamson</h4>
	                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="#" class="btn btn-default">Contact Now</a>
	            </div>
	        </div></li>
	            <li><div class="media">
	            <div class="media-left align-self-center">
	                <img class="rounded-circle" src="https://randomuser.me/api/portraits/women/67.jpg">
	            </div>
	            <div class="media-body">
	                <h4>Deann Payne</h4>
	                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="#" class="btn btn-default">Contact Now</a>
	            </div>
	        </div></li>
	            <li><div class="media">
	            <div class="media-left align-self-center">
	                <img class="rounded-circle" src="https://randomuser.me/api/portraits/women/50.jpg">
	            </div>
	            <div class="media-body">
	                <h4>Leona Hunter</h4>
	                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="#" class="btn btn-default">Contact Now</a>
	            </div>
	        </div></li>
	            <li><div class="media">
	            <div class="media-left align-self-center">
	                <img class="rounded-circle" src="https://randomuser.me/api/portraits/men/89.jpg">
	            </div>
	            <div class="media-body">
	                <h4>Donald Perkins</h4>
	                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="#" class="btn btn-default">Contact Now</a>
	            </div>
	        </div></li>
	        
	            
	        
	        </ul>
	    </div>
</div>
</section>
  <script>
  var activeEl = 5;
  $(function() {
      var items = $('.btn-nav');
      $( items[activeEl] ).addClass('active');
      $( ".btn-nav" ).click(function() {
          $( items[activeEl] ).removeClass('active');
          $( this ).addClass('active');
          activeEl = $( ".btn-nav" ).index( this );
      });
  });
  
  $( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  } );
  </script>
<script	  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>


</body>
</html>
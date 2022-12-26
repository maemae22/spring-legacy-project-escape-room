<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/owl.carousel.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/owl.theme.default.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/login_layer.css'>
    

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src='${pageContext.request.contextPath}/js/TweenMax.min.js'></script>
    <script src='${pageContext.request.contextPath}/js/owl.carousel.js'></script>
</head>
<body>
	<div id="wrapper">
        <div class="main_slider_wrap">
            <div id="main_slider" class="owl-carousel owl-theme slider">
               <div class="page">
                  <div class="page_ratio">
                     <div class="page_contents">
                        <div class="layer_element layer_element_1">
                           <img src="${pageContext.request.contextPath}/images/slider/main_slider_1.png" alt="" />
                        </div>
                     </div>
                  </div>
               </div>
         
               <div class="page">
                  <div class="page_ratio">
                     <div class="page_contents">
                        <div class="layer_element layer_element_1 page_2">
                           <div class="img_w_2560" style="background-image:url(${pageContext.request.contextPath}/images/slider/main_slider_2.png);">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
    </div>
<script>
    $('#main_slider').owlCarousel({
       items: 1,
       nav: true,
       dots:true,
       dotsEach:true, /* dots 항상 표시 */
 
       loop:true,
       singleItem: true,
 
       navText : ['<img src="${pageContext.request.contextPath}/images/slider/prev.png" alt="" />','<img src="${pageContext.request.contextPath}/images/slider/next.png" alt="" />'],
       mouseDrag:false
    });
 
 </script>
</body>
</html>
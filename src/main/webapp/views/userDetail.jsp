<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../commons/path.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户详情</title>
    <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="<%=path%>/css/style3.css" rel="stylesheet" type="text/css" media="all" />
    <!--web-fonts-->
    <link href='https://fonts.googleapis.com/css?family=Jura:400,300,500,600' rel='stylesheet' type='text/css'>
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/jquery.mmenu.all.css?v=5.4.4" />
    <!--//web-fonts-->
    <!-- js -->
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.mmenu.min.all.js?v=5.4.4"></script>
    <!-- //js -->
</head>
<body>
<!-- main -->
<div class="main">
    <!--login-profile-->
    <div class="login-form">
        <div class="banner">
            <div class="header-top">
                <ul>
                    <li></li>
                    <li> </li>
                    <li></li>
                </ul>
            </div>
            <div class="banner-text">
                <div class="menu">
                    <span class="menu-icon"><a href="#"><img src="<%=path%>/images/menu-icon.png" alt=""/></a></span>
                    <ul class="nav1">
                        <li><a href="customer">查询客户</a></li>
                        <li><a href="getWork?userId=${userDetail.id}">查询工单</a></li>
                        <%--<li><a href="#">Services</a></li>--%>
                    </ul>
                    <!-- script-for-menu -->
                    <script>
                        $( "span.menu-icon" ).click(function() {
                            $( "ul.nav1" ).slideToggle( 300, function() {
                                // Animation complete.
                            });
                        });
                    </script>
                    <!-- /script-for-menu -->
                </div>
                <div class="title">
                    <div class="title-left">
                        <c:if test="${not empty userDetail.avatar}">
                        <img src="${userDetail.avatar}" alt=""/>
                        </c:if>
                        <c:if test="${ empty userDetail.avatar}">
                            <img src="<%=path%>/images/img.jpg" alt=""/>
                        </c:if>
                    </div>
                    <div class="title-right">
                        <h2>${userDetail.name}</h2>
                        <h6>极能科技有限公司</h6>
                        <h6>${userDetail.position}</h6>
                    </div>
                    <div class="clear"> </div>
                </div>
            </div>
        </div>
        <div class="clear"> </div>
        <div class="banner-bottom">
            <div class="banner-bottom-left">
                <h3>${works.w1}</h3>
                <p>今日完成工单 </p>
            </div>
            <div class="banner-bottom-right">
                <h3>${works.w2}</h3>
                <p>本月完成工单</p>
            </div>
            <div class="banner-bottom-right">
                <h3>${works.w3}</h3>
                <p>上月月完成工单</p>
            </div>
            <div class="banner-bottom-left">
                <h3>${works.w4}</h3>
                <p>本月未完成工单 </p>
            </div>
            <div class="clear"> </div>
        </div>
        <div class="work-text">
            <h3>最近</h3>
            <section class="ac-container">
                <c:forEach items="${page}" var="w" varStatus="i">
                <div>
                    <input id="ac-${i.index}" name="accordion-${i.index}" type="checkbox" />
                    <label for="ac-${i.index}" class="grid${i.index}"><i><fmt:formatDate value="${w.createTime}" pattern="yyyy-MM-dd" /></i>${w.name}</label>
                    <article class="ac-small">
                        <p>${w.remark}</p>
                    </article>
                </div>
                </c:forEach>
 <%--               <div>
                    <input id="ac-2" name="accordion-1" type="checkbox" />
                    <label for="ac-2" class="grid2"><i></i>Design app illustrations</label>
                    <article class="ac-small">
                        <p>Lorem Ipsum is simply dummy text of the printing and industry.</p>
                    </article>
                </div>
                <div>
                    <input id="ac-3" name="accordion-1" type="checkbox" />
                    <label for="ac-3" class="grid3"><i></i>Javascript training</label>
                    <article class="ac-small">
                        <p>Lorem Ipsum is simply dummy text of the printing and industry.</p>
                    </article>
                </div>
                <div>
                    <input id="ac-4" name="accordion-1" type="checkbox" />
                    <label for="ac-4" class="grid4"><i></i>Surprise Party for Meet</label>
                    <article class="ac-small">
                        <p>Lorem Ipsum is simply dummy text of the printing and industry.</p>
                    </article>
                </div>--%>
            </section>
        </div>
    </div>

</div>

</body>
</html>

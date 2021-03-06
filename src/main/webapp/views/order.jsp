<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="/commons/path.jsp" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">

    <title><%=title%></title>

    <!--common-->
    <link href="<%=path%>/css/style.css" rel="stylesheet">
    <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
    <link href="<%=path%>/css/gm.css" rel="stylesheet">
    <link href="<%=path%>/css/grid.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/js/html5shiv.js"></script>
    <script src="<%=path%>/js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
  .timeDiff{
      float: right;
  }

</style>
<body class="sticky-header">

<section>


    <!-- main content start-->
    <div class="main-content">

        <!-- page heading start-->
        <div class="page-heading">

            <ul class="breadcrumb">
                <li>
                    <a href="#">工单</a>
                </li>
                <li class="active"> 工单查询</li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <div class="timeline">
                        <article class="timeline-item alt">
                            <div class="text-right">
                                <div class="time-show first">
                                    <a href="#" class="btn btn-primary">开始</a>
                                </div>
                            </div>
                        </article><jsp:useBean id="date" class="java.util.Date" />
                        <c:forEach items="${orders}" var="order" varStatus="vs">
                            <div class="timeDiff"><c:if test="${not empty order.timeDiff2}">路上用时<fmt:formatDate value="${Date(order.timeDiff2 - 8*3600000)}" pattern="H小时m分钟s秒" /></c:if></div>
                        <article class="timeline-item <c:if test="${vs.index%2==0 }">alt</c:if>">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow<c:if test="${vs.index%2==0 }">-alt</c:if>"></span>
                                        <span class="timeline-icon"></span>
                                        <span class="timeline-date"><fmt:formatDate value="${order.time1}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                        <p>${order.customerName}</p>
                                        <h1 class="red"><c:if test="${vs.index == 0}">出发时间</c:if><c:if test="${vs.index != 0}">到达时间</c:if>：<fmt:formatDate value="${order.time1}" pattern="yyyy-MM-dd HH:mm:ss" /></h1>

                                        <c:if test="${not empty order.time2}">
                                        <div style="height: 50px"><c:if test="${order.timeDiff ne 0}">用时<fmt:formatDate value="${Date(order.timeDiff - 8*3600000)}" pattern="H小时m分钟s秒" /></c:if></div>
                                        <span class="arrow<c:if test="${vs.index%2==0 }">-alt</c:if>"></span>
                                        <span class="timeline-icon"></span>
                                        <span class="timeline-date"><fmt:formatDate value="${order.time2}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
                                        <h1 class="red">离开时间：<fmt:formatDate value="${order.time2}" pattern="yyyy-MM-dd HH:mm:ss" /></h1>
                                        </c:if>
                                        <p>${order.remark}</p>

                                        <div class="album">
                                            <c:forEach items="${order.imgList}" var="img" >
                                                <a href="<%=context%>${img.img}" data-fancybox data-caption="''">
                                                    <img src="<%=context%>${img.img}" width="90px" height="100px" alt="" />'
                                                </a>
                                            </c:forEach>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </article>

                        </c:forEach>

                    </div>
                </div>
            </div>

        </div>
        <!--body wrapper end-->

    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="<%=path%>/js/jquery-1.10.2.min.js"></script>
<script src="<%=path%>/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path%>/js/jquery.validate.min.js"></script>
<script src="<%=path%>/js/jquery.stepy.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/modernizr.min.js"></script>
<script src="<%=path%>/js/jquery.nicescroll.js"></script>


<!--common scripts for all pages-->
<script src="<%=path%>/js/scripts.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>

</body>
</html>

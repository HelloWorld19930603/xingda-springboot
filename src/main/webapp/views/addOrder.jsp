<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/commons/path.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">




  <title><%=title%></title>

  <link href="<%=path%>/css/style.css" rel="stylesheet">
  <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
    <link href="<%=path%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=path%>/css/jquery.stepy.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="<%=path%>/js/html5shiv.js"></script>
  <script src="<%=path%>/js/respond.min.js"></script>
  <![endif]-->

</head>
<style>
    .button-next{
        display: none;
    }

</style>
<body class="sticky-header">

<section>

    <!-- main content start-->
    <div class="main-content" >
        <!-- page heading start-->
        <div class="page-heading">

            <ul class="breadcrumb">
                <li>
                    <a href="#">我的工单</a>
                </li>
                <li class="active">添加工单 </li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <div class="square-widget">
                        <div class="widget-container">
                            <div class="stepy-tab">
                            </div>
                            <form id="default" class="form-horizontal" onsubmit="javascript:confirm()">
                                <fieldset title="工单信息一">
                                    <legend></legend>
                                    <input type="hidden" value="${workId}" id="workId">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">客户名称</label>
                                        <div class="col-lg-6">
                                            <select class="col-md-2 col-sm-2 form-control m-bot15" id="name" placeholder="任务名称">
                                                <option value="1"></option>
                                            </select>
                                        </div>
                                        <div id="editable-sample_new" class="btn btn-primary" style="font-size: 12px;padding: 4px 10px;">
                                            新增 <i class="fa fa-plus"></i>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">所在位置</label>
                                        <div class="col-md-6 col-sm-6">
                                            <div id="allmap1" style="width: 400px;height: 200px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label span3"></label>
                                        <div class="col-md-6">
                                                <img  id="img" src="<%=path%>/images/default.png" width="100px" height="100px">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-md-2 control-label ">图片上传</label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input id="photoCover1" class="form-control" readonly type="text">
                                                <label class="input-group-btn">
                                                    <input id="file1" type="file" name="file" style="left: -9999px; position: absolute;">
                                                    <span class="btn btn-default">浏览</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>
                                <button class="btn btn-info finish" id = 'finished1'  type="button" style="float: left">
                                    结单 </button>

                                <button class="btn btn-info finish" id = 'finished2'  type="button">
                                    提交 </button>
                            </form>
                        </div>
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
<script src="<%=path%>//js/jquery.stepy.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/modernizr.min.js"></script>
<script src="<%=path%>/js/jquery.nicescroll.js"></script>

<script src="<%=path%>/js/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="<%=path%>/js/sweetalert/sweetalert2.min.css">
<!-- IE support -->
<script src="<%=path%>/js/sweetalert/es6-promise.min.js"></script>
<!--common scripts for all pages-->
<script src="<%=path%>/js/scripts.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=67jMQ5DmYTe1TLMBKFUTcZAR"></script>
</body>
</html>
<script type="text/javascript">



    //html5实现图片预览功能
    $(function () {

        getCustomer();
        $("#editable-sample_new").click(function () {

            swal({
                title: '录入客户信息',
                html:
                    '<input id="cname" class="swal2-input" autofocus placeholder="客户名称">' +
                    '<input id="phone" class="swal2-input" placeholder="客户电话">'+
                    '<input id="address" class="swal2-input" placeholder="客户地址">'+
                    '                                        <select class="col-md-2 col-sm-2 form-control m-bot15" id="type" >\n' +
                    '                                            <option value="1">公司</option><option value="2">个人</option>\n' +
                    '                                        </select>'+
                    '<input id="remark" class="swal2-input" placeholder="备注">',
                cancelButtonColor: '#d33',
                confirmButtonText: '确认',
                cancelButtonText:'取消',
                showCancelButton: true,
                preConfirm: function() {
                    return new Promise(function(resolve) {
                        resolve([
                            $('#cname').val(),
                            $('#phone').val(),
                            $('#address').val(),
                            $('#type').val(),
                            $('#remark').val()
                        ]);
                    });
                }
            }).then(function(result) {
                if (result) {

                    alert(result[0])
                }
            })
        });


        $("#file1").change(function (e) {
            var file = e.target.files[0] || e.dataTransfer.files[0];
            $('#photoCover').val(document.getElementById("file1").files[0].name);
            if (file) {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#img").attr("src", this.result);
                }

                reader.readAsDataURL(file);
            }
        });

        $("#finished1").click(function (e) {
            var file = document.getElementById("file1").files[0];
            var formData = new FormData();
            if(file){
                formData.append('file', file);
            }else{
                swal({
                    type: 'warning',
                    html: '请添加客户图片'
                });
                return;
            }
            var workId = $("#workId").val().trim();
            var remark = $("#remark").val().trim();
            var img = $("#img").val().trim();
            formData.append('workId', workId);
            formData.append('lat', y);
            formData.append('lon', x);
            formData.append('img', img);
            formData.append('remark', remark);
            formData.append('mark', 1);
            save(formData);
        });

        $("#finished2").click(function (e) {
            var file = document.getElementById("file1").files[0];
            var formData = new FormData();
            if(file){
                formData.append('file', file);
            }else{
                swal({
                    type: 'warning',
                    html: '请添加客户图片'
                });
                return;
            }
            var workId = $("#workId").val().trim();
            var remark = $("#remark").val().trim();
            var img = $("#img").val().trim();
            formData.append('workId', workId);
            formData.append('lat', y);
            formData.append('lon', x);
            formData.append('img', img);
            formData.append('remark', remark);
            formData.append('mark', 0);
            save(formData);
        });
    })
    //方式一 Jquery实现
    function save(formData) {
        $.ajax({
            url: "<%=context%>/genergy/addOrder",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            mimeType: "multipart/form-data",
            success: function (data) {
                if(data == 0){
                    swal({
                        type: 'success',
                        html: '提交成功'
                    });
                }else if(data >0){
                    $("#id").val(data);
                    swal({
                        type: 'success',
                        html: '提交成功'
                    });
                }else{
                    swal({
                        type: 'error',
                        html: '提交失败'
                    });
                }
                console.log(data);
            },
            error: function (data) {
                swal({
                    type: 'error',
                    html: '提交失败'
                });
                console.log(data);
            }
        });
    }

    // 百度地图API功能
    //GPS坐标
    var x ;
    var y ;
    getLocation();


    function map(x,y,map) {

        var ggPoint = new BMap.Point(x,y);
        //地图初始化
        var bm = new BMap.Map(map);
        bm.centerAndZoom(ggPoint, 15);
        bm.addControl(new BMap.NavigationControl());
        var marker = new BMap.Marker(ggPoint);
        bm.addOverlay(marker);
        bm.panTo(ggPoint);

    }

    function getLocation() {
        var geolocation = new BMap.Geolocation();
        geolocation.enableSDKLocation();
        geolocation.getCurrentPosition(function(r){
            if(this.getStatus() == BMAP_STATUS_SUCCESS){
                x = r.point.lng;
                y = r.point.lat;
                <c:if test="${not empty order.lon1 and not empty order.lat1 }">
                map(${order.lon1},${order.lat1},"allmap1");
                </c:if>
                <c:if test="${order.lon1 eq null and order.lat1 eq null}">
                map(x,y,"allmap1");
                </c:if>
                <c:if test="${not empty order.lon2  and not empty order.lat2 }">
                map(${order.lon2},${order.lat2},"allmap2");
                </c:if>
                <c:if test="${order.lon2 eq null and   order.lat2 eq null}">
                map(x,y,"allmap2");
                </c:if>
                <c:if test="${not empty  order.lon3  and not empty  order.lat3 }">
                map(${order.lon3},${order.lat3},"allmap3");
                </c:if>
                <c:if test="${order.lon3 eq null and order.lat3 eq null}">
                map(x,y,"allmap3");
                </c:if>
                <c:if test="${not empty  order.lon4  and not empty  order.lat4 }">
                map(${order.lon4},${order.lat4},"allmap4");
                </c:if>
                <c:if test="${order.lon4 eq null and order.lat4 eq null}">
                map(x,y,"allmap4");
                </c:if>
            }
            else {
                swal({
                    type:"warning",
                    html:"获取坐标失败"
                })
            }
        });
    }

    function getCustomer() {
        $.ajax({
            url: "<%=context%>/genergy/getCustomer",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                var typeSelect = document.querySelector('select[id="name"]');
                for(var k in data){
                    var option = document.createElement('option');
                    option.value = data[k].id;
                    option.innerText = data[k].name;
                    typeSelect.appendChild(option);
                }
            },
            error: function (data) {
                console.log(data);
            }
        });
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
                                    <input type="hidden" value="" id="id">
                                    <input type="hidden" value="${order.lon1}" id="lon1">
                                    <input type="hidden" value="${order.lat2}" id="lat1">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">客户名称</label>
                                        <div class="col-md-6 col-sm-6">
                                            <input type="text" id="customer" placeholder="客户名称" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">员工编号</label>
                                        <div class="col-md-6 col-sm-6">
                                            <input type="text" id="userId" placeholder="员工编号" class="form-control" value="">
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
                                            <img  id="img1" src="<%=path%>/images/default.png" width="100px" height="100px">
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
                                    <button class="btn btn-info finish" id = 'finished1'  type="button">
                                        提交 </button>
                                </fieldset>
                                <fieldset title="工单信息二" >
                                    <legend></legend>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">所在位置</label>
                                        <div class="col-md-6 col-sm-6">
                                            <div id="allmap2" style="width: 400px;height: 200px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label span3"></label>
                                        <div class="col-md-6">
                                            <img  id="img2" src="<%=path%>/images/default.png" width="100px" height="100px">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-md-2 control-label ">图片上传</label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input id="photoCover2" class="form-control" readonly type="text">
                                                <label class="input-group-btn">
                                                    <input id="file2" type="file" name="file" style="left: -9999px; position: absolute;">
                                                    <span class="btn btn-default">浏览</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-info finish" id = 'finished2'  type="button">
                                        提交 </button>
                                </fieldset>
                                <fieldset title="工单信息三">
                                    <legend></legend>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">所在位置</label>
                                        <div class="col-md-6 col-sm-6">
                                            <div id="allmap3" style="width: 400px;height: 200px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label span3"></label>
                                        <div class="col-md-6">
                                            <img  id="img3" src="<%=path%>/images/default.png" width="100px" height="100px">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-md-2 control-label ">图片上传</label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input id="photoCover3" class="form-control" readonly type="text">
                                                <label class="input-group-btn">
                                                    <input id="file3" type="file" name="file" style="left: -9999px; position: absolute;">
                                                    <span class="btn btn-default">浏览</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-info finish" id = 'finished3'  type="button">
                                        提交 </button>
                                </fieldset>
                                <fieldset title="工单信息四">
                                    <legend></legend>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">所在位置</label>
                                        <div class="col-md-6 col-sm-6">
                                            <div id="allmap4" style="width: 400px;height: 200px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label span3"></label>
                                        <div class="col-md-6">
                                            <img  id="img4" src="<%=path%>/images/default.png" width="100px" height="100px">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-md-2 control-label ">图片上传</label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input id="photoCover4" class="form-control" readonly type="text">
                                                <label class="input-group-btn">
                                                    <input id="file4" type="file" name="file" style="left: -9999px; position: absolute;">
                                                    <span class="btn btn-default">浏览</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <button class="btn btn-info finish" id = 'finished4'  type="button">
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

    /*=====STEPY WIZARD====*/
    $(function() {
        $('#default').stepy({
            backLabel: '上一步',
            block: true,
            nextLabel: '',
            titleClick: true,
            titleTarget: '.stepy-tab'
        });

    });
    /*=====STEPY WIZARD WITH VALIDATION====*/

    //html5实现图片预览功能
    $(function () {
        $("#file1").change(function (e) {
            var file = e.target.files[0] || e.dataTransfer.files[0];
            $('#photoCover').val(document.getElementById("file1").files[0].name);
            if (file) {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#img1").attr("src", this.result);
                }

                reader.readAsDataURL(file);
            }
        });
        $("#file2").change(function (e) {
            var file = e.target.files[0] || e.dataTransfer.files[0];
            $('#photoCover2').val(document.getElementById("file2").files[0].name);
            if (file) {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#img2").attr("src", this.result);
                }

                reader.readAsDataURL(file);
            }
        });
        $("#file3").change(function (e) {
            var file = e.target.files[0] || e.dataTransfer.files[0];
            $('#photoCover3').val(document.getElementById("file3").files[0].name);
            if (file) {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#img3").attr("src", this.result);
                }

                reader.readAsDataURL(file);
            }
        });
        $("#file4").change(function (e) {
            var file = e.target.files[0] || e.dataTransfer.files[0];
            $('#photoCover').val(document.getElementById("file4").files[0].name);
            if (file) {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#img4").attr("src", this.result);
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
            var customer = $("#customer").val().trim();
            var userId = $("#userId").val().trim();
            var id = $("#id").val().trim();
            var img1 = $("#img1").val().trim();
            formData.append('customer', customer);
            formData.append('userId', userId);
            formData.append('id', id);
            formData.append('lat1', y);
            formData.append('lon1', x);
            formData.append('img1', img1);
            formData.append('mark', 1);
            save(formData);
        });
        $("#finished2").click(function (e) {
            var file = document.getElementById("file2").files[0];
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
            var customer = $("#customer").val().trim();
            var userId = $("#userId").val().trim();
            var id = $("#id").val().trim();
            var img2 = $("#img2").val().trim();
            formData.append('customer', customer);
            formData.append('userId', userId);
            formData.append('id', id);
            formData.append('lat2', y);
            formData.append('lon2', x);
            formData.append('img2', img2);
            formData.append('mark', 2);
            save(formData);
        });
        $("#finished3").click(function (e) {
            var file = document.getElementById("file3").files[0];
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
            var customer = $("#customer").val().trim();
            var userId = $("#userId").val().trim();
            var id = $("#id").val().trim();
            var img3 = $("#img3").val().trim();
            formData.append('customer', customer);
            formData.append('userId', userId);
            formData.append('id', id);
            formData.append('lat3', y);
            formData.append('lon3', x);
            formData.append('img3', img3);
            formData.append('mark', 3);
            save(formData);
        });
        $("#finished4").click(function (e) {
            var file = document.getElementById("file4").files[0];
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
            var customer = $("#customer").val().trim();
            var userId = $("#userId").val().trim();
            var id = $("#id").val().trim();
            var img4 = $("#img4").val().trim();
            formData.append('customer', customer);
            formData.append('userId', userId);
            formData.append('id', id);
            formData.append('lat4', y);
            formData.append('lon4', x);
            formData.append('img4', img4);
            formData.append('mark', 4);
            save(formData);
        });
    })
    //方式一 Jquery实现
    function save(formData) {
        $.ajax({
            url: "<%=context%>/genergy/addWorkOrder",
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


    function map(map) {

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
                map("allmap1");
                map("allmap2");
                map("allmap3");
                map("allmap4");
            }
            else {
                swal({
                    type:"warning",
                    html:"获取坐标失败"
                })
            }
        });
    }

</script>
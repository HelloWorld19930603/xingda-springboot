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
                    <a href="#">我的任务</a>
                </li>
                <li class="active">新建任务 </li>
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
                                <fieldset title="新建任务">
                                    <legend></legend>
                                    <input type="hidden" value="" id="id">
                                    <input type="hidden" value="${order.lon1}" id="lon1">
                                    <input type="hidden" value="${order.lat2}" id="lat1">
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
                                        <label class="col-md-2 col-sm-2 control-label">任务说明</label>
                                        <div class="col-md-6 col-sm-6">
                                            <input type="text" id="remark" placeholder="任务说明" class="form-control" >
                                        </div>
                                    </div>
                                </fieldset>


                                <button class="btn btn-info finish" id = 'finished'  type="button">
                                    创建任务</button>
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
<script src="//g.alicdn.com/dingding/dingtalk-jsapi/2.0.57/dingtalk.open.js"></script>
</body>
</html>
<script type="text/javascript">

    //html5实现图片预览功能
    $(function () {

        $("#finished").click(function (e) {
            var formData = new FormData();

            var name = $("#name").val().trim();
            var remark = $("#remark").val().trim();
            formData.append('name', name);
            formData.append('remark', remark);
            formData.append('code', code);
            save(formData);
        });

        getCustomer();

        $("#editable-sample_new").click(function () {

            swal({
                title: '录入客户信息',
                html:
                    '<input id="name" class="swal2-input" autofocus placeholder="客户名称">' +
                    '<input id="phone" class="swal2-input" placeholder="客户电话">'+
                    '<input id="address" class="swal2-input" placeholder="客户地址">'+
                    '                                        <select class="col-md-2 col-sm-2 form-control m-bot15" id="type" >\n' +
                    '                                            <option value="1">公司</option><option value="2">个人</option>\n' +
                    '                                        </select>'+
                    '<input id="remark" class="swal2-input" placeholder="备注">',
                preConfirm: function() {
                    return new Promise(function(resolve) {
                            resolve([
                                $('#name').val(),
                                $('#phone').val(),
                                $('#address').val(),
                                $('#type').val(),
                                $('#remark').val()
                            ]);
                    });
                }
            }).then(function(result) {
                if (result) {
                    swal(JSON.stringify(result));
                }
            })
        });
    })
    //方式一 Jquery实现
    function save(formData) {
        $.ajax({
            url: "<%=context%>/genergy/addWork",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if(data == 0){
                    swal({
                        type: 'success',
                        html: '提交成功'
                    });
                }else if(data >0){
                    swal({
                        title: '你确定吗?',
                        type: 'info',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: '马上去签到',
                        cancelButtonText:'稍后再去'
                    }).then(function(isConfirm) {
                        if (isConfirm) {
                            window.location.href = "<%=context%>/genergy/addOrder?workId="+data;
                        }
                    })
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

    function getCustomer(formData) {
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

    var code;
    dd.ready(function() {
        dd.runtime.permission.requestAuthCode({
            corpId: "ding3b3dcea5f0fbedba35c2f4657eb6378f", // 企业id
            onSuccess: function (info) {
                code = info.code // 通过该免登授权码可以获取用户身份
            }});
    });
</script>
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
    *{margin:0;paddign:0;font-family:"微软雅黑";font-style:normal;font-size:14px;outline: 0;}
    .dropdown{position: relative;display:inline-block;width: 100%;padding-left:10px; }
    .dropdown-selected{width: 100%!important;height:30px;line-height:30px;border:1px solid #c6c8cc;-webkit-border-radius: 4px;-moz-border-radius: 4px;border-radius: 4px;color:#333;text-indent: 10px;margin-bottom: 0!important;}
    .dropdown ul{padding:0;width:100%;max-height:200px;overflow-y:auto ;background-color:#fff;margin-top:2px;border:1px solid #c6c8cc;position:absolute;display:none;z-index: 2;}
    .dropdown ul li{list-style: none;text-indent:10px;}
    .dropdown ul li a{display:block;color:#282c33;text-decoration:none;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;}
    .dropdown ul li:hover{background-color:#f2f6fa;}
    .dropdown ul li a:active,.dropdown ul li.active a{background-color: #e4e9f2;
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
                                        <div class="col-lg-6" style="position:relative" >
                                            <div class="dropdown" id="search" onclick="search.changeValue(this);search.searchKeyword()">
                                                <input type="text" class="dropdown-selected"
                                                       id="search-input" placeholder="请输入关键字" onkeyup="search.searchKeyword();">
                                                <ul id="list">
                                                    <li><a href="javaScript:">网页设计</a></li>
                                                    <li><a href="javaScript:">UI设计和WEB前端开发员</a></li>
                                                    <li><a href="javaScript:">web前端开发工程师</a></li>
                                                    <li><a href="javaScript:">Javascript</a></li>
                                                    <li><a href="javaScript:">Html/Html5/Xml</a></li>
                                                    <li><a href="javaScript:">Css/Css3</a></li>
                                                    <li><a href="javaScript:">Bootstrap</a></li>
                                                    <li><a href="javaScript:">angularJS</a></li>
                                                    <li><a href="javaScript:">java开发工程师</a></li>
                                                    <li><a href="javaScript:">HTML5页面开发</a></li>
                                                    <li><a href="javaScript:">ios开发</a></li>
                                                </ul>
                                            </div>
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
                var formData = new FormData();
                formData.append('name', result[0]);
                formData.append('phone', result[1]);
                formData.append('address', result[2]);
                formData.append('type', result[3]);
                formData.append('remark', result[4]);
                $.ajax({
                    url: "<%=context%>/genergy/addCustomer",
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
                            getCustomer(name);
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
            var customerName = $("#search-input").val().trim();
            var img = $("#img").val().trim();
            formData.append('workId', workId);
            formData.append('lat', y);
            formData.append('lon', x);
            formData.append('img', img);
            formData.append('remark', remark);
            formData.append('customerName', customerName);
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
  //  getLocation();


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
            }
            else {
                swal({
                    type:"warning",
                    html:"获取坐标失败"
                })
            }
        });
    }

    function getCustomer(name) {
        $.ajax({
            url: "<%=context%>/genergy/getCustomer",
            type: "POST",
            data: "name="+name,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
                var result = '';
                for(var k in data){
                    result += "<li><a href=\"javaScript:\">"+data[k].name+"</a></li>"
                }
                $("#list").html(result);
            },
            error: function (data) {
                console.log(data);
            }
        });
    }

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(locationSuccess, locationError,{
            // 指示浏览器获取高精度的位置，默认为false
            enableHighAcuracy: true,
            // 指定获取地理位置的超时时间，默认不限时，单位为毫秒
            timeout: 5000,
            // 最长有效期，在重复获取地理位置时，此参数指定多久再次获取位置。
            maximumAge: 3000
        });
    }else{
        alert("Your browser does not support Geolocation!");
    }

    function locationError(error){
        switch(error.code) {
/*            case error.TIMEOUT:
                alert("A timeout occured! Please try again!");
                break;
            case error.POSITION_UNAVAILABLE:
                alert('We can\'t detect your location. Sorry!');
                break;
            case error.PERMISSION_DENIED:
                alert('Please allow geolocation access for this to work.');
                break;
            case error.UNKNOWN_ERROR:
                alert('An unknown error occured!');
                break;*/
        }
    }


    function locationSuccess(position){
        var coords = position.coords;
        map(coords.longitude,coords.latitude,"allmap1")

    }

    var search = {
        searchKeyword: function () {
            var nWord = $("#search-input").val();
            //var temarray = nWord.split(""); //分割
            var array=this.unique(nWord.split(""));
            var dsa = $("#search").find("ul li a");//获取全部列表
            var linumber = 0;

            $("#search ul li").show();
            for (var t = 0; t < dsa.length; t++) {
                $(dsa[t]).html($(dsa[t]).text());
                var temstr = ($(dsa[t]).text()).split("");
                var yes = false;
                for (var i = 0; i < array.length; i++) {
                    var posarr = this.findAll(temstr, array[i]);
                    if (posarr.length > 0) {
                        yes = true;
                        for (var j = 0; j < posarr.length; j++) {
                            temstr[posarr[j]] = "<em style='color:red;'>" + temstr[posarr[j]] + "</em>";
                        }
                    }
                }
                if (!yes) {
                    $(dsa[t]).closest("li").hide();
                }
                else {
                    linumber++;
                    var htmlstr = "";
                    for (var m = 0; m < temstr.length; m++) {
                        htmlstr += temstr[m];
                    }
                    $(dsa[t]).html(htmlstr);
                }

            }
            if (linumber == 0) {
                $("#search ul li").show();
                $("#search ul").slideDown(200);
            }
        },
        findAll: function (arr, str) {
            var results = [],
                len = arr.length,
                pos = 0;
            while (pos < len) {
                pos = arr.indexOf(str, pos);
                if (pos === -1) {
                    break;
                }
                results.push(pos);
                pos++;
            }
            return results;
        },
        unique: function (arr) {
            var new_arr = [];
            for (var i = 0; i < arr.length; i++) {
                var items = arr[i];
                //判断元素是否存在于new_arr中，如果不存在则插入到new_arr的最后
                if ($.inArray(items, new_arr) == -1) {
                    new_arr.push(items);
                }
            }
            return new_arr;
        },
        changeValue: function (obj) {
            $('.dropdown ul').slideUp(200);
            var input = $(obj).find('.dropdown-selected');
            var ul = $(obj).find('ul');
            if (!ul.is(':visible')) {
                ul.slideDown('fast');
            } else {
                ul.slideUp('fast');
            }

            $(obj).find('ul a').click(function () {
                input.val($(this).text());
                $(this).parent().addClass('active');
                $(this).parent().siblings().removeClass('active')
                $(this).closest('ul').slideUp(200);
                return false;
            })
            var e = this.getEvent();
            window.event ? e.cancelBubble = true : e.stopPropagation();
        },
        _init: function () {
            $("#search").on("click", "ul li a", function () {
                $("#search-input").val($(this).text());
                $(this).parent().addClass('active');
                $(this).parent().siblings().removeClass('active')
                $(this).closest('ul').slideUp(200);
                return false;
            })
        },
        getEvent: function(){
            if(window.event){
                return window.event;
            }
            var f = arguments.callee.caller;
            do{
                var e = f.arguments[0];
                if(e && (e.constructor === Event || e.constructor===MouseEvent || e.constructor===KeyboardEvent)){
                    return e;
                }
            }while(f=f.caller);
        }

    }

    search._init();
</script>
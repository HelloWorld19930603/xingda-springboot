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
    <link href="<%=path%>/css/common.css" type="text/css" rel="stylesheet"/>
    <link href="<%=path%>/css/index.css" type="text/css" rel="stylesheet"/>
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
    .dropdown-selected{width: 80%!important;height:30px;line-height:30px;border:1px solid #c6c8cc;-webkit-border-radius: 4px;-moz-border-radius: 4px;border-radius: 4px;color:#333;text-indent: 10px;}
    .dropdown ul{padding:0;width:100%;max-height:200px;overflow-y:auto ;background-color:#fff;margin-top:2px;border:1px solid #c6c8cc;position:absolute;display:none;z-index: 2;}
    .dropdown ul li{list-style: none;text-indent:10px;}
    .dropdown ul li a{display:block;color:#282c33;text-decoration:none;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;}
    .dropdown ul li:hover{background-color:#f2f6fa;}
    .dropdown ul li a:active,.dropdown ul li.active a{background-color: #e4e9f2;
    }
    input{
        margin-top: 10px;
        margin-bottom: 10px
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
                                            <div class="dropdown" id="search" >
                                                <input type="text" class="dropdown-selected" style="margin-top: 10px;margin-bottom: 10px"
                                                       id="search-input" value="${order.customerName} ">
                                                <ul id="list">

                                                </ul>
                                            </div>
                                            <div id="editable-sample_new" class="btn btn-primary" style="font-size: 12px;padding: 4px 15px; margin-left: 10px;">
                                                新增 <i class="fa fa-plus"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="com" class="control-label col-lg-2">客户进展</label>
                                        <div class="col-lg-5">
                                            <select class="form-control m-bot14" name="com" id="com" >
                                                <option value="">请选择</option>
                                                <option value="1">建立关系</option>
                                                <option value="2">合同签订</option>
                                                <option value="3">收取货款</option>
                                                <option value="4">客户回访</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="remark" class="control-label col-lg-3">备注</label>
                                        <div class="col-lg-4">
                                            <input class="form-control " id="remark" name="remark" type="text" value="${order.remark}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-2 control-label">所在位置</label>
                                        <div class="col-md-6 col-sm-6">
                                            <div id="allmap" style="width: 400px;height: 200px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <div class="img-box full">
                                                <section class=" img-section">
                                                    <p class="up-p">客戶图片：<span class="up-span">最多可以上传5张图片，马上上传</span></p>
                                                    <div class="z_photo upimg-div clear" >
                                                        <!--<section class="up-section fl">
                                                                <span class="up-span"></span>
                                                                <img src="/img/buyerCenter/a7.png" class="close-upimg">
                                                                <img src="/img/buyerCenter/3c.png" class="type-upimg" alt="添加标签">
                                                                <img src="/img/test2.jpg" class="up-img">
                                                                <p class="img-namep"></p>
                                                                <input id="taglocation" name="taglocation" value="" type="hidden">
                                                                <input id="tags" name="tags" value="" type="hidden">
                                                            </section>-->
                                                        <section class="z_file fl">
                                                            <img src="<%=path%>/images/a11.png" class="add-img">
                                                            <input type="file" name="file" id="file" class="file"  accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
                                                        </section>
                                                    </div>
                                                </section>
                                            </div>
<%--                                            <aside class="mask works-mask">
                                                <div class="mask-content">
                                                    <p class="del-p">您确定要删除作品图片吗？</p>
                                                    <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
                                                </div>
                                            </aside>--%>

                                            <input type="hidden" name="imgUpload" id="imgUpload"  />
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
<script src="<%=path%>/js/imgUp.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=LDRtZV2K4KlZKkSHCYcCprjb3Z3G52zh"></script>
<script src="//g.alicdn.com/dingding/dingtalk-jsapi/2.0.57/dingtalk.open.js"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>

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

        $("#finished1").click(function (e) {
            var formData = new FormData();
            var images= $("#imgUpload").val();
            if(images == null || images.length == 0){
                swal({
                    type: 'warning',
                    html: '请添加客户图片'
                });
                return;
            }else{
                formData.append('images', images);
            }
            var workId = $("#workId").val().trim();
            var remark = $("#remark").val().trim();
            formData.append('workId', workId);
            formData.append('lat2', y);
            formData.append('lon2', x);
            formData.append('remark', remark);
            save(formData);
        });

        $("#finished2").click(function (e) {
            var formData = new FormData();
            var images= $("#imgUpload").val();
            if(images == null || images.length == 0){
                swal({
                    type: 'warning',
                    html: '请添加客户图片'
                });
                return;
            }else{
                formData.append('images', images);
            }
            var workId = $("#workId").val().trim();
            var remark = $("#remark").val().trim();
            var customerName = $("#search-input").val().trim();
            formData.append('workId', workId);
            formData.append('lat2', y);
            formData.append('lon2', x);
            formData.append('remark', remark);
            formData.append('customerName', customerName);
            save(formData);
        });
    })
    //方式一 Jquery实现
    function save(formData) {
        $.ajax({
            url: "<%=context%>/genergy/addOrder2",
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

    <c:if test="${not empty x}">
    var x = ${x};
    var y = ${y};
    </c:if>
    <c:if test="${ empty x}">
    var x = 0;
    var y = 0;
    </c:if>
    map(x,y,"allmap");
    function map(x,y,map) {

        var ggPoint = new BMap.Point(x,y);
        //地图初始化
        var bm = new BMap.Map(map);
        BMap.Convertor.translate(ggPoint, 0, function (point) {
            var geoc = new BMap.Geocoder();
            geoc.getLocation(point, function (rs) {

                bm.addControl(new BMap.NavigationControl());
                bm.addControl(new BMap.ScaleControl());
                bm.addControl(new BMap.OverviewMapControl());
                bm.centerAndZoom(point, 18);
                bm.addOverlay(new BMap.Marker(point)) ;

              //  var addComp = rs.addressComponents;
            });
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

    dd.config({
        agentId: '${config.agentId}', // 必填，微应用ID
        corpId: '${config.corpId}',//必填，企业ID
        timeStamp: ${config.timeStamp}, // 必填，生成签名的时间戳
        nonceStr: '${config.nonceStr}', // 必填，生成签名的随机串
        signature: '${config.signature}', // 必填，签名
        type:0,   //选填。0表示微应用的jsapi,1表示服务窗的jsapi；不填默认为0。该参数从dingtalk.js的0.8.3版本开始支持
        jsApiList : [
            'runtime.info',
            'biz.contact.choose',
            'device.notification.confirm',
            'device.notification.alert',
            'device.notification.prompt',
            'biz.ding.post',
            'device.geolocation.get'
        ] // 必填，需要使用的jsapi列表，注意：不要带dd。
    });
    var code;
    dd.ready(function() {
        dd.runtime.permission.requestAuthCode({
            corpId: "ding3b3dcea5f0fbedba35c2f4657eb6378f", // 企业id
            onSuccess: function (info) {
                code = info.code // 通过该免登授权码可以获取用户身份
                alert(code);
            }});
        dd.device.geolocation.get({
            targetAccuracy : 200,
            coordinate : 0,
            withReGeocode : false,
            useCache:true, //默认是true，如果需要频繁获取地理位置，请设置false
            onSuccess : function(result) {
                alert(1231)
                alert(obj2string(result));
                alert(result.longitude + "," + result.latitude);
                map(result.longitude,result.latitude,"allmap");
                /* 高德坐标 result 结构
                {
                    longitude : Number,
                    latitude : Number,
                    accuracy : Number,
                    address : String,
                    province : String,
                    city : String,
                    district : String,
                    road : String,
                    netType : String,
                    operatorType : String,
                    errorMessage : String,
                    errorCode : Number,
                    isWifiEnabled : Boolean,
                    isGpsEnabled : Boolean,
                    isFromMock : Boolean,
                    provider : wifi|lbs|gps,
                    accuracy : Number,
                    isMobileEnabled : Boolean
                }
                */
            },
            onFail : function(err) {
                alert(obj2string(err))
            }
        });

    });

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
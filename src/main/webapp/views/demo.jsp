<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="../commons/path.jsp" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/css/style.css" rel="stylesheet">
    <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/css/datepicker.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/js/html5shiv.js"></script>
    <script src="<%=path%>/js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .btn-block{
        height:120px;
        pading:40px;
        margin-bottom: 20px;
    }
</style>
<body>
<button type="button" class="btn btn-primary btn-lg btn-block" id="bt1">获取code</button>
<button type="button" class="btn btn-primary btn-lg btn-block" id="bt2">获取key</button>
<button type="button" class="btn btn-primary btn-lg btn-block" id="bt3">获取userId</button>
<button type="button" class="btn btn-primary btn-lg btn-block" id="bt4">获取user</button>
<button type="button" class="btn btn-primary btn-lg btn-block" id="bt5">获取位置</button>
<div id="allmap" style="width: 400px;height: 200px;"></div>
</body>

</html>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="<%=path%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=path%>/js/jquery-ui-1.9.2.custom.min.js"></script>

<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/modernizr.min.js"></script>
<script src="<%=path%>/js/jquery.nicescroll.js"></script>

<script src="<%=path%>/js/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="<%=path%>/js/sweetalert/sweetalert2.min.css">
<!-- IE support -->
<script src="<%=path%>/js/sweetalert/es6-promise.min.js"></script>


<script src="<%=path%>/js/date/moment.min.js"></script>

<script src="<%=path%>/js/date/datepicker.all.js"></script>

<script src="//g.alicdn.com/dingding/dingtalk-jsapi/2.0.57/dingtalk.open.js"></script>

<script src="<%=path%>/js/scripts.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=LDRtZV2K4KlZKkSHCYcCprjb3Z3G52zh"></script>
<script>
    var code;

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
    dd.ready(function() {
        dd.runtime.permission.requestAuthCode({
            corpId: "ding3b3dcea5f0fbedba35c2f4657eb6378f", // 企业id
            onSuccess: function (info) {
                code = info.code // 通过该免登授权码可以获取用户身份
            }});

        dd.device.geolocation.get({
            targetAccuracy : 200,
            coordinate : 0,
            withReGeocode : false,
            useCache:true, //默认是true，如果需要频繁获取地理位置，请设置false
            onSuccess : function(result) {
                alert("onSuccess " + result)
                alert(obj2string(result))
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
                r = result;
            },
            onFail : function(err) {
                alert("err " +result)
                alert(obj2string(err))
            }
        });

    });

    $("#bt1").click(function () {
        alert("code = "+code);
    });

    var token;
    $("#bt2").click(function () {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "<%=context%>/getAccessToken",//url
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                alert(result.token);
                token = result.token;
            },
            error: function (data) {
                alert(data);
                swal({
                    type: 'warning',
                    html: '服务器错误！ '
                });
            }
        })
    });

    var userId;
    $("#bt3").click(function () {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "<%=context%>/getUserId",//url
            data: "code="+code,
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                alert(result.userId);
                userId = result.userId;
            },
            error: function (data) {
                alert(data);
                swal({
                    type: 'warning',
                    html: '服务器错误！ '
                });
            }
        })
    });

    $("#bt4").click(function () {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "<%=context%>/getUser?code="+code,//url
            success: function (result) {
                console.log(result);//打印服务端返回的数据(调试用)
                alert(result.userDetail);
            },
            error: function (data) {
                alert(data);
                swal({
                    type: 'warning',
                    html: '服务器错误！ '
                });
            }
        })
    });
    $("#bt5").click(function () {
        alert("result = "+r);
    });


    var r = 123;



    /*if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(locationSuccess, locationError,{
            // 指示浏览器获取高精度的位置，默认为false
            enableHighAcuracy: true,
            // 指定获取地理位置的超时时间，默认不限时，单位为毫秒
            timeout: 10000,
            // 最长有效期，在重复获取地理位置时，此参数指定多久再次获取位置。
            maximumAge: 3000
        });
    }else{
        alert("Your browser does not support Geolocation!");
    }

    function locationError(error){
        switch(error.code) {
            case error.TIMEOUT:
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
                break;
        }
    }


    function locationSuccess(position){
        var coords = position.coords;
        alert(coords.latitude+" , "+coords.longitude)

    }*/

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
</script>
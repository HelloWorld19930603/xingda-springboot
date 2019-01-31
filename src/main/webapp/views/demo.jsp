<%--
  Created by IntelliJ IDEA.
  User: 78426
  Date: 2019/1/29
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p id="demo">点击这个按钮，获得您的坐标：</p>
<button onclick="getLocation()">试一下</button>
</body>

<script>
    var x=document.getElementById("demo");
    function getLocation(){
        if (navigator.geolocation){
            navigator.geolocation.getCurrentPosition(function (position) {
                x = position.coords.latitude;
                y = position.coords.longitude;
                alert(x+","+y)
            });
        }else{
            swal({
                type: 'warning',
                html: '游览器不支持获取经纬度'
            });
        }
    }
    function showPosition(position){
        x.innerHTML="Latitude: " + position.coords.latitude + "<br />Longitude: " + position.coords.longitude;
    }
</script>
</html>

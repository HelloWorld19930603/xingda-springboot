<%--
  Created by IntelliJ IDEA.
  User: 78426
  Date: 2019/1/10
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="//g.alicdn.com/dingding/dingtalk-jsapi/2.0.57/dingtalk.open.js"></script>
<script type="text/javascript">

    var code= null;
    dd.ready(function() {
        dd.runtime.permission.requestAuthCode({
            corpId: "ding3b3dcea5f0fbedba35c2f4657eb6378f", // 企业id
            onSuccess: function (info) {
                code = info.code // 通过该免登授权码可以获取用户身份
                alert("the cod is "+code);
            }});
    });

      window.location="genergy/getWork?code="+code;

</script>

</body>
</html>

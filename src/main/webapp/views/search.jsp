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
  <link rel="shortcut icon" href="<%=path%>/static/favicon.ico" />

  <link rel="bookmark"href="<%=path%>/static/favicon.ico" />
  <link href="<%=path%>/css/style.css" rel="stylesheet">
  <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/js/html5shiv.js"></script>
    <script src="<%=path%>/js/respond.min.js"></script>
    <![endif]-->
  <style>
    .bantxt {
      width: 80%;
      height: 60px;
      opacity: 1;
      border-radius: 5px;
      border: 0px;
      padding-left: 50px;
      color: #000;
      padding-right: 20px;
      outline: none;
    }
    .banbutt {
      height: 60px;
      width: 173px;
      background-color: #ec4d1c;
      border: 0px;
      color: #fff;
      transition: all .7s ease 0s;
      font-size: 15px;
      display: inline-block;
      padding: 6px 12px;
      margin-bottom: 0;
      font-size: 14px;
      font-weight: 400;
      line-height: 1.42857143;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      -ms-touch-action: manipulation;
      touch-action: manipulation;
      cursor: pointer;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      background-image: none;
      border: 1px solid transparent;
      border-radius: 4px;
      position: absolute;
      right: 0px;
      border-width: 0px;
      outline: none;
      border-top-left-radius: 0px;
      border-bottom-left-radius: 0px;
    }


    .seoicn {
      position: absolute;
      left: 31px;
      bottom: -8px;
      color: #b0bec5;
      font-size: 18px;
    }

    .banseo {
      width: 506px;
      height: 34px;
      left: 0;
      right: 0;
      margin: auto;
      position: absolute;
      top: 56px;

      font-size: 14px;
      line-height: 1.42857143;
      color: #333;

      margin-top: 10%;
    }

     input,button:focus{
             outline: none;
        }
  </style>
</head>

<body class="sticky-header" >

<section>

  <!-- main content start-->
  <div style="margin: auto;background: #eff0f4;padding-top: 0px;" >

    <!-- page heading start-->
    <div class="page-heading">
      <ul class="breadcrumb">
        <li>
          <a href="#">兴达运维管理</a>
        </li>
        <li class="active"> 查询请购设备/材料信息 </li>
      </ul>
        <div class="btn-group" style="float:right;">
            <button id="editable-sample_new" class="btn btn-primary" style="font-size: 12px;padding: 4px 10px;">
                录入 <i class="fa fa-plus"></i>
            </button>
          <button id="editable-sample_new2" class="btn btn-primary" style="font-size: 12px;padding: 4px 10px;">
            查询工单 <i class="fa fa-plus"></i>
          </button>
        </div>
    </div>
    <!-- page heading end-->

    <!--body wrapper start-->
    <div class="wrapper">
      <div class="row">
        <div class="col-lg-12 banseo">

          <input type="text" class="bantxt" id="searchtxt" placeholder="输入负责人/项目名/产品名" >
          <button class="btn banbutt" type="button" id="seobut" style="background: linear-gradient(45deg,#aabedc,#f19f9f);outline: snow"><i class="fa fa-chevron-circle-right"></i> 查询一下</button>
          <span class="seoicn" style="color: rgb(176, 190, 197); transition: all 1.5s ease 0s;"><i class="fa fa-search"></i></span>
        </div>
      </div>
    </div>
    <!--body wrapper end-->

  </div>
  <!-- main content end-->
</section>

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
</body>
</html>

<script type="text/javascript">


  (function () {

    $("#seobut").click(function(){

      var mark = $("#searchtxt").val();

      $.ajax({
        //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "<%=context%>/output",//url
        data: "mark=" + mark,
        success: function (result) {
          console.log(result);//打印服务端返回的数据(调试用)
          if (result == 0){
            swal({
              type: 'warning',
              html: '抱歉，未查询到相关记录 '
            });
          }else {
              window.location.href = "<%=context%>/output?mark="+mark;
          }
        },
        error: function (data) {
          swal({
            type: 'warning',
            html: '服务器错误！ '
          });
        }
      });
    });


      $("#editable-sample_new").click(function () {
          window.location.href = "<%=context%>/input";
      })
    $("#editable-sample_new2").click(function () {
      window.location.href = "<%=context%>/genergy/getWorkOrder";
    })
  })();



</script>
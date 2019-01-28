<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
</head>

<body class="sticky-header" >

<section>

  <!-- main content start-->
  <div class="main-content" >

    <!-- page heading start-->
    <div class="page-heading">
      <ul class="breadcrumb">
        <li>
          <a href="#">兴达运维管理</a>
        </li>
        <li class="active"> 请购设备/材料管理 </li>
      </ul>
    </div>
    <!-- page heading end-->

    <!--body wrapper start-->
    <div class="wrapper" style="padding-bottom: 0">
      <div class="row">
        <div class="col-lg-12">
          <section class="panel">
            <header class="panel-heading">
              请购设备/材料信息
            </header>
            <div class="panel-body">
              <div class="form" >
                <form class="cmxform form-horizontal adminex-form" >
                  <div class="form-group ">
                    <label for="date" class="control-label col-lg-3">请购日期</label>
                    <div class="col-lg-5">
                      <input class=" form-control" id="date" name="date" type="text" value="<fmt:formatDate value="${info.date}" pattern="yyyy-MM-dd" />"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="project" class="control-label col-lg-3">项目名称</label>
                    <div class="col-lg-5">
                      <input class=" form-control" id="project" name="project" type="text" value="${info.project}"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="name" class="control-label col-lg-3">负责人</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="name" name="name" type="text" value="${info.name}"/>
                    </div>
                  </div>
                  <div class="form-group ">
                  <label for="product" class="control-label col-lg-3">产品名称</label>
                  <div class="col-lg-5">
                    <input class="form-control " id="product" name="product" type="text" value="${info.product}"/>
                  </div>
                </div>                  <div class="form-group ">
                  <label for="type" class="control-label col-lg-3">型号</label>
                  <div class="col-lg-5">
                    <input class="form-control " id="type" name="type" type="text" value="${info.type}"/>
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="day" class="control-label col-lg-3">货期</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="day" name="day" type="text" value="${info.day}"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="no" class="control-label col-lg-3">单号</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="no" name="no" type="text" value="${info.no}"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="com" class="control-label col-lg-3">物流公司</label>
                    <div class="col-lg-5">
                      <select class="form-control m-bot15" name="com" id="com" autocomplete="off">
                        <option value=""></option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="remark" class="control-label col-lg-3">备注</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="remark" name="remark" type="text" value="${info.remark}"/>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-10">
                      <button class="btn btn-primary" type="button" id="submit">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    </div>
                </form>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <!--body wrapper end-->
<c:if test="${ empty info.no  &&  empty info.com}">
      <h4 style="margin: 0 35%;margin-bottom: 10px;">暂无物流信息</h4>
</c:if>
  </div>
  <!-- main content end-->
</section>
<c:if test="${not empty info.no  && not empty info.com}">
<%@ include file="logistics.jsp"%>
</c:if>
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
const EXPRESS_MAP = [{"com": "顺丰", "no": "sf"}, {"com": "申通", "no": "sto"}, {"com": "圆通", "no": "yt"}, {
"com": "韵达",
"no": "yd"
}, {"com": "天天", "no": "tt"}, {"com": "EMS", "no": "ems"}, {"com": "中通", "no": "zto"}, {
"com": "汇通",
"no": "ht"
}, {"com": "全峰", "no": "qf"}, {"com": "德邦", "no": "db"}, {"com": "国通", "no": "gt"}, {
"com": "如风达",
"no": "rfd"
}, {"com": "京东快递", "no": "jd"}, {"com": "宅急送", "no": "zjs"}, {"com": "EMS国际", "no": "emsg"}, {
"com": "Fedex国际",
"no": "fedex"
}, {"com": "邮政国内（挂号信）", "no": "yzgn"}, {"com": "UPS国际快递", "no": "ups"}, {
"com": "中铁快运",
"no": "ztky"
}, {"com": "佳吉快运", "no": "jiaji"}, {"com": "速尔快递", "no": "suer"}, {"com": "信丰物流", "no": "xfwl"}, {
"com": "优速快递",
"no": "yousu"
}, {"com": "中邮物流", "no": "zhongyou"}, {"com": "天地华宇", "no": "tdhy"}, {"com": "安信达快递", "no": "axd"}, {
"com": "快捷速递",
"no": "kuaijie"
}, {"com": "AAE全球专递", "no": "aae"}, {"com": "DHL", "no": "dhl"}, {"com": "DPEX国际快递", "no": "dpex"}, {
"com": "D速物流",
"no": "ds"
}, {"com": "FEDEX国内快递", "no": "fedexcn"}, {"com": "OCS", "no": "ocs"}, {"com": "TNT", "no": "tnt"}, {
"com": "东方快递",
"no": "coe"
}, {"com": "传喜物流", "no": "cxwl"}, {"com": "城市100", "no": "cs"}, {"com": "城市之星物流", "no": "cszx"}, {
"com": "安捷快递",
"no": "aj"
}, {"com": "百福东方", "no": "bfdf"}, {"com": "程光快递", "no": "chengguang"}, {
"com": "递四方快递",
"no": "dsf"
}, {"com": "长通物流", "no": "ctwl"}, {"com": "飞豹快递", "no": "feibao"}, {
"com": "马来西亚（大包EMS）",
"no": "malaysiaems"
}, {"com": "安能快递", "no": "ane66"}]


$(function () {
  var typeSelect = document.querySelector('select[id="com"]');
  var option1 = typeSelect.children[0];
  option1.value = '${info.no}';
  option1.innerText = '${info.com}';
  option1.selected = true;
  for (var key in EXPRESS_MAP) {
    var option = document.createElement('option');
    option.value = EXPRESS_MAP[key].no;
    option.innerText = EXPRESS_MAP[key].com;
    if (EXPRESS_MAP[key].no == '${info.com}') {
      option1.innerText = EXPRESS_MAP[key].com;
    }
    typeSelect.appendChild(option);
  }

  $("#submit").click(function(){
    var date = document.querySelector('[name="date"]').value;
    var name = document.querySelector('[name="name"]').value;
    var product = document.querySelector('[name="product"]').value;
    var type = document.querySelector('[name="type"]').value;
    var project = document.querySelector('[name="project"]').value;
    var no = document.querySelector('[name="no"]').value;
    var com = document.querySelector('select[name="com"]').value;
    var remark = document.querySelector('[name="remark"]').value;
    var day = document.querySelector('[name="day"]').value;
    if ((no == null || no == '') && com != null && com != '') {
      swal({
        type: 'info',
        html: '请填写物流单号！'
      });
      return;
    }else if (no != null && no != '' && (com == null || com == '')) {
      swal({
        type: 'info',
        html: '请选择物流公司！'
      });
      return;
    }

    swal({
      title: '你确定吗?',
      text: '确认要修改添请购设备/材料信息?',
      type: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '确认提交',
      cancelButtonText: '我再看看'
    }).then(function (isConfirm) {
      if (isConfirm) {
        $.ajax({
          //几个参数需要注意一下
          type: "POST",//方法类型
          dataType: "json",//预期服务器返回的数据类型
          url: "/input",//url
          data: "name=" + name + "&com=" + com + "&date=" + date + "&no=" + no+ "&project=" + project+ "&product="
                  + product+ "&type=" + type+ "&day=" + day+ "&remark=" + remark,
          success: function (result) {
            console.log(result);//打印服务端返回的数据(调试用)
            if (result == 0)
              swal({
                type: 'success',
                html: '提交成功 '
              });
            else
              swal({
                type: 'warning',
                html: '提交失败'
              });
          },
          error: function (data) {
            console.log(data);//打印服务端返回的数据(调试用)
          }
        });
      }
    })
  });



<c:if test="${info.com != null}">
for (var key in EXPRESS_MAP) {
  if (EXPRESS_MAP[key].no == '${info.com}') {
    $("#com").val(EXPRESS_MAP[key].com)
    break;
  }
}
</c:if>

  $("#finished").click(function (e) {
    window.opener=null;
    window.open('','_self');
    window.close();
  });
});
</script>
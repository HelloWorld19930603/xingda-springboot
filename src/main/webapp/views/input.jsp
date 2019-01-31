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
  <link rel="bookmark" href="<%=path%>/static/favicon.ico" />
  <link href="<%=path%>/css/style.css" rel="stylesheet">
  <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=path%>/css/datepicker.css">

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
        <li class="active"> 添加请购设备/材料 </li>
      </ul>
      <div class="btn-group" style="float:right;">
        <button id="editable-sample_new" class="btn btn-primary" style="font-size: 12px;padding: 4px 10px;">
          查询 <i class="fa fa-search"></i>
        </button>
      </div>
    </div>
    <!-- page heading end-->

    <!--body wrapper start-->
    <div class="wrapper">
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
                    <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day col-lg-5 ">
                      <i class="c-datepicker-range__icon kxiconfont icon-clock"></i>
                      <input id="date" name="date" type="text" autocomplete="off" name="" placeholder="选择日期" class="c-datepicker-data-input only-date" value="">
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="project" class="control-label col-lg-3">项目名称</label>
                    <div class="col-lg-5">
                      <input class=" form-control" id="project" name="project" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="name" class="control-label col-lg-3">负责人</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="name" name="name" type="text" />
                    </div>
                  </div>                  <div class="form-group ">
                  <label for="product" class="control-label col-lg-3">产品名称</label>
                  <div class="col-lg-5">
                    <input class="form-control " id="product" name="product" type="text" />
                  </div>
                </div>                  <div class="form-group ">
                  <label for="type" class="control-label col-lg-3">型号</label>
                  <div class="col-lg-5">
                    <input class="form-control " id="type" name="type" type="text" />
                  </div>
                </div>
                  <div class="form-group ">
                    <label for="day" class="control-label col-lg-3">货期</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="day" name="day" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="no" class="control-label col-lg-3">单号</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="no" name="no" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="com" class="control-label col-lg-3">物流公司</label>
                    <div class="col-lg-5">
                      <select class="form-control m-bot15" name="com" id="com" >
                        <option value="">请选择</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="remark" class="control-label col-lg-3">备注</label>
                    <div class="col-lg-5">
                      <input class="form-control " id="remark" name="remark" type="text" />
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-10">
                      <button class="btn btn-primary" type="button" id="submit">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
<%--                      <button class="btn btn-default" type="button" id="reset">重置</button>--%>
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


<script src="<%=path%>/js/date/moment.min.js"></script>

<script src="<%=path%>/js/date/datepicker.all.js"></script>
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
  }, {"com": "安能快递", "no": "ane66"}];


  (function () {

    var typeSelect2 = document.querySelector('select[id="com"]');

    for (var key in EXPRESS_MAP) {
      var option = document.createElement('option');
      option.value = EXPRESS_MAP[key].no;
      option.innerText = EXPRESS_MAP[key].com;
      typeSelect2.appendChild(option);
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
          type: 'purchaseInfo',
          html: '请填写物流单号！'
        });
        return;
    }else if (no != null && no != '' && (com == null || com == '')) {
        swal({
          type: 'purchaseInfo',
          html: '请选择物流公司！'
        });
        return;
      }

      swal({
        title: '你确定吗?',
        text: '确认要提交添请购设备/材料信息?',
        type: 'purchaseInfo',
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

  $("#editable-sample_new").click(function () {
    window.location.href = "<%=context%>/search";
  })

  })();

  $(function(){
    var DATAPICKERAPI = {
      // 默认input显示当前月,自己获取后填充
      activeMonthRange: function () {
        return {
          begin: moment().set({ 'date': 1, 'hour': 0, 'minute': 0, 'second': 0 }).format('YYYY-MM-DD HH:mm:ss'),
          end: moment().set({ 'hour': 23, 'minute': 59, 'second': 59 }).format('YYYY-MM-DD HH:mm:ss')
        }
      },
      shortcutMonth: function () {
        // 当月
        var nowDay = moment().get('date');
        var prevMonthFirstDay = moment().subtract(1, 'months').set({ 'date': 1 });
        var prevMonthDay = moment().diff(prevMonthFirstDay, 'days');
        return {
          now: '-' + nowDay + ',0',
          prev: '-' + prevMonthDay + ',-' + nowDay
        }
      },
      // 注意为函数：快捷选项option:只能同一个月份内的
      rangeMonthShortcutOption1: function () {
        var result = DATAPICKERAPI.shortcutMonth();
        return [{
          name: '昨天',
          day: '-1,-1',
          time: '00:00:00,23:59:59'
        }, {
          name: '这一月',
          day: result.now,
          time: '00:00:00,'
        }, {
          name: '上一月',
          day: result.prev,
          time: '00:00:00,23:59:59'
        }];
      },
      // 快捷选项option
      rangeShortcutOption1: [{
        name: '最近一周',
        day: '-7,0'
      }, {
        name: '最近一个月',
        day: '-30,0'
      }, {
        name: '最近三个月',
        day: '-90, 0'
      }],
      singleShortcutOptions1: [{
        name: '今天',
        day: '0'
      }, {
        name: '昨天',
        day: '-1',
        time: '00:00:00'
      }, {
        name: '一周前',
        day: '-7'
      }]
    };
    // 年月日单个(J-datepicker-day对应html里的input父元素div)
    $('.J-datepicker-day').datePicker({
      hasShortcut: true,
      format:'YYYY-MM-DD',
      shortcutOptions: [{
        name: '今天',
        day: '0'
      }, {
        name: '昨天',
        day: '-1'
      }, {
        name: '一周前',
        day: '-7'
      }]
    });


  });

</script>
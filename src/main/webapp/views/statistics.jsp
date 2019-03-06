<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="../commons/path.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title><%=title%>
    </title>


    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="<%=path%>/js/morris-chart/morris.css">

    <!--common-->
    <link href="<%=path%>/css/style.css" rel="stylesheet">
    <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/css/datepicker.css">

    <style>
        #main-chart {
            min-height: 330px;
        }

        .state-value {
            cursor: pointer;
        }
        .fa-check:hover{
            background-color: #ef579d;
            color: white;
            border-radius:4px;
        }

        .panel.active2{
            box-shadow:10px 10px 5px #a5a9b7;
        }



    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->

    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content">

        <!-- header section start-->
        <!-- header section end-->

        <!-- page heading start-->

        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <h1 style="text-align: center">${customerName}</h1>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="clearfix">
                                        <div id="main-chart-legend" class="pull-right">
                                        </div>
                                    </div>

                                    <div id="main-chart">
                                        <div id="main-chart-container" class="main-chart">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="<%=path%>/js/jquery-1.10.2.min.js"></script>
<script src="<%=path%>/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/modernizr.min.js"></script>
<script src="<%=path%>/js/jquery.nicescroll.js"></script>


<!--common scripts for all pages-->
<script src="<%=path%>/js/scripts.js"></script>

<script src="<%=path%>/js/chart-js/echartsUtil.js"></script>
<script src="<%=path%>/js/chart-js/echarts.js"></script>


</body>
</html>
<script src="<%=path%>/js/date/moment.min.js"></script>

<script src="<%=path%>/js/date/datepicker.all.js"></script>
<script type="text/javascript">

    var date1 = new Date();
    var date2 = date1 - 3600 * 24 * 31 * 1000;
    var start = dateFtt("yyyy-MM-dd", new Date(date2));
    var end = dateFtt("yyyy-MM-dd", date1);
    $(function () {
        var DATAPICKERAPI = {
            // 默认input显示当前月,自己获取后填充
            activeMonthRange: function () {
                return {
                    begin: moment().set({'date': 1, 'hour': 0, 'minute': 0, 'second': 0}).format('YYYY-MM-DD'),
                    end: moment().set({'hour': 23, 'minute': 59, 'second': 59}).format('YYYY-MM-DD')
                }
            },
            shortcutMonth: function () {
                // 当月
                var nowDay = moment().get('date');
                var prevMonthFirstDay = moment().subtract(1, 'months').set({'date': 1});
                var prevMonthDay = moment().diff(prevMonthFirstDay, 'days');
                return {
                    now: '-' + (nowDay - 1) + ',0',
                    prev: '-' + prevMonthDay + ',-' + nowDay
                }
            },
            // 快捷选项option
            rangeShortcutOption1: function () {
                var result = DATAPICKERAPI.shortcutMonth();
                return [{
                    name: '当前月',
                    day: result.now
                }, {
                    name: '最近一周',
                    day: '-7,0'
                }, {
                    name: '最近一个月',
                    day: '-30,0'
                }, {
                    name: '最近三个月',
                    day: '-90, 0'
                }];

            }
        };

        //年月日范围
        $('.J-datepicker-range-day').datePicker({
            hasShortcut: true,
            format: 'YYYY-MM-DD',
            isRange: true,
            shortcutOptions: DATAPICKERAPI.rangeShortcutOption1()
        });

    });

    selectForTime();
    function selectForTime() {
        $.ajax({
            url: 'selectForTime',
            data: "&customerName=${customerName}"  ,
            dataType: 'json',
            type: "post",
            success: function (data) {
                var num = '';
                var year = '';

                year += data[0].time1;
                for (var i = 1; i < data.length; i++) {
                    year += "," + data[i].time1;
                }
                num += '用时';
                for (var i = 0; i < data.length; i++) {
                    num += "," + parseInt(data[i].timeDiff/60000);
                }
                var chart = year + ";" + num;
                new EchartsUtils("main-chart-container", {
                    "colorType": "ldhp",
                    "data": chart,
                    "yAxisTitle": "分钟"
                });

            },
            error: function (data) {

            }
        })

    }



</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="/commons/path.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">

    <title><%=title%></title>

    <!--common-->
    <link href="<%=path%>/css/style.css" rel="stylesheet">
    <link href="<%=path%>/css/style-responsive.css" rel="stylesheet">
    <link href="<%=path%>/css/gm.css" rel="stylesheet">
    <link href="<%=path%>/css/grid.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<%=path%>/js/html5shiv.js"></script>
    <script src="<%=path%>/js/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .table-div{
        -webkit-overflow-scrolling: touch;
    }

</style>
<body class="sticky-header">

<section>


    <!-- main content start-->
    <div class="main-content">

        <!-- page heading start-->
        <div class="page-heading">

            <ul class="breadcrumb">
                <li>
                    <a href="#">工单</a>
                </li>
                <li class="active"> 工单查询</li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">

            <section class="search-area panel">

                <div class="sa-ele">
                    <label class="se-title">员工编号:</label>
                    <input class="se-con" name="userId"/>
                </div>
                <div class="sa-ele">
                    <label class="se-title">员工名称:</label>
                    <input class="se-con" name="userName"/>
                </div>
                <div class="sa-ele">
                    <button class="search-action">搜索</button>
                    <button class="reset-action">重置</button>
                </div>
                <div class="btn-group" style="float:right;">
                    <button id="editable-sample_new" class="btn btn-primary" style="font-size: 12px;padding: 4px 10px;">
                        新增 <i class="fa fa-plus"></i>
                    </button>
                </div>
            </section>

            <section class="grid-main">
                <table></table>
            </section>
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
<script src="<%=path%>/js/jquery.stepy.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/modernizr.min.js"></script>
<script src="<%=path%>/js/jquery.nicescroll.js"></script>


<!--common scripts for all pages-->
<script src="<%=path%>/js/scripts.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/gm.js"></script>


<script src="<%=path%>/js/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="<%=path%>/js/sweetalert/sweetalert2.min.css">
<!-- IE support -->
<script src="<%=path%>/js/sweetalert/es6-promise.min.js"></script>
</body>
</html>
<script type="text/javascript">


    // GridManager 渲染
    var table = document.querySelector('table');
    function init() {
        table.GM({
            supportRemind: true
            ,gridManagerName: 'test'
            ,height: '100%'
            ,supportAjaxPage:true
            ,supportSorting: true
            ,supportCheckbox: false
            ,isCombSorting: false
            ,disableCache: false
            ,checkbox:false
            // ajax_url 将在v2.6.0以上版本废弃，请不要再使用
            // ,ajax_url: 'http://www.lovejavascript.com/blogManager/getBlogList'
            ,ajax_data: function () {
                return '<%=context%>/genergy/getWork';
            }
            // ,firstLoading: false // 初始渲染时是否加载数据
            ,ajax_type: 'POST'
            ,supportMenu: true


            // AJAX失败事件函数
            ,ajax_error: function(error){
                console.log('ajax_error');
            }
            ,query: {serise: -1}
            ,dataKey: 'list'  // 注意: 这里是用来测试responseHandler 是否生效; 数据本身返回为data, 而在这里我把数据名模拟为list, 再通过responseHandler去更改
            ,pageSize:10

            // 通过该方法修改全部的请求参数
            ,requestHandler: function(request){
                request.newParams = '这个参数是通过 requestHandler 函数新增的';
                // 更改这个参数后, 将会强制createDate字段使用 降序排序.
                // 'sort_' 通过 配置项 sortKey 进行配置
                // 'DESC' 通过 配置项 sortDownText 进行配置
                //			request.sort_createDate = 'DESC';
                return request;
            }
            // 可以通过该方法修改返回的数据
            ,responseHandler: function(response){

                // 数据本身返回为data, 通过responseHandler更改为与dataKey匹配的值
                response.list = response.data;
                return response;
            }
            ,columnData: [
                {
                    key: 'id',
                    remind: 'the pic',
                    text: '编号',
                    isShow: false
                },
                {
                    key: 'userId',
                    remind: 'the pic',
                    width: '60px',
                    align: 'center',
                    text: '员工编号',
                    // 使用函数返回 dom node
                    template: function(userId, rowObject) {

                        return userId;
                    }
                },{
                    key: 'userName',
                    remind: 'the title',
                    align: 'center',
                    width: '60px',
                    text: '员工名称',
                    sorting: '',
                    // 使用函数返回 dom node
                    template: function(userName, rowObject) {

                        return userName;
                    }
                }, {
                    key: 'name',
                    remind: 'the pic',
                    width: '100px',
                    align: 'center',
                    text: '任务',
                    // 使用函数返回 dom node
                    template: function(name, rowObject) {

                        return name;
                    }
                },{
                    key: 'createTime',
                    remind: 'the title',
                    align: 'center',
                    width: '80px',
                    text: '创建时间',
                    sorting: '',
                    // 使用函数返回 dom node
                    template: function(createTime, rowObject) {

                        return dateFtt("yyyy-MM-dd hh:mm:ss",new Date(createTime))
                    }
                }, {
                    key: 'remark',
                    remind: 'the pic',
                    width: '100px',
                    align: 'center',
                    text: '备注',
                    // 使用函数返回 dom node
                    template: function(remark, rowObject) {

                        return remark;
                    }
                },{
                    key: 'status',
                    remind: 'the type',
                    text: '状态',
                    width: '80px',
                    align: 'center',
                    template: function(status, rowObject){
                        if(status == 0){
                            return "未开始";
                        }else if(status == 1){
                            return "进行中";
                        }else if(status == 2){
                            return "已完结";
                        }
                    }
                },{
                    key: 'action',
                    remind: 'the action',
                    width: '145px',
                    align: 'center',
                    text: '<span style="color: red">操作</span>',
                    // 直接返回 htmlString
                    template: function (action,rowObjct) {
                        var htmlString = '';
                        if(rowObjct.status != 0)
                         htmlString = '<span class="plugin-action" gm-click="editRowData">查看</span>';
                        if(rowObjct.status != 2)
                        htmlString += '<span class="plugin-action" gm-click="editRowData2">签到</span>'
                        return htmlString;
                    }
                }
            ]
            // 排序后事件
            ,sortingAfter: function (data) {
                console.log('sortAfter', data);
            }
        }, function(query){
            // 渲染完成后的回调函数
            console.log('渲染完成后的回调函数:', query);
        });
    }


    function editRowData(rowData){
        window.location.href = "<%=context%>/genergy/getOrder?workId="+rowData.id;
    }

    function editRowData2(rowData){
        if(code != null)
            window.location.href = "<%=context%>/genergy/addOrder?workId="+rowData.id+"&code="+code;
        else
            window.location.href = "<%=context%>/genergy/addOrder?workId="+rowData.id;
    }


    /**
     * 提供demo中的搜索, 重置
     */
    (function(){

        // 绑定搜索事件
        document.querySelector('.search-action').addEventListener('click', function () {
            var _query = {
                userId: document.querySelector('[name="userId"]').value,
                userName: document.querySelector('[name="userName"]').value,
                index: 1
            };
            table.GM('setQuery', _query, function(){
                console.log('setQuery执行成功');
            });
        });

        // 绑定重置
        document.querySelector('.reset-action').addEventListener('click', function () {
            document.querySelector('[name="userId"]').value = '';
            document.querySelector('[name="userName"]').value = '';
        });

        $("#editable-sample_new").click(function () {
            window.open("addWork");
        })
    })();

    (function(){
        init();
    })();

    $("[data-fancybox]").fancybox({
        // Options will go here
        buttons : [
            'zoom',
            'close'
        ]
    });


    $().fancybox({
        selector : '[data-fancybox="images"]',
        loop     : true
    });

    var code = null;
    dd.ready(function() {
        dd.runtime.permission.requestAuthCode({
            corpId: "ding3b3dcea5f0fbedba35c2f4657eb6378f", // 企业id
            onSuccess: function (info) {
                code = info.code // 通过该免登授权码可以获取用户身份
            }});
    });
    //  $.fancybox.open('<div class="message"><h2>Hello!</h2><p>You are awesome!</p></div>');
</script>
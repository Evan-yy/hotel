<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>546宾馆管理系统</title>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>


    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="jqueryui/style.css">

    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .ui-dialog .ui-state-error { padding: .3em; }
        .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>
</head>
<body>
<!--管理系统页面-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">546宾馆管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="Home.jsp">房间信息</a></li>
                <li ><a href="CustomerHome.jsp">客户信息</a></li>
                <li class="active"><a href="ListHome.jsp">订单信息<span class="sr-only">(current)</span></a></li>
            </ul>

            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名">
                </div>
                <button type="submit" class="btn btn-default">login</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <!--登陆用户显示-->
                <c:if test="${not empty sessionScope.Employee }">
                    <c:set value="${sessionScope.Employee }" var="e"/>
                    <li><a>${e.name}，欢迎你！</a></li>
                </c:if>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多操作 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">修改用户头像</a></li>
                        <li><a href="#">修改用户密码</a></li>
                        <li><a href="#">修改个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="row">

        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title">订单信息管理<span class="glyphicon glyphicon-leaf pull-right"></span></h3>
                </div>
                <div class="panel-body">
                    <!--a href="#" class="btn btn-success"新增</a>-->
                    <form class="form-inline pull-right">
                        <div class="form-group">

                            <div class="input-group">

                                <input type="text" class="form-control" id="exampleInputAmount" placeholder="关键字">

                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">搜索</button>
                    </form>

                    <table class="table table-hover table-striped table-bordered" style="margin-top: 10px">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>入住人</th>
                            <th>入住身份证码</th>
                            <th>入住房间</th>
                            <th>房间类型</th>
                            <th>房间单价</th>
                            <th>入住天数</th>
                            <th>总额</th>
                            <th>订单状态</th>
                            <th>订单生成时间</th>
                            <th>订单结束时间</th>

                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty sessionScope.lists }">
                        <c:forEach items="${sessionScope.lists }"  var="l">
                        <tr>
                            <td>${l.lid}</td>
                            <td>${l.customerName}</td>
                            <td>${l.customerID}</td>
                            <td>${l.roomid}</td>
                            <td>${l.roomType}</td>
                            <td>${l.roomprice}</td>
                            <td>${l.day}</td>
                            <td>${l.total}</td>
                            <td>${l.state}</td>
                            <td>${l.livetime}</td>
                            <td>${l.outtime}</td>


                            <td class="text-center">

                                <a class="btn btn-success btn-sm" onclick="openWindow1('d1${l.lid}')" >修改订单</a>
                                <div  class="dialog1" id="d1${l.lid}"   title="修改订单信息">
                                    <p class="validateTips">所有的表单字段都是必填的。</p>
                                    <form id="form1${l.lid}" action="../GetRoomServlet?Lid=${l.lid}" method="post">
                                        <p>修改入住房间：<input type="text" value="${l.roomid}" name="newroomid" id="newroomid${c.cid}" /></p>
                                        <p>修改入住天数：<input type="text" value="${l.day}" name="newday" id="newday${c.cid}" /></p>
                                        <p>修改订单状态：<input type="text" value="${l.state}" name="newstate" id="newstate${c.cid}" /></p>

                                        <button type="button" style="float: right;" onclick="cancle('d1${l.lid}')">取消</button>

                                        <button type="button" style="float: right;" onclick="keep(${l.lid})">保存</button>
                                    </form>
                                </div>

                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                </div>

                </tbody>
                </table>
                <nav aria-label="Page navigation">
                    <ul class="pagination pull-right">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>





</div>
</div>


</body>
</html>
<script>




    var tips = $( ".validateTips" );



    /**
     * 验证输入
     */


    function updateTips( t ) {
        tips
            .text( t )
            .addClass( "ui-state-highlight" );
        setTimeout(function() {
            tips.removeClass( "ui-state-highlight", 1500 );
        }, 500 );
    }


    function checkLength( o, n, Length) {
        if ( o.val().length != Length) {
            o.addClass( "ui-state-error" );
            updateTips( "" + n + " 的长度必须为 " +
                Length + " 位"  );
            return false;
        } else {
            return true;
        }
    }

    function checkRegexp( o , n) {
        if( o.val().length<=0 ) {
            o.addClass( "ui-state-error" );
            updateTips( n+"不能为空" );
            return false;
        } else {
            return true;
        }
    }

    function checkRegexp2( o, regexp, n ) {
        if ( !( regexp.test( o.val() ) ) ) {
            o.addClass( "ui-state-error" );
            updateTips( n );
            return false;
        } else {
            return true;
        }
    }


    function keep(id){
        var newroomid=$( "#newroomid"+id  ),
            newday=$("#newday"+id),
            newstate= $( "#newstate"+id  ),


            allFields = $( [] ).add( newroomid ).add( newday).add( newstate );
        var bValid = true;
        allFields.removeClass( "ui-state-error" );
        bValid = bValid && checkRegexp(newroomid, "房间号码");
        bValid = bValid && checkRegexp(newday, "入住天数");


        bValid = bValid && checkRegexp2( newroomid, /^([0-9])+$/, "房间号应为数字" );
        bValid = bValid && checkRegexp2( newday, /^([0-9])+$/, "入住天数应为数字" );

        if ( bValid ) {

            $("#form1"+id).submit();

            $( this ).dialog( "close" );

        }
    }






    function cancle (id) {
        $("#"+id).dialog("close");
    }



    function openWindow1(id) {
        $( "#"+id).dialog( "open" );

    }
    /**
     * 窗口设置
     */

    $(".dialog1" ).dialog({
        autoOpen: false,
        modal: true,
        show: {
            effect: "blind",
            duration: 1000
        },
        hide: {
            effect: "explode",
            duration: 1000
        },
        close: function () {
            allFields.val("").removeClass("ui-state-error");
        }


    });

</script>
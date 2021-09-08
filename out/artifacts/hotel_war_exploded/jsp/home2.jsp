<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>546宾馆管理系统</title>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>


    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="jqueryui/style.css">


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
                <li class="active"><a href="${pageContext.request.contextPath}/login.jsp">房间信息<span class="sr-only">(current)</span></a></li>
                <li><a href="#">客户信息</a></li>
                <li><a href="#">订单信息</a></li>
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
        <div class="col-md-2">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    图书列表
                </a>
                <a href="#" class="list-group-item">作者列表</a>
                <a href="#" class="list-group-item">出版社列表</a>
                <a href="#" class="list-group-item">更多操作</a>

            </div>
        </div>
        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title">房间信息管理<span class="glyphicon glyphicon-leaf pull-right"></span></h3>
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
                            <th>房间号</th>
                            <th>类型</th>
                            <th>状态</th>
                            <th>入住人</th>
                            <th>价格</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:if test="${not empty sessionScope.rooms }">
                            <c:forEach items="${sessionScope.rooms }" var="r">
                                <tr>
                                    <td>${r.roomid}</td>
                                    <td>${r.roomtype}</td>
                                    <c:if test="${r.roomstate=='入住中'}">
                                        <td style="color:#ff0000">${r.roomstate}</td>
                                    </c:if>
                                    <c:if test="${r.roomstate=='空闲中'}">
                                        <td>${r.roomstate}</td>
                                    </c:if>
                                    <c:if test="${r.roomstate=='已预订'}">
                                        <td style="color:blue">${r.roomstate}</td>
                                    </c:if>

                                    <c:if test="${not empty r.roomguestname}">
                                        <td>${r.roomguestname}</td>
                                    </c:if>
                                    <c:if test="${empty r.roomguestname}">
                                        <td>无</td>
                                    </c:if>

                                    <td>${r.roomprice}</td>
                                    <td class="text-center">
                                        <a class="btn btn-success btn-sm"  onclick="openWindow1(${r.roomid})">入住</a>
                                        <div id="dialog1"+${r.roomid} title="${r.roomid}">
                                            <p class="validateTips">所有的表单字段都是必填的。</p>
                                            <form name="form1" action="../GetRoomServlet?roomID=" +returnID() method="post">
                                                <p>入住人姓名：<input type="text" name="guestname" id="guestname" /></p>
                                                <p>入住人身份证号码：<input type="text" name="guestID" id="guestID" /></p>
                                                <p>入住天数：<input type="text" name="guestDay" id="guestDay" /></p>
                                                <div style="float: right;">
                                                </div>
                                            </form>
                                        </div>

                                        <a class="btn btn-primary btn-sm" onclick="openWindow2(${r.roomid})">预定</a>
                                        <div id="dialog2"+${r.roomid} title=returnID()>
                                            <p class="validateTips">所有的表单字段都是必填的。</p>
                                            <!--预定信息表单-->
                                            <form name="form2" action="../GetRoomServlet?roomID2="+roomid method="post">
                                                <p>预订人姓名：<input type="text" name="reservename" id="reservename" /></p>
                                                <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID" /></p>
                                                <p>预定天数：<input type="text" name="reserveDay" id="reserveDay" /></p>


                                                <div style="float: right;">
                                                </div>
                                            </form>
                                        </div>

                                        </c:if>

                                        <c:if test="${r.roomstate=='入住中'}">
                                            <!--续住功能-->
                                            <a class="btn btn-success btn-sm" >续住</a>
                                            <a class="btn btn-danger btn-sm">退房</a>

                                        </c:if>


                                        <c:if test="${r.roomstate=='已预订'}">
                                            <a class="btn btn-danger btn-sm">取消预定</a>
                                        </c:if>
                                    </td>
                                </tr>
                        </c:forEach>




                        </c:if>


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




    var guestname = $( "#guestname" ),
        guestID = $( "#guestID" ),
        guestDay = $( "#guestDay" ),
        reservename = $("#reservename"),
        reserveID = $("#reserveID"),
        reserveDay = $("#reserveDay"),
        allFields = $( [] ).add( guestname ).add( guestID ),
        allFields2 = $( [] ).add( reservename ).add( reserveID ).add(reserveDay),

        roomid,
        tips = $( ".validateTips" );



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



    function openWindow1(index) {

        $( "#dialog1+index" ).dialog( "open" );
    }
    /**
     * 窗口设置
     */
    $( "#dialog1" ).dialog({
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
        buttons: {
            "保存": function() {
                var bValid = true;
                allFields.removeClass( "ui-state-error" );

                bValid = bValid && checkRegexp( guestname,"姓名" );
                bValid = bValid && checkLength( guestID, "身份证号码", 18 );
                bValid = bValid && checkRegexp2( guestID, /^([0-9A-Z])+$/, "身份证号只允许： A-Z 0-9" );

                bValid = bValid && checkRegexp2( guestDay, /^([0-9])+$/, "入住天数应输入数字" );
                if ( bValid ) {

                    form1.submit();
                    $( this ).dialog( "close" );
                }
            },
            "取消": function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields.val( "" ).removeClass( "ui-state-error" );
        }

    });

    /**
     * 窗口设置
     */
    $( "#dialog2" ).dialog({
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
        buttons: {
            "确认": function() {
                var bValid = true;
                allFields2.removeClass( "ui-state-error" );

                bValid = bValid && checkRegexp( reservename,"姓名" );
                bValid = bValid && checkLength( reserveID, "身份证号码", 18 );



                bValid = bValid && checkRegexp2( reserveID, /^([0-9A-Z])+$/, "身份证号只允许： A-Z 0-9" );
                bValid = bValid && checkRegexp2( reserveDay, /^([0-9])+$/, "入住天数应输入数字" );

                if ( bValid ) {

                    form2.submit();
                    //  document.forms[0].submit();


                    $( this ).dialog( "close" );

                }
            },
            "取消": function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields2.val( "" ).removeClass( "ui-state-error" );
        }
    });

    function openWindow2() {

        $( "#dialog2" ).dialog( "open" );
    };





</script>





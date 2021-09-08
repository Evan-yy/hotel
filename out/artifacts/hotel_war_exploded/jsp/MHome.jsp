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
                <li class="active"><a href="MHome.jsp">房间管理<span class="sr-only">(current)</span></a></li>
                <li><a href="Memployee.jsp">员工管理</a></li>
                <li><a href="Mlist.jsp">订单管理</a></li>
            </ul>

            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名">
                </div>
                <button type="submit" class="btn btn-default">login</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <!--登陆用户显示-->
                <c:if test="${not empty sessionScope.Management }">
                    <c:set value="${sessionScope.Management }" var="m"/>
                    <li><a>管理员：${m.name}，欢迎你！</a></li>
                </c:if>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多操作 <span class="caret"></span></a>
                    <ul class="dropdown-menu">

                        <li><a href="#">修改个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="login1.jsp">退出</a></li>
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
                            <th>价格</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty sessionScope.rooms }">
                        <c:forEach items="${sessionScope.rooms }"  var="r">
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
                            <td>${r.roomprice}</td>
                            <td class="text-center">
                                <a class="btn btn-success btn-sm" onclick="openWindow1(${r.roomid})" >修改房间类型</a>
                                <div  class="dialog1" id="${r.roomid}"   title="${r.roomid}">

                                    <form id="form1${r.roomid}" action="../GetRoomServlet?roomID=${r.roomid}" method="post">

                                        <label>修改房间类型：</label>
                                        <select name="select1">
                                            <option>--请选择--</option>
                                            <option value="option1">大床房</option>
                                            <option value="option2" selected="selected">双床房</option>
                                        </select>



                                        <button type="button" style="float: right;" onclick="cancle(${r.roomid})">取消</button>

                                        <button type="button" style="float: right;" onclick="keep(${r.roomid})">保存</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>

                            <a class="btn btn-success btn-sm" onclick="openWindow1('d2${r.roomid}')" >修改房间价格</a>
                                <div  class="dialog1" id="d2${r.roomid}"   title="${r.roomid}">
                                    <p class="validateTips">所有的表单字段都是必填的。</p>
                                    <form id="form2${r.roomid}" action="../GetRoomServlet?roomID2=${r.roomid}" method="post">


                                        <label>修改房间新价格：<input type="text" name="roomprice" id="roomprice${r.roomid}" /></label>

                                        <button type="button" style="float: right;" onclick="cancle('d2${r.roomid}')">取消</button>

                                        <button type="button" style="float: right;" onclick="keep2(${r.roomid})">保存</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>




                                <a class="btn btn-danger btn-sm" onclick="openWindow1('d3${r.roomid}')">删除房间</a>
                                <div  class="dialog1" id="d3${r.roomid}"   title="${r.roomid}">

                                    <form id="form3${r.roomid}" action="../GetRoomServlet?roomID3=${r.roomid}" method="post">

                                        <p><label>是否删除此房间信息？</label></p>



                                        <button type="button" style="float: right;" onclick="cancle('d3${r.roomid}')">取消</button>
                                        <button type="button" style="float: right;" onclick="keep3(${r.roomid})">确定</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>

                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>

                        <th colspan="4"></th>
                        <th class="text-center">
                                <a  class="btn btn-primary btn-sm" onclick="openWindow1('d4')">添加房间</a>

                            <div  class="dialog1" id="d4"   title="添加房间信息">
                                <p class="validateTips">所有的表单字段都是必填的。</p>
                                <form id="form4" action="../GetRoomServlet" method="post">
<%--                                    <p>入住人姓名：<input type="text" name="guestname" id="guestname${r.roomid}" /></p>--%>
<%--                                    <p>入住人身份证号码：<input type="text" name="guestID" id="guestID${r.roomid}" /></p>--%>
<%--                                    <p>入住天数：<input type="text" name="guestDay" id="guestDay${r.roomid}" /></p>--%>

                                    <p>房间号：</p><input type="text" name="roomID" id="roomID" />
                                    <p>房间价格：<input type="text" name="roomprice" id="roomprice" /></p>
                                        <label>房间类型：</label>
                                      <select name="select2">
                                      <option>--请选择--</option>
                                      <option value="option1">大床房</option>
                                      <option value="option2" selected="selected">双床房</option>
                                      </select>
                                       <br>
                                    <button type="button" style="float: right;" onclick="cancle('d4')">取消</button>

                                    <button type="button" style="float: right;" onclick="keep4()">保存</button>

                                    <div style="float: right;">
                                    </div>
                                </form>
                            </div>
                        </th>

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




    var roomtype= $("select[name='select1'] option:selected").val();//选中项的值
    roomtype2= $("select[name='select2'] option:selected").val();//选中项的值
        roomID=$( "#roomID" ),
        roomprice= $( "#roomprice" ),


        allFields = $( [] ).add( roomprice ),
            allFields2 = $( [] ).add( roomID ).add( roomprice ).add( roomtype2 ),



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


    function keep(id){
        var roomtype= $("select[name='select1'] option:selected").val();//选中项的值



        var bValid = true;
        allFields.removeClass( "ui-state-error" );

        if ( bValid ) {

            $("#form1"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep2(id){
        var roomprice= $( "#roomprice" ),//选中项的值

            allFields = $( [] ).add( roomprice );



        var bValid = true;
        allFields.removeClass( "ui-state-error" );
        bValid = bValid && checkRegexp(roomprice, "房间价格");
        bValid = bValid && checkRegexp2( roomprice, /^([0-9])+$/, "房间价格应输入数字" );

        if ( bValid ) {

            $("#form2"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep3(id){


        var bValid = true;


        if ( bValid ) {

            $("#form3"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep4(){
        var roomID=$( "#roomID" ),
            roomprice= $( "#roomprice" ),
            roomtype2= $("select[name='select2'] option:selected").val();


            allFields2 = $( [] ).add( roomID ).add( roomprice ).add( roomtype2 );



        var bValid = true;
        allFields2.removeClass( "ui-state-error" );



        bValid = bValid && checkRegexp(roomID, "房间号");
        bValid = bValid && checkRegexp(roomprice, "房间价格");

        bValid = bValid && checkRegexp2(roomID, /^([0-9])+$/, "房间号应输入数字");
        bValid = bValid && checkRegexp2(roomprice, /^([0-9])+$/, "房间价格应输入数字");

        if ( bValid ) {

            $("#form4").submit();

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
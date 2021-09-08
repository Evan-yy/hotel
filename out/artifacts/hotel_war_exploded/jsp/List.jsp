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

                            <c:if test="${not empty r.roomguestname}">
                                <td>${r.roomguestname}</td>
                            </c:if>
                            <c:if test="${empty r.roomguestname}">
                                <td>无</td>
                            </c:if>

                            <td>${r.roomprice}</td>
                            <td class="text-center">
                                <c:if test="${r.roomstate=='空闲中'}">
                                    <!--入住功能-->
                                    <a class="btn btn-success btn-sm"  onclick="openWindow1(${r.roomid})">入住1</a>
                                    <div  class="dialog1" id="${r.roomid}"   title="${r.roomid}">
                                        <p class="validateTips">所有的表单字段都是必填的。</p>
                                        <form id="form1${r.roomid}" action="../GetRoomServlet?roomID=${r.roomid}" method="post">
                                            <p>入住人姓名：<input type="text" name="guestname" id="guestname${r.roomid}" /></p>
                                            <p>入住人身份证号码：<input type="text" name="guestID" id="guestID${r.roomid}" /></p>
                                            <p>入住天数：<input type="text" name="guestDay" id="guestDay${r.roomid}" /></p>
                                            <button type="button" style="float: right;" onclick="cancle(${r.roomid})">取消</button>

                                            <button type="button" style="float: right;" onclick="keep(${r.roomid})">保存</button>

                                            <div style="float: right;">
                                            </div>
                                        </form>
                                    </div>

                                    <!--预定功能-->
                                    <a class="btn btn-primary btn-sm"  onclick="openWindow1('d2${r.roomid}')">预订</a>
                                    <div  class="dialog1" id="d2${r.roomid}"   title="${r.roomid}">
                                        <p class="validateTips">所有的表单字段都是必填的。</p>
                                        <form id="form2${r.roomid}" action="../GetRoomServlet?roomID2=${r.roomid}" method="post">
                                            <p>预订人姓名：<input type="text" name="reservename" id="reservename${r.roomid}" /></p>
                                            <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID${r.roomid}" /></p>
                                            <p>预定天数：<input type="text" name="reserveDay" id="reserveDay${r.roomid}" /></p>
                                            <button type="button" style="float: right;" onclick="cancle('d2${r.roomid}')">取消</button>

                                            <button type="button" style="float: right;" onclick="keep2(${r.roomid})">保存</button>

                                            <div style="float: right;">
                                            </div>
                                        </form>
                                    </div>






                                </c:if>

                                <c:if test="${r.roomstate=='入住中'}">
                                    <!--续住功能-->
                                    <a class="btn btn-success btn-sm" onclick="openWindow1('d3${r.roomid}')">续住</a>

                                    <div  class="dialog1" id="d3${r.roomid}"   title="${r.roomid}">
                                        <p class="validateTips">所有的表单字段都是必填的。</p>
                                        <form id="form3${r.roomid}" action="../GetRoomServlet?roomID3=${r.roomid}" method="post">
                                                <%--                                            <p>预订人姓名：<input type="text" name="reservename" id="reservename" /></p>--%>
                                                <%--                                            <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID" /></p>--%>
                                            <p>续住天数：<input type="text" name="addDay" id="addDay${r.roomid}" /></p>
                                            <button type="button" style="float: right;" onclick="cancle('d3${r.roomid}')">取消</button>

                                            <button type="button" style="float: right;" onclick="keep3(${r.roomid})">确定</button>

                                            <div style="float: right;">
                                            </div>
                                        </form>
                                    </div>


                                    <a class="btn btn-danger btn-sm" onclick="openWindow1('d4${r.roomid}')">退房</a>
                                    <div  class="dialog1" id="d4${r.roomid}"   title="${r.roomid}">
                                        <p class="validateTips">所有的表单字段都是必填的。</p>
                                        <form id="form4${r.roomid}" action="../GetRoomServlet?roomID4=${r.roomid}" method="post">
                                            <p>入住人：${r.roomguestname}</p>
                                            <p>是否确定对此房间进行退房？</p>
                                                <%--  <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID" /></p>--%>

                                            <button type="button" style="float: right;" onclick="cancle('d4${r.roomid}')">取消</button>

                                            <button type="button" style="float: right;" onclick="keep4(${r.roomid})">确定</button>

                                            <div style="float: right;">
                                            </div>
                                        </form>
                                    </div>

                                </c:if>


                                <c:if test="${r.roomstate=='已预订'}">
                                    <a class="btn btn-danger btn-sm" onclick="openWindow1('d5${r.roomid}')">取消预定</a>

                                    <div  class="dialog1" id="d5${r.roomid}"   title="${r.roomid}">
                                        <p class="validateTips">所有的表单字段都是必填的。</p>
                                        <form id="form5${r.roomid}" action="../GetRoomServlet?roomID5=${r.roomid}" method="post">
                                            <p>预订客户名：${r.roomguestname}</p>
                                            <p>是否确定取消预订？</p>
                                                <%--  <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID" /></p>--%>

                                            <button type="button" style="float: right;" onclick="cancle('d5${r.roomid}')">取消</button>

                                            <button type="button" style="float: right;" onclick="keep5(${r.roomid})">确定</button>

                                            <div style="float: right;">
                                            </div>
                                        </form>
                                    </div>
                                </c:if>
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
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
                <li><a href="MHome.jsp">房间管理</a></li>
                <li><a href="Memployee.jsp">员工管理</a></li>
                <li class="active"><a href="Mlist.jsp">订单管理<span class="sr-only">(current)</span></a></li>
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
                                <a class="btn btn-success btn-sm" >修改订单</a>

                                <a class="btn btn-danger btn-sm" >删除订单</a>

                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                        <th colspan="7" class="text-right">总金额：</th>
                        <th class="text-center">
                            ${sessionScope.Alltotal}
                        </th>

                        <th colspan="4" ></th>

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
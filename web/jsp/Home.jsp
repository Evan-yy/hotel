<%--
  Created by IntelliJ IDEA.
  User: jjjkl
  Date: 2020/11/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>546宾馆管理系统</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1${room.id}</td>
                            <td>伊越${room.}</td>
                            <td>安徒生</td>
                            <td>安徒生出版社</td>
                            <td>199.98</td>
                            <td class="text-center">
                                <a class="btn btn-primary btn-sm">编辑</a>
                                <a class="btn btn-danger btn-sm">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>陈博</td>
                            <td>格林</td>
                            <td>格林出版社</td>
                            <td>200.98</td>
                            <td class="text-center">
                                <a class="btn btn-primary btn-sm">编辑</a>
                                <a class="btn btn-danger btn-sm">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>郭凡</td>
                            <td>卡洛.科洛迪</td>
                            <td>意大利出版社</td>
                            <td>1999.98</td>
                            <td class="text-center">
                                <a class="btn btn-primary btn-sm">编辑</a>
                                <a class="btn btn-danger btn-sm">删除</a>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>茶花女</td>
                            <td>小仲马</td>
                            <td>英伦出版社</td>
                            <td>299.98</td>
                            <td class="text-center">
                                <a class="btn btn-primary btn-sm">编辑</a>
                                <a class="btn btn-danger btn-sm">删除</a>
                            </td>
                        </tr>

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


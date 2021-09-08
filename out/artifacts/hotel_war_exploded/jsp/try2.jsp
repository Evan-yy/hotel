<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>jQuery UI 对话框（Dialog） - 动画</title>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>


    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="jqueryui/style.css">

</head>
<body>



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







</body>
</html>
<script>
    function out() {
        window.location.href = "../ListServlet";

    }
</script>

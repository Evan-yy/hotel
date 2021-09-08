<%--
  Created by IntelliJ IDEA.
  User: jjjkl
  Date: 2020/11/6
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" type="text/css" href="login1.css">
</head>
<body>
<div id="login1">
    <h1>Login</h1>
    <form method="post" name="login1" action="">
        <input type="text" required="required" placeholder="用户名" name="u"></input>
        <input type="password" required="required" placeholder="密码" name="p"></input>
        <div>
        <button class="but" onclick="Em()">登录</button>
        <button class="but1" onclick="Ma()">管理员登录</button>
        </div>
    </form>
</div>
</body>
</html>

<script>
    function Em(){
//        document.("表单的name值").action
//        document.("表单的name值").submit
        document.login1.action="../EmployeeServlet";
        document.login1.submit();
    }
    function Ma() {
        document.login1.action = "../ManagementServlet";
        document.login1.submit();
    }
</script>

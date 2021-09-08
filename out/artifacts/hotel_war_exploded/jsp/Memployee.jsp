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
                <li><a href="MHome.jsp">房间管理<span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="Memployee.jsp">员工管理</a></li>
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
                    <h3 class="panel-title">员工信息管理<span class="glyphicon glyphicon-leaf pull-right"></span></h3>
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


                            <th>员工ID</th>

                            <th>员工姓名</th>
                            <th>员工性别</th>
                            <th>联系电话</th>

                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty sessionScope.employees }">
                        <c:forEach items="${sessionScope.employees }"  var="e">
                        <tr>

                            <td>${e.lid}</td>

                            <td>${e.name}</td>
                            <td>${e.sex}</td>
                            <td>${e.number}</td>


                            <td class="text-center">
                                <a class="btn btn-success btn-sm" onclick="openWindow1('d1${e.lid}')" >修改员工信息</a>
                                <div  class="dialog1" id="d1${e.lid}"   title="修改员工信息">
                                    <p class="validateTips">所有的表单字段都是必填的。</p>
                                    <form id="form1${e.lid}" action="../GetRoomServlet?Eid=${e.lid}" method="post">
                                        <p>员工姓名：<input type="text" value="${e.name}" name="newname" id="newname${e.lid}" /></p>
                                        <label>修改性别：</label>
                                        <select name="select1">
                                            <option>--请选择--</option>
                                            <option value="option1" selected="selected">男</option>
                                            <option value="option2">女</option>
                                        </select>
                                        <p>联系电话：<input type="text" value="${e.number}" name="newnumber" id="newnumber${e.lid}" /></p>




                                        <button type="button" style="float: right;" onclick="cancle('d1${e.lid}')">取消</button>

                                        <button type="button" style="float: right;" onclick="keep(${e.lid})">保存</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>

                                <a class="btn btn-success btn-sm" onclick="openWindow1('d2${e.lid}')" >修改员工登录密码</a>
                                <div  class="dialog1" id="d2${e.lid}"   title="修改员工登录密码">
                                    <p class="validateTips">所有的表单字段都是必填的。</p>
                                    <form id="form2${e.pwd}" action="../GetRoomServlet?Eid=${e.lid}" method="post">
                                        <p>原密码：</p><input type="password"  name="oldpwd" id="oldpwd${e.pwd}" />
                                        <p>新密码：</p><input type="password"  name="newpwd" id="newpwd${e.pwd}" />
                                        <p>确认新密码：</p><input type="text"  name="newpwd2" id="newpwd2${e.pwd}" />
                                        <br>
                                        <br>

                                        <button type="button" style="float: right;" onclick="cancle('d2${e.lid}')">取消</button>

                                        <button type="button" style="float: right;" onclick="keep2(${e.pwd})">保存</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>



                                <a class="btn btn-danger btn-sm" onclick="openWindow1('d3${e.lid}')">删除员工</a>
                                <div  class="dialog1" id="d3${e.lid}"   title="删除员工信息">

                                    <form id="form3${e.lid}" action="../GetRoomServlet?" method="post">

                                        <p><label>是否确定删除此员工？</label></p>



                                        <button type="button" style="float: right;" onclick="cancle('d3${e.lid}')">取消</button>
                                        <button type="button" style="float: right;" onclick="keep3(${e.lid})">确定</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>


                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>

                        <th colspan="4" ></th>
                         <th class="text-center">
                            <a  class="btn btn-primary btn-sm" onclick="openWindow1('d4')"  >添加员工</a>

                            <div  class="dialog1" id="d4"   title="添加员工">
                                <p class="validateTips">所有的表单字段都是必填的。</p>
                                <form id="form4" action="../GetRoomServlet" method="post">
                                    <p>员工登录ID：</p><input type="type"  name="logID" id="logID" />
                                    <p>员工登录密码：</p><input type="password"  name="pwd" id="pwd" />
                                    <p>确认密码：</p><input type="password"  name="pwd2" id="pwd2" />
                                    <p>员工姓名：</p><input type="text"  name="name" id="name" />
                                    <p>员工性别：</p>
                                    <select name="select2">
                                        <option>--请选择--</option>
                                        <option value="option1" selected="selected">男</option>
                                        <option value="option2">女</option>
                                    </select>
                                    <p>员工联系电话：</p><input type="text"  name="phone" id="phone" />

                                    <br>
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




    var newsex= $("select[name='select1'] option:selected").val();//选中项的值

    newname=$( "#newname" ),
        newnumber= $( "#newnumber" ),
        oldpwd=$("#oldpwd"),
        newpwd=$("#newpwd"),
        newpwd2=$("#newpwd2")


        allFields = $( [] ).add( newname ).add( newnumber ),
        allFields2 = $( [] ).add( oldpwd ).add( newpwd ),




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
        var newsex= $("select[name='select1'] option:selected").val();//选中项的值

            newname=$( "#newname"+id  ),
            newnumber= $( "#newnumber"+id  ),


            allFields = $( [] ).add( newname ).add( newnumber );
        var bValid = true;
        allFields.removeClass( "ui-state-error" );
        bValid = bValid && checkRegexp(newname, "姓名");
        bValid = bValid && checkRegexp(newnumber, "联系电话");
        bValid = bValid && checkRegexp2( newnumber, /^([0-9])+$/, "联系电话应为数字" );

        if ( bValid ) {

            $("#form1"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep2(id){
        var  oldpwd=$("#oldpwd"+id ),
              newpwd=$("#newpwd"+id );
        newpwd2=$("#newpwd2"+id)

            allFields2 = $( [] ).add( oldpwd ).add( newpwd ).add(newpwd2);
        var bValid = true;

        allFields2.removeClass( "ui-state-error" );

        bValid = bValid && checkRegexp(oldpwd, "原密码");
        bValid = bValid && checkRegexp(newpwd, "新密码");
        bValid = bValid && checkRegexp(newpwd2, "确认新密码");
        if(oldpwd!=id)
        {
            alert("原密码输入错误");
            bValid=false;
        }
        if(newpwd!=newpwd2)
        {
            alert("两次密码不一致");
            bValid=false;
        }

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
        var  sex= $("select[name='select2'] option:selected").val(),//选中项的值
             pwd=$("#pwd" ),
             pwd2=$("#pwd2" ),
             logID=$("#logID"),
             name=$("#name"),
             phone=$("#phone");



        allFields4 = $( [] ).add( sex ).add( pwd ).add(pwd2).add(logID).add(name).add(phone);
        var bValid = true;

        allFields4.removeClass( "ui-state-error" );

        bValid = bValid && checkRegexp(logID, "员工ID");
        bValid = bValid && checkRegexp2( logID, /^([0-9])+$/, "员工ID应为数字" );
        bValid = bValid && checkRegexp(pwd, "密码");
        bValid = bValid && checkRegexp(pwd2, "确认密码");
        bValid = bValid && checkRegexp(name, "员工姓名");



        bValid = bValid && checkRegexp2( phone, /^([0-9])+$/, "联系电话应为数字" );

        if ( bValid ) {
            if(pwd!=pwd2)
            {
                alert("两次密码输入不一致");
                bValid=false;
           if(bValid)
           {
               $("#form4").submit();
            $( this ).dialog( "close" );
           }

            }

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
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
                <li class="active"><a href="CustomerHome.jsp">客户信息<span class="sr-only">(current)</span></a></li>
                <li ><a href="ListHome.jsp">订单信息</a></li>
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
                    <h3 class="panel-title">客户信息管理<span class="glyphicon glyphicon-leaf pull-right"></span></h3>
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
                            <th>ID</th>
                            <th>客户姓名</th>
                            <th>客户身份证</th>
                            <th>客户联系电话</th>
                            <th>客户类型</th>



                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty sessionScope.customers }">
                        <c:forEach items="${sessionScope.customers }"  var="c">
                        <tr>
                            <td>${c.cid}</td>
                            <td>${c.cname}</td>
                            <td>${c.ccardid}</td>
                            <td>${c.cphone}</td>
                            <td>${c.cgrade}</td>



                            <td class="text-center">

                                <a class="btn btn-success btn-sm" onclick="openWindow1('d1${c.cid}')" >修改会员信息</a>
                                <div  class="dialog1" id="d1${c.cid}"   title="修改会员信息">
                                    <p class="validateTips">所有的表单字段都是必填的。</p>
                                    <form id="form1${c.cid}" action="../GetRoomServlet?Cid=${c.cid}" method="post">
                                        <p>员工姓名：<input type="text" value="${c.cname}" name="newname" id="newname${c.cid}" /></p>
                                        <p>身份证号码：<input type="text" value="${c.ccardid}" name="newcardid" id="newcardid${c.cid}" /></p>
                                        <p>联系电话：<input type="text" value="${c.cphone}" name="newphone" id="newphone${c.cid}" /></p>
                                        <p>客户类型</p>
                                        <select name="select1">
                                            <option>--请选择--</option>
                                            <option value="option1" selected="selected">会员</option>
                                            <option value="option2">超级会员</option>
                                        </select>
                                        <button type="button" style="float: right;" onclick="cancle('d1${c.cid}')">取消</button>

                                        <button type="button" style="float: right;" onclick="keep(${c.cid})">保存</button>
                                    </form>
                                </div>

                                <a class="btn btn-danger btn-sm" onclick="openWindow1('d2${c.cid}')">删除客户信息</a>
                                <div  class="dialog1" id="d2${c.cid}"   title="删除客户信息">

                                    <form id="form2${c.cid}" action="../GetRoomServlet?" method="post">

                                        <p><label>是否确定删除此员工的信息？</label></p>



                                        <button type="button" style="float: right;" onclick="cancle('d2${c.cid}')">取消</button>
                                        <button type="button" style="float: right;" onclick="keep2(${c.cid})">确定</button>

                                        <div style="float: right;">
                                        </div>
                                    </form>
                                </div>





                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                </div>

                <th colspan="5" ></th>
                <th class="text-center">
                    <a  class="btn btn-primary btn-sm" onclick="openWindow1('d4')"  >添加新客户</a>

                    <div  class="dialog1" id="d4"   title="添加新客户">
                        <p class="validateTips">所有的表单字段都是必填的。</p>
                        <form id="form4" action="../GetRoomServlet" method="post">
                            <p>客户ID：</p><input type="type"  name="logID" id="logID" />
                            <p>客户姓名：</p><input type="text"  name="name" id="name" />
                            <p>客户身份证号码：</p><input type="text"  name="cardid2" id="cardid2" />
                            <p>客户联系电话：</p><input type="text"  name="phone" id="phone" />
                            <p>客户类型：</p>
                            <select name="select2">
                                <option>--请选择--</option>
                                <option value="option1" selected="selected">会员</option>
                                <option value="option2">超级会员</option>
                            </select>
                            <br>
                            <br>

                            <button type="button" style="float: right;" onclick="cancle('d4')">取消</button>

                            <button type="button" style="float: right;" onclick="keep4()">保存</button>

                            <div style="float: right;">
                            </div>
                        </form>
                    </div>


                </th>

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
        var newgrade= $("select[name='select1'] option:selected").val(),//选中项的值

              newname=$( "#newname"+id  ),
            newcardid=$("#newcardid"+id),
            newphone= $( "#newphone"+id  ),


            allFields = $( [] ).add( newname ).add( newgrade).add( newcardid ).add( newphone );
        var bValid = true;
        allFields.removeClass( "ui-state-error" );
        bValid = bValid && checkRegexp(newname, "姓名");
        bValid = bValid && checkRegexp(newcardid, "客户身份证号");
        bValid = bValid && checkLength( nnewcardid, "身份证号码", 3 );
        bValid = bValid && checkRegexp(newphone, "联系电话");

        bValid = bValid && checkRegexp2( newnumber, /^([0-9])+$/, "联系电话应为数字" );

        if ( bValid ) {

            $("#form1"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep2(id){


        var bValid = true;


        if ( bValid ) {

            $("#form3"+id).submit();

            $( this ).dialog( "close" );

        }
    }

    function keep4(){
        var  grade= $("select[name='select2'] option:selected").val(),//选中项的值
            name=$("#name" ),
            cardid2=$("#cardid2" ),
            logID=$("#logID"),
            name=$("#name"),
            phone=$("#phone");



        allFields4 = $( [] ).add( sex ).add( cardid2 ).add(logID).add(name).add(phone);
        var bValid = true;

        allFields4.removeClass( "ui-state-error" );

        bValid = bValid && checkRegexp(logID, "客户ID");
        bValid = bValid && checkRegexp2( logID, /^([0-9])+$/, "客户ID应为数字" );

        bValid = bValid && checkRegexp(name, "员工姓名");



        bValid = bValid && checkRegexp2( phone, /^([0-9])+$/, "联系电话应为数字" );

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
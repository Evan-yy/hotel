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
    <style>
        .ui-dialog .ui-state-error { padding: .3em; }
        .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>
    <script>
        $(function() {
            var guestname = $( "#guestname" ),
                guestID = $( "#guestID" ),
                reservename = $("#reservename"),
                reserveID = $("#reserveID"),
                reserveDay = $("#reserveDay"),

                allFields = $( [] ).add( guestname ).add( guestID ),
                allFields2 = $( [] ).add( reservename ).add( reserveID ).add(reserveDay),
                tips = $( ".validateTips" );


            /**
             * 窗口设置
             */
            $( "#dialog" ).dialog({
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

                        if ( bValid ) {

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
             * 预定窗口设置
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

                /**
                 * 响应
                 */
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


            /**
             * 打开窗口
             */
            $( "#opener" ).click(function() {
                $( "#dialog" ).dialog( "open" );
            });
            $( "#opener2" ).click(function() {
                $( "#dialog2" ).dialog( "open" );
            });





        });



    </script>
</head>
<body>


<div id="dialog" title="Basic dialog">
    <p class="validateTips">所有的表单字段都是必填的。</p>
    <form>
        <p>入住人姓名：<input type="text" name="guestname" id="guestname" /></p>
        <p>入住人身份证号码：<input type="text" name="guestID" id="guestID" /></p>
        <div style="float: right;">
        </div>
    </form>
</div>

<a class="btn btn-success btn-sm" id="opener">入住</a>

<a class="btn btn-primary btn-sm" id="opener2" name="${r.roomid}">预定</a>

<div id="dialog2" title="${r.roomid}">
    <p class="validateTips">所有的表单字段都是必填的。</p>
    <!--预定信息表单-->
    <form name="form2" action="../GetRoomServlet?roomID2=${r.roomid}" method="post">
        <p>预订人姓名：<input type="text" name="reservename" id="reservename" /></p>
        <p>预订人身份证号码：<input type="text" name="reserveID" id="reserveID" /></p>
        <p>预定天数：<input type="text" name="reserveDay" id="reserveDay" /></p>

        <div style="float: right;">
        </div>
    </form>
</div>




</body>
</html>

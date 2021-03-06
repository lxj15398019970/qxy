<%@ page import="net.esoar.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"/>

    <meta charset="UTF-8">

    <title>清新源室内空气净化服务有限公司</title>

    <!-- Dwz start -->
    <link href="${ctx }/static/dwz/themes/default/style.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/css/core.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/css/print.css?var=${jsTime}" rel="stylesheet"
          type="text/css" media="print"/>
    <link href="${ctx }/static/dwz/uploadify/css/uploadify.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
    <link href="${ctx }/static/dwz/themes/default/font-awesome.css?var=${jsTime}"
          rel="stylesheet" type="text/css" media="screen"/>
    <!-- Dwz end -->

    <!--[if IE]>
    <link href="${ctx }/static/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->
    <!--[if lte IE 9]>
    <script src="${ctx }/static/dwz/js/speedup.js" type="text/javascript"></script>
    <script src="${ctx}/static2/bootstrap/2.3.2/js/html5shiv.js"></script>
    <![endif]-->

    <script src="${ctx }/static/dwz/js/jquery-1.7.2.js"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.cookie.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.validate.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/jquery.bgiframe.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/dwz.min.js" type="text/javascript"></script>
    <script src="${ctx }/static/dwz/js/dwz.regional.zh.js?var=${jsTime}"
            type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/2.3.2/js/jquery-print.js"></script>


    <!--底部结束-->
    <script src="${ctx }/static/dwz/xheditor/xheditor-1.2.1.min.js"
            type="text/javascript"></script>
    <script src="${ctx }/static/dwz/xheditor/xheditor_lang/zh-cn.js"
            type="text/javascript"></script>
    <script
            src="${ctx }/static/dwz/uploadify/scripts/jquery.uploadify.min.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${ctx }/static/sea-modules/My97DatePicker/WdatePicker.js"></script>
    <!-- 来自百度CDN -->
    <script src="${ctx }/static/sea-modules/esl.js?var=${jsTime}" type="text/javascript"></script>


    <script type="text/javascript">
        $(function () {
            DWZ.init("dwz.frag.xml", {
//		loginUrl:"loginsub.html", loginTitle:"登录",	// 弹出登录对话框
                loginUrl: "login.action",	// 跳到登录页面
                debug: false,	// 调试模式 【true|false】
                callback: function () {
                    initEnv();
                    $("#themeList").theme({themeBase: "themes"});
                }
            });
        });
        //清理浏览器内存,只对IE起效,FF不需要
        if ($.browser.msie) {
            window.setInterval("CollectGarbage();", 10000);
        }
    </script>
</head>

<body scroll="no">
<div id="layout">


    <div id="header">
        <div id="navMenu">
            <h1 id="logo">清新源</h1>
            <ul>
                <li class="top-menu"><a href="${ctx}/main.action?type=user"><span>系统管理</span></a></li>

                <li class="top-menu"><a href="${ctx}/main.action?type=banner"><span>首页banner</span></a></li>
                <li class="top-menu"><a href="${ctx}/main.action?type=icase"><span>经典案例</span></a></li>
                <li class="top-menu"><a href="${ctx}/main.action?type=news"><span>新闻管理</span></a></li>
                <li class="top-menu"><a href="${ctx}/main.action?type=company"><span>公司简介</span></a></li>
                <li class="top-menu"><a href="${ctx}/main.action?type=partner"><span>合作单位</span></a></li>

            </ul>
            <p class="text-right">
                欢迎您<%=SpringSecurityUtils.getCurrentUserName()%><a href="${ctx}/j_spring_security_logout"><span
                    style="color:#fff">[退出登陆]</span></a>
                <a width="600" target="dialog" href="${ctx}/main!passwordInput.action">修改密码</a>
            </p>
        </div>
    </div>

    <div id="leftside">

        <div id="sidebar">

            <%@include file="dwz-menu.jsp" %>

        </div>
    </div>
    <%--<div id="container">--%>
    <%--<div id="navTab" class="tabsPage">--%>
    <%--<ul class="tabsMoreList">--%>
    <%--<li><a href="javascript:;">我的主页</a></li>--%>
    <%--</ul>--%>
    <%--<div class="navTab-panel tabsPageContent layoutBox">--%>
    <%--<div class="page unitBox">--%>
    <%--<div class="accountInfo">--%>
    <%--<p>--%>
    <%--<span>欢迎使用分拣系统</span>--%>
    <%--</p>--%>
    <%--</div>--%>
    <%--<div class="pageFormContent" layoutH="80"--%>
    <%--style="margin-right: 230px"></div>--%>
    <%--<div style="width: 230px; position: absolute; top: 60px; right: 0"--%>
    <%--layoutH="80"></div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--</div>--%>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader" style="display: none;">
                <div class="tabsPageHeaderContent">
                    <!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span>我的主页</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div>
                <!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div>
                <!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">
                    <div class="accountInfo">
                        <p>
                            <span>清新源</span>
                        </p>
                    </div>
                    <div class="pageFormContent" layoutH="80"
                         style="margin-right: 230px"></div>
                    <div style="width: 230px; position: absolute; top: 60px; right: 0"
                         layoutH="80"></div>
                </div>
            </div>
        </div>

    </div>


</div>


<div id="footer">Copyright &copy; 2010 <a href="#" target="dialog">lxj</a></div>


</body>
</html>
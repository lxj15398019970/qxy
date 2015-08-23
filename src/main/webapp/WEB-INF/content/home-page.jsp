<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>清新源室内空气净化服务有限公司</title>
    <%@include file="/static2/common/meta.jsp" %>
    <%@include file="/static2/common/head-style.jsp" %>

</head>
<body>

<!---头部开始-->
<div class="header">
    <div class="headCon">
        <div class="head">
            <div class="logo"><a href="${ctx}/homePage.action"></a></div>

            <div class="mainnav">
                <ul>
                    <li><a href="${ctx}/home-page.action" id="mainnav1"><em>首页</em></a></li>
                    <li><a href='/gysj/index_13.aspx' id="mainnav2"><em>关于清新源</em></a></li>
                    <li><a href='/xwzx/list_21.aspx' id="mainnav4"><em>新闻中心</em></a></li>
                    <li><a href='/rlzy/index_37.aspx' id="mainnav6"><em>经典案例</em></a></li>
                    <li><a href='/lxwm/index_45.aspx' id="mainnav7"><em>联系我们</em></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!---头部结束-->


<!--banner Start-->
<div class="banner">
    <div id="cssbox">
        <ul id="ulid">
            <c:forEach items="${bannerList}" var="item">
                <li>
                    <img src="${item.image}" style="width:1000px; height:350px;vertical-align: middle;display: block">
                </li>

            </c:forEach>

        </ul>
    </div>
    <div class="tab_ul">
        <ul id="tabulid">

            <li></li>

            <li></li>

            <li></li>

            <li></li>

            <li></li>


        </ul>
    </div>
    <script type="text/javascript">
        var width = jQuery("body").width();
        new Marquee(
                {
                    MSClassID: "cssbox",
                    ContentID: "ulid",
                    TabID: "tabulid",
                    Direction: 0,
                    Step: 0.3,
                    Width: width,
                    Height: 350,
                    Timer: 20,
                    DelayTime: 5000,
                    WaitTime: 0,
                    ScrollStep: 200,
                    SwitchType: 2,
                    AutoStart: 1
                });
    </script>
</div>
<!--banner End-->

<!--main Start-->
<div class="main">
    <!--Home_left Start-->
    <div class="Home_left">
        <div class="Home_tab">
            <!--图片轮换-->
            <div class="T_ban">
                <div class="ban">
                    <ul>
                        <c:forEach items="${allNews}" var="item">

                            <li>
                                <a href='/xwzx/info_70.aspx?itemid=7085'><img src="${item.headImage}"></a>
                                <em><a href='/xwzx/info_70.aspx?itemid=7085'>${item.title}</a></em>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="hd">
                    <ul>

                        <li>1</li>

                        <li>2</li>

                        <li>3</li>

                        <li>4</li>
                        <li>5</li>

                    </ul>
                </div>

                <script type="text/javascript">
                    jQuery(".T_ban").slide({mainCell: ".ban ul", interTime: 5000, delayTime: 3000, autoPlay: true});
                    jQuery(".T_ban .hd ul li:last").attr("style", "border-right:none;");
                </script>
            </div>
            <!--图片轮换 End-->

        </div>

        <div class="Home_news" id="AutoTable1">
            <div class="title">

                <h2>
                    <a href='/xwzx/list_21.aspx'>更多>></a>
                    <span id="titlebtn1"></span>
                    <span id="titlebtn2"></span>
                </h2>


            </div>
            <div class="reg" name="AutoContent">
                <div style="display: none;">
                    <ul>


                        <c:forEach items="${ynNews}" var="item">

                            <li><span>${item.time}</span><a
                                    href='/xwzx/info_21.aspx?itemid=7099'>${item.title}</a></li>

                        </c:forEach>

                    </ul>
                </div>

                <div style="display: block;">
                    <ul>

                        <c:forEach items="${gsNews}" var="item">

                            <li><span>${item.time}</span><a
                                    href='/xwzx/info_21.aspx?itemid=7099'>${item.title}</a></li>

                        </c:forEach>

                    </ul>
                </div>


            </div>
        </div>
        <div class="clear"></div>

        <div class="Home_project">
            <div class="imgscroll">
                <div class="hd"></div>
                <div class="bd">
                    <ul>

                        <c:forEach items="${cases}" var="item">


                            <li>
                                <a href="/qxcy/info_18.aspx?itemid=1845&lcid=7&id=6"><img class="diapo" border="0"
                                                                                          src="${item.headImage}"></a>

                                <p><a href="/qxcy/info_18.aspx?itemid=1845&lcid=7&id=6">${item.caseName}</a></p>
                            </li>
                        </c:forEach>


                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <script type="text/javascript">
                jQuery(".imgscroll").slide({mainCell: ".bd ul", autoPlay: true, effect: "leftMarquee", vis: 3, interTime: 20, trigger: "click"});</script>

        </div>


    </div>
    <!--Home_left End-->

    <!--Home_right Start-->
    <div class="Home_right">

        <!--滚动公告 End-->
        <div class="Home_placar">
            <div class="hd"> 关于我们</div>
            <div class="bd">
                ${company.detail}
            </div>
            <a href='/xwzx/list_21.aspx'>更多>></a>
        </div>

    </div>
    <!--Home_right End-->
</div>

<!--foot Start-->
<div class="footWrap">
    <div class="foot">
    </div>
</div>
<!--foot End-->

<!--弹出框 End-->
<script type="text/javascript">
    jQuery(".Imglist a.a1").click(function () {
        jQuery(".showbg,.showbox").show();
    });
    jQuery(".showbox .close").click(function () {
        jQuery(".showbg,.showbox").hide();
    });

</script>

<script type="text/javascript">
    AutoTables("AutoTable1");
</script>


</body>
</html>
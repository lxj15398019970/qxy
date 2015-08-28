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
<%@include file="/static2/common/banner.jsp" %>

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
                                <a href="${item.url}"><img src="${item.headImage}"></a>
                                <em><a href="${item.url}">${item.title}</a></em>
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
                    <a href="${ctx}/home-page!more.action">更多>></a>
                    <span id="titlebtn1"></span>
                    <span id="titlebtn2"></span>
                </h2>


            </div>
            <div class="reg" name="AutoContent">
                <div style="display: none;">
                    <ul>
                        <c:forEach items="${gsNews}" var="item">

                            <li><span>${item.time}</span><a
                                    href="${item.url}">${item.title}</a></li>

                        </c:forEach>

                    </ul>
                </div>

                <div style="display: block;">
                    <ul>

                        <c:forEach items="${ynNews}" var="item">

                            <li><span>${item.time}</span><a
                                    href="${item.url}">${item.title}</a></li>

                        </c:forEach>

                    </ul>
                </div>


            </div>
        </div>
        <div class="clear"></div>

        <div class="Home_project">
            <em></em>

            <div class="imgscroll">
                <div class="hd"></div>
                <div class="bd">
                    <ul>
                        <c:forEach items="${cases}" var="item">
                            <li>
                                <a href="${item.url}"><img class="diapo" border="0"
                                                           src="${item.headImage}"></a>

                                <p><a href="${item.url}">${item.caseName}</a></p>
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
        <div>
            <div class="hd"> 关于我们</div>
            <div style="border-top:1px solid #000">
                ${cdetail}
            </div>
            <div>
                <a href="${curl}">更多>></a>
            </div>
        </div>

    </div>
</div>

<%@include file="/static2/common/foot.jsp" %>

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
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
<!---头部结束-->


<!--banner Start-->
<div class="banner">
    <div id="cssbox">
        <ul id="ulid">
            <c:forEach items="${bannerList}" var="item">
                <li>
                    <img src="${item.image}" style="width:1000px;height:350px;vertical-align:middle">
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

<div class="contain">
    <!--sidebar End-->

    <div class="sidebar">

        <ul>

            <li
                    class="acur"><a
                    href="${ctx}/home-page!one.action?type=company">公司简介</a></li>

        </ul>

    </div>
    <!--content Start-->
    <div class="content">

        <!--newsInfo Start-->
        <div class="newsInfo">
            <img width="799" border="0" height="600" src="${company.headImage}" style="width:521px;height:530px;">

            <div class="Info_txt">
                ${company.detail}
            </div>
        </div>
    </div>

</div>

<!--contain End-->

<div class="containboot"></div>


<!--foot Start-->
<div class="footWrap">
    <div class="foot">
    </div>
</div>
<!--foot End-->


</body>
</html>
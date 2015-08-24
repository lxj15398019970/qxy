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
<!--banner End-->


<!--contain Start-->
<div class="contain">
    <!--sidebar Start-->
    <div class="sidebar">


        <ul>

            <li   <c:if test="${type ==1 || type==null ||type ==''}">class="acur"</c:if> id="menuId21"><a href="${ctx}/home-page!more.action?type=1">公司新闻</a></li>

            <li   <c:if test="${type ==0}">class="acur"</c:if>><a href="${ctx}/home-page!more.action?type=0">行业资讯</a></li>


        </ul>



    </div>
    <!--sidebar End-->

    <!--content Start-->
    <div class="content">

        <!--news Start-->
        <div class="news">
            <ul>


                <c:forEach items="${gsNews}" var="item">

                    <li><span>${item.time}</span><a href="${item.url}">${item.title}</a></li>


                </c:forEach>


            </ul>
        </div>


    </div>
    <!--content End-->


</div>

<!--contain End-->

<div class="containboot"></div>


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
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

<div class="contain">
    <!--sidebar Start-->
    <div class="sidebar">

        <ul>

            <li
                    <c:if test="${news.newsType ==1}">class="acur"</c:if> id="menuId21"><a
                    href="${ctx}/home-page!more.action?type=1">公司新闻</a></li>

            <li <c:if test="${news.newsType ==0}">class="acur"</c:if>><a
                    href="${ctx}/home-page!more.action?type=0">行业资讯</a>
            </li>

        </ul>

    </div>
    <!--sidebar End-->

    <!--content Start-->
    <div class="content">

        <!--newsInfo Start-->
        <div class="newsInfo">
            <h1 class="Info_title">${news.title}</h1>
            <h4 class="Info_time">发布时间:${news.time}</h4>

            <div class="Info_txt">
                ${news.content}
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
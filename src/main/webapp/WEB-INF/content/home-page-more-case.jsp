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
            <li class="acur"><a
                    href="${ctx}/home-page!moreCase.action">经典案例</a></li>

        </ul>

    </div>
    <!--sidebar End-->

    <!--content Start-->
    <div class="content">

        <div class="honor">

            <ul>

                <c:forEach items="${cases}" var="item">

                    <li>
                        <a href="${item.url}"><img
                                src="${item.headImage}"></a>

                        <p>
                            <a href="${item.url}">${item.caseName}</a>
                        </p>

                    </li>

                </c:forEach>
            </ul>
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
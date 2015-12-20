<%@ page contentType="text/html;charset=UTF-8" %>
<div class="header">
    <div class="headCon">
        <div class="head">
            <a href="${ctx}/home-page.action" class="logo"></a>

            <div class="mainnav">
                <ul>
                    <li><a href="${ctx}/home-page.action" id="mainnav1"><em>首页</em></a></li>
                    <li><a href="${ctx}/home-page!one.action?type=company" id="mainnav2"><em>关于清新源</em></a></li>
                    <li><a href="${ctx}/home-page!more.action" id="mainnav3"><em>新闻中心</em></a></li>
                    <li><a href="${ctx}/home-page!moreCase.action" id="mainnav4"><em>经典案例</em></a></li>
                    <li><a href="${ctx}/home-page!morePartner.action" id="mainnav6"><em>合作单位</em></a></li>
                    <li><a href="${ctx}/home-page!contact.action" id="mainnav5"><em>联系我们</em></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

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


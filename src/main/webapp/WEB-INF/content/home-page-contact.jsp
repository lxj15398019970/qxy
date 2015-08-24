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
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />


    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
        }

        .iw_poi_title {
            color: #CC5522;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            padding-right: 13px;
            white-space: nowrap
        }

        .iw_poi_content {
            font: 12px arial, sans-serif;
            overflow: visible;
            padding-top: 4px;
            white-space: -moz-pre-wrap;
            word-wrap: break-word
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
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
                    href="${ctx}/home-page!contact.action">联系我们</a></li>

        </ul>

    </div>
    <!--content Start-->
    <div class="content">

        <!--newsInfo Start-->
        <div class="newsInfo">
            <div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>

            <div class="Info_txt">
                <p> 地址：喀什市南湖路（阳光小区）商业街6-117、6-217、6-218</p>

                <p> 电话：0998-2303055 </p>

                <p>移动电话:13657539658 15292917978</p>

                <p>QQ:382627019</p>

                <p>邮箱:382627019@qq.com</p>
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


<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(76.021438, 39.447972);//定义一个中心点坐标
        map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }
    initMap();//创建和初始化地图
</script>

</html>
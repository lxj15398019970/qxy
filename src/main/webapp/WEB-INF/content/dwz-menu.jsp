<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script src="${ctx}/static/dwz/js/app.js" type="text/javascript"></script>
<div class="accordion" fillSpace="sidebar">
    <div class="accordionContent page-sidebar">
        <ul class="page-sidebar-menu">


            <li <c:if test="${type == 'user'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-dashboard"></i>
                    <span class="title ">系统管理</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/account/user.action" target="navTab" rel="w_user">用户管理</a></li>
                    <li><a href="${ctx}/account/role.action" target="navTab" rel="w_role">角色管理</a></li>

                </ul>
            </li>


            <li    <c:if test="${type == 'banner'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">banner管理</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/banner/banner.action" target="navTab" rel="w_banner">banner管理</a></li>
                </ul>
            </li>


            <li    <c:if test="${type == 'icase'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">经典案例</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/icase/icase.action" target="navTab" rel="w_icase">经典案例</a></li>
                </ul>
            </li>


            <li    <c:if test="${type == 'news'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">新闻管理</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/news/news.action" target="navTab" rel="w_news">新闻管理</a></li>
                </ul>
            </li>

            <li    <c:if test="${type == 'company'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">公司简介</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/company/company.action" target="navTab" rel="w_company">公司简介</a></li>
                </ul>
            </li>

            <li    <c:if test="${type == 'partner'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">合作单位</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/partner/partner.action" target="navTab" rel="w_partner">合作单位</a></li>
                </ul>
            </li>


        </ul>

    </div>
</div>

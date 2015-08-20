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


            <li    <c:if test="${type == 'agent'}">
                class = "active"
            </c:if>
                    >
                <a href="javascript:;" class="sider-menu">
                    <i class="icon-cogs"></i>
                    <span class="title ">代理商管理</span>

                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li><a href="${ctx}/agent/agent.action" target="navTab" rel="w_agent">代理商管理</a></li>
                </ul>
            </li>


        </ul>

    </div>
</div>

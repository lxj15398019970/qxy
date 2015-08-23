<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
    <div class="pageHeader">
        <form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/icase/icase.action" method="post">
            <input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
            <input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
            <input type="hidden" name="page.order" id="order" value="${page.order}"/>
        </form>
    </div>
    <div class="dashed-line"></div>
    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li><a class="toolBar-btn" href="${ctx}/icase/icase!input.action" target="dialog" width="800" height="600" rel="w_banner">添加</a>
                </li>
                <li><a class="toolBar-btn2" href="${ctx}/icase/icase!delete.action?id={sid_user}" target="ajaxTodo"
                       title="确定要删除吗？" warn="请选择一条记录">删除</a></li>
                <li><a class="toolBar-btn" href="${ctx}/icase/icase!input.action?id={sid_user}" target="dialog" width="800"
                       warn="请选择一条数据" height="600">查看/修改</a></li>
            </ul>
        </div>
        <div layouth="111">
            <table class="list" width="98%">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="5%">案例名称</th>
                    <th width="5%">案例头图</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="page.result">
                    <tr target="sid_user" rel="${id}">
                        <td>${id}&nbsp;</td>
                        <td>${caseName}&nbsp;</td>
                        <td><img src="${headImage}" width="50px;" height="50px"></td>
                    </tr>
                </s:iterator>
                </tbody>
            </table>
        </div>

        <div class="panelBar">
            <div class="pages">
                <span>共${page.totalCount}条,共${page.totalPages}页</span>
            </div>

            <div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.pageSize}"
                 pageNumShown="10" currentPage="${page.pageNo}"></div>

        </div>

    </div>
</div>

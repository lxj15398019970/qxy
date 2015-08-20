/**
 * Created by sfdeng on 14-2-17.
 */
$(function () {
    // 全局绑定事件
    App.Event();

});
var App = {
    statusCode: {
        ok: 200,
        error: 300,
        timeout: 301
    },
    _page: {
        totalCount: "totalCount",
        numPerPage: "numPerPage",
        currentPage: "currentPage",
        pageNumShown: "pageNumShown",
        totalPages: "totalPages",
        pageNum: "pageNum"
    },
    _set: {
        loginUrl: 'login'
    },
    redirectLogin: function () {
        window.location.href = this._set.loginUrl;
    },
    ajaxError: function (xhr, ajaxOptions, thrownError) {
        if (alertMsg) {
            alertMsg.error("<div>Http status: " + xhr.status + " "
            + xhr.statusText + "</div>" + "<div>ajaxOptions: "
            + ajaxOptions + "</div>" + "<div>thrownError: "
            + thrownError + "</div>" + "<div>" + xhr.responseText
            + "</div>");
        } else {
            alert("Http status: " + xhr.status + " " + xhr.statusText
            + "\najaxOptions: " + ajaxOptions + "\nthrownError:"
            + thrownError + "\n" + xhr.responseText);
        }
    },
    ajaxDone: function (json) {
        if (json.statusCode == App.statusCode.error) {
            if (json.message && alertMsg)
                alertMsg.error(json.message);
        }
        if (json.statusCode == App.statusCode.ok) {
            if (json.message && alertMsg)
                alertMsg.info(json.message);
        } else if (json.statusCode == App.statusCode.timeout) {
            App.redirectLogin();
        } else {
            // 其它成功的处理
        }
        ;
    },
    /**
     * @description : 全局事件绑定
     * @constructor
     */
    Event: function () {

        /**
         * @description : 模态窗口触发绑定
         * @rule 《a class="dialog">xxx</a>
         */
        // $(document).on('click', ".dialog", function(e) {
        // console.log("弹出模态窗口....");
        // e.preventDefault();
        // // 获得url
        // var url = $(this).attr("rel");
// 
        // // 获得titile
        // var title = $(this).attr("title");
        // var $mainModel = $("#mainModal");
// 
        // $.post(url, {}, function(res) {
        // // 响应登录页面时跳转到登录页面
        // if (res.indexOf("loginPage") > 0) {
        // window.location.href = App._set.loginUrl;
        // } else {
        // $mainModel.html(res);
        // $mainModel.find(".modal-title").html(title);
        // $mainModel.modal({
        // keyboard : false,
        // backdrop : "static",
        // show : true
        // });
        // }
        // });
// 
        // });


    },
    // 分页处理
    handlePagination: function (_box) {
        var $p = $(_box || document);
        $(".pagination", $p).each(function () {
            var $pDiv = $(this);
            var totalCount = $pDiv.attr("totalCount");
            var numPerPage = $pDiv.attr("numPerPage");
            var currentPage = $pDiv.attr("currentPage");
            var pageNumShown = $pDiv.attr("pageNumShown");

            // 创建分页
            $pDiv.pagination(totalCount, {
                maxentries: totalCount, // 边缘页数
                num_edge_entries: 1, // 边缘页数
                current_page: currentPage - 1, // 边缘页数
                num_display_entries: pageNumShown, // 主体页数
                items_per_page: numPerPage, // 每页显示1项
                callback: function pageselectCallback(index) {
                    $("#pageNum").val(parseInt(index) + 1);
                    loadSearchForm();
                },
                prev_text: "上一页",
                next_text: "下一页"
            });
        });
    },

    initUI: function (_box) {
        var $p = $(_box || document);
        // 左侧菜单点击处理-开始
        $("a.ajaxify", $p).on('click', function (e) {
            e.preventDefault();
            $("#siderbar").children('li.active').removeClass('active');
            $(this).parents('li').addClass('active');
            var url = $(this).attr("href");
            var pageContent = $('#mainContent');
            $.post(url, {}, function (data) {
                // 响应登录页面时跳转到登录页面
                pageContent.html(data);
                App.handlePagination(pageContent);
            });
        });// 左侧菜单点击处理-结束

        console.log("app init...")
        // 绑定弹出层
    },
    // 对主页横向的菜单进行事件绑定
    initNav: function () {
        jQuery('#navBar').on('click', ' li > a.navTab', function (e) {
            e.preventDefault();
            var url = $(this).attr("href");
            if (url === '#') {
                alertMsg.warn('功能尚未上线');
                return false;
            }
            var pageContent = $('#pageContent');
            // 清除已选中的状态
            var menuContainer = jQuery('#navBar');
            menuContainer.children('li.active').removeClass('active');
            // 标识当前为选中状态
            $(this).parents('li').addClass('active');
            $.ajax({
                type: 'POST',
                url: url,
                data: {},
                dataType: "html",
                cache: false,
                success: function (data, textStatus, jqXHR) {
                    // 响应登录页面时跳转到登录页面
                    if (data.indexOf("loginPage") > 0) {
                        window.location.href = App._set.loginUrl;
                    } else {
                        pageContent.html(data);
                        App.initUI(pageContent);
                    }
                },
                error: function (xhr, status, text) {
                },
                statusCode: {
                    404: function () {
                        alert("您请求的页面不存在！");
                    },
                    502: function () {
                        alert("网络或者系统故障!");
                    }
                }
            });
        });
    }
}





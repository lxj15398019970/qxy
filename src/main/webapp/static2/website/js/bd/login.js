$(function () {
    /**
     * 刷新验证码
     */
    $('#captchaImg').on('click', function () {
        $('#captchaImg').attr('src', '../rest/kaptcha.jpg?' + Math.floor(Math.random() * 100));
    });

    /**
     * 登录按钮下拉菜单
     */
    var $loginNameToggleBox = $('#loginNameToggleBox'),
        $loginNameToggle = $('#loginNameToggle'),
        $loginToggleFun = $('#loginToggleFun'),
        timer = null;
    $loginNameToggleBox.on('mouseover', [$loginNameToggle, $loginToggleFun], function () {
        clearInterval(timer);
        setTimeout(function () {
            $loginToggleFun.show();
        }, 300);
    });
    $loginNameToggleBox.on('mouseout', [$loginNameToggle, $loginToggleFun], function () {
        clearInterval(timer);
        timer = setTimeout(function () {
            $loginToggleFun.hide();
        }, 300);
    })
    /**
     * 通知公告
     */
    var noticeList;
    $.ajax({ //一个Ajax过程
        type: "post", //以post方式与后台沟通
        url: rootPath + "/rest/topnotice",
        dataType: 'json',
        success: function (json) {
            noticeList = json[0];
            var len = noticeList.length > 5 ? 5 : noticeList.length;
            for (var i = 0; i < len; i++) {
                var div = $("#notice");
                var oneNotice = '<p><a class=links href="../rest/noticel/' + noticeList[i].id + '">' + noticeList[i].noticeTitle + '</a></p>';
                if (i + 1 === len && noticeList.length > 5)
                    oneNotice = '<p><a class=links href="../rest/noticel" target=_blank>更多</a></p>';
                div.append(oneNotice);
            }
        }
    });
    /**
     * 在线咨询
     */
    $.ajax({ //一个Ajax过程
        type: "post", //以post方式与后台沟通
        url: rootPath+"/rest/topconsult",
        dataType: 'json',
        success: function (json) {
            consultList = json[0];
            var len = consultList.length > 5 ? 5 : consultList.length;
            for (var i = 0; i < len; i++) {
                var div = $("#consult");
                /* var date = new Date(consultList[i].consultDate);
                 var tt = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate(); */
                var oneConsult = '<p><a class=links href="../rest/consult/' + consultList[i].id + '">' + consultList[i].title + '</a></p>';
                if (i + 1 === len && consultList.length > 5)
                    oneConsult = '<p><a class=links href="../rest/consult" target=_blank>更多</a></p>';
                div.append(oneConsult);
            }
        }
    });
    /**
     *获取入学导读
     */
    var entrance_guide = "..//rest/entrance-guide.shtml";
    $.post(entrance_guide, function (result) {
        var div = $("#entrance");
        div.empty();
        var defaultCount = 5;
        var len = result.length > defaultCount ? defaultCount : result.length;
        for (var i = 0; i < len; i++) {
            var element = "<p><a href=" + result[i].url + " target=_blank>" + result[i].moduleName + "</a></p>";
            if (i + 1 === len && result.length > 5)
                element = "<p><a href='../rest/entranceGuide/list' target=_blank>更多</a></p>";
            div.append(element);
        }
    });

    /**
     * 资料下载
     */
    var document_down = "../rest/document-down.shtml";
    $.post(document_down, function (result) {
        var div = $("#document-down");
        div.empty();
        for (var i = 0; i < result.length; i++) {
            var element = "<p><a target='_blank' href=" + result[i].downUrl + "><span class=txt>" + result[i].documentName + "</span></a></p>";
            if (i + 1 === result.length && result.length > 5)
                element = "<p><a href='../download/list' target=_blank>更多</a></p>";
            div.append(element);
        }
    });

});
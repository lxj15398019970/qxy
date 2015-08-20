/**
 * 全局UI对象
 */
var CommonUI = {
	$model : $("#mainModal"),
	$pageContent : $('#pageContent'),
	$imgModel : $("#imgModal"),
	ctx : ""
};





var App = function(appName, appVersion) {
	this.appName = appName;
	this.appVersion = appVersion;

	// 全局模拟单选事件
//	$(document).on('click', ".radioBase .radioItem", function(e) {
//		console.log("radio click...");
//		var $this = $(this);
//		var hidden = $this.parent().find("input[type='hidden']");
//		// 移除全部状态
//		$this.parent().find(".radioItem").removeClass("active");
//		$this.addClass("active");
//		// 值给hidden元素
//		hidden.val($this.attr("value"));
//	});

	// 全局函数
	AJAX_GLOBAL.global();

	// 处理nav绑定
	$("#navBar").find("li>a").click(function(e) {
		e.preventDefault();
		var $this = $(this);
		var url = $(this).attr("url");
		$this.parent().addClass("active").siblings().removeClass("active");
		app.reloadMainContent(url)

	});

	CommonUI.ctx = $("#ctx-base").attr("url");
	App._set.loginUrl = CommonUI.ctx + "/bd/login";
};

App.prototype.nofind = function(src, _this) {
	var img = _this;
	img.src = src;
	img.onerror = null; // 控制不要一直跳动
};

App.prototype.handleInit = function() {

	$('.form-vlidate').validator({
		ignore : ':hidden',
		msgClass : 'n-bottom',
		valid : function(form) {
			var $form = $(form);
			var isPass = true;
			// 判断是否有回调函数
			var callBack = $form.attr("callBack");
			if (callBack)
				isPass = eval(callBack)();

			if (isPass == true) {
				var me = this;
				// 提交表单之前，hold住表单，防止重复提交
				me.holdSubmit();
				app.reloadMainContent($form.attr("action"), "", form);
			}

		}
	});

	$('.ajax-vlidate').validator({
		ignore : ':hidden',
		msgClass : 'n-bottom',
		valid : function(form) {
			var $form = $(form);
			var isPass = true;
			// 判断是否有回调函数
			var callBack = $form.attr("callBack");
			if (callBack)
				isPass = eval(callBack)();

			var resultBack = $form.attr("resultBack");

			if (isPass == true) {
				var me = this;
				// 提交表单之前，hold住表单，防止重复提交
				// me.holdSubmit();

				resultBack = eval(resultBack);
				app.jsonForm($form.attr("action"), "", form, resultBack);
			}

		}
	});

	var handlePagination = function(_box) {
		var $p = $(_box || document);
		$(".pagination", $p).each(
				function() {
					var $pDiv = $(this);
					var totalCount = $pDiv.attr("totalCount");
					var numPerPage = $pDiv.attr("numPerPage");
					var currentPage = $pDiv.attr("currentPage");
					var pageNumShown = $pDiv.attr("pageNumShown");
					var totalPages = $pDiv.attr("totalPages");

					// 传递页数
					$pDiv.parent().find(".go-pagination-num span").html(
							"共" + totalPages + "页，去第 ");

					$pDiv.parent().find(".go-pagination").attr("totalCount",
							totalPages);

					// 创建分页
					$pDiv.pagination(totalCount, {
						maxentries : totalCount, // 边缘页数
						num_edge_entries : 1, // 边缘页数
						current_page : currentPage - 1, // 边缘页数
						num_display_entries : pageNumShown, // 主体页数
						items_per_page : numPerPage, // 每页显示1项
						callback : function pageselectCallback(index) {
							$("#pageNum").val(parseInt(index) + 1);
							var form = $(".paginationForm");
							app.reloadMainContent(form.attr("action"), form
									.serialize(), form);
						},
						prev_text : "上一页",
						next_text : "下一页"
					});
					if (totalPages <= 1) {
						$pDiv.hide();
						$pDiv.parent().find(".go-pagination").hide();
					}
				});
	};

//	handlePagination();

	// checkbox模拟
	$('input[type="checkbox"],input[type="radio"]').iCheck({
		checkboxClass : 'icheckbox_square-blue',
		radioClass : 'iradio_square-blue',
		increaseArea : '20%' // optional
	});
};

App.prototype.navTabSearch = function(form) {
	var $form = $(form);
	if (form[App._page.pageNum])
		form[App._page.pageNum].value = 1;
	reloadMainContent($form.attr('action'), $form.serializeArray());
	return false;
};

App.prototype.loadSearchForm = function() {
	var $form = $("#searchForm");
	this.reloadMainContent($form.attr('action'), $form.serializeArray());
};

App.prototype.validateCallback = function(form, callback) {
	var $form = $(form);
	// if (!$form.valid()) {
	// return false;
	// }
	var _submitFn = function() {
		$.ajax({
			type : form.method || 'POST',
			url : $form.attr("action"),
			data : $form.serializeArray(),
			dataType : "json",
			cache : false,
			success : callback || App.ajaxDone,
			error : App.ajaxError
		});
	};
	_submitFn();
	return false;
};

/**
 * Dialog上的form提交成功后的处理函数
 * 
 * @param json
 */
App.prototype.dialogAjaxDone = function(json) {
	App.ajaxDone(json);
	if (json.statusCode == App.statusCode.ok) {
		alertMsg.info(json.message);
		$("#mainModal").modal('hide');
		$("#siderbar.nav-tabs > .active > a").click();
	}
};

function handleNavBtn() {
	var $this = $(this);
	var url = $this.attr("url");
	reloadMainContent(url);
}

var toggleStatus = function(moduleCode, _this) {
	var $this = $(_this);
	if (moduleCode == undefined || moduleCode == "")
		return;
	var obj = $("#nav-flow").find('[moduleCode ="' + moduleCode + '"]');
	obj.find("i").addClass("icon-complete").bind("click", handleNavBtn);
	reloadMainContent($this.attr("url"));
};


/**
 * 数据,页面加载填充方法
 */

/**
 * 返回json处理
 * 
 * @param url
 * @param data
 * @param form
 * @param callBack
 * @returns {boolean}
 */
App.prototype.jsonForm = function(url, data, form, callBack) {
	var _this = this;
	var $form = $(form);
	var datas = data || $form.serialize();
	$.ajax({
		type : 'POST',
		url : url,
		data : datas,
		dataType : "json",
		cache : false,
		success : callBack,
		error : function(xhr, status, text) {
		},
		statusCode : {
			404 : function() {
				alert("您请求的页面不存在！");
			},
			502 : function() {
				alert("网络或者系统故障!");
			}
		}
	});

	return false;
};
/**
 * 填充页面
 * 
 * @param {Object}
 *            url
 * @param {Object}
 *            _data
 * @param {Object}
 *            _this
 */
App.prototype.reloadMainContent = function(url, _data, _form) {
	var pageContent = CommonUI.$pageContent;
	var _this = this;
	var $form = $(_form);
	var datas = _data || $form.serialize();
	$.ajax({
		type : 'POST',
		url : url,
		data : datas,
		dataType : "html",
		cache : false,
		success : function(data, textStatus, jqXHR) {
			// 响应登录页面时跳转到登录页面
			if (data.indexOf("loginPage") > 0) {
				window.location.href = App._set.loginUrl;
			} else {
				pageContent.html(data);
				// 绑定全局事件
				_this.handleInit();
			}
		},
		error : function(xhr, status, text) {
		},
		statusCode : {
			404 : function() {
				alert("您请求的页面不存在！");
			},
			502 : function() {
				alert("网络或者系统故障!");
			}
		}
	});
	return false;
};

/**
 * 数据填充模版
 * 
 * @param {Object}
 *            url
 * @param {Object}
 *            dom
 * @param {Object}
 *            template
 * @param {Object}
 *            data
 * @param {Object}
 *            callBack
 */
App.prototype.fillJsonToTempalte = function(url, dom, template, data, callBack) {
	data = data || {};
	AjaxUtil.get(url, data, function(result) {
		WebPage.refreshTemplate($(dom), result, $(template));
		if (callBack)
			callBack(result);
	}, App.ajaxError);
};

/**
 * 数据填充模版 弹出model窗口
 * 
 * @param {Object}
 *            url
 * @param {Object}
 *            dom
 * @param {Object}
 *            template
 * @param {Object}
 *            data
 * @param {Object}
 *            modelId
 */
App.prototype.fillJsonToTempalteModel = function(url, dom, template, data,
		modelId) {
	this.fillJsonToTempalte(url, dom, template, data, function(result) {
		CommonUI.$model.modal('show').html($(modelId));
	});

};

App.prototype.postJson = function(url, data, callBack) {
	data = data || {};
	AjaxUtil.post(url, data, function(result) {
		App.ajaxDone(result, function() {
			callBack(result);
		});
	}, App.ajaxError);
};

/**
 * 静态函数
 */

App.ajaxError = function(xhr, ajaxOptions, thrownError) {
	if (alertMsg) {
		alertMsg.error("<div>Http status: " + xhr.status + " " + xhr.statusText
				+ "</div>" + "<div>ajaxOptions: " + ajaxOptions + "</div>"
				+ "<div>thrownError: " + thrownError + "</div>" + "<div>"
				+ xhr.responseText + "</div>");
	} else {
		alert("Http status: " + xhr.status + " " + xhr.statusText
				+ "\najaxOptions: " + ajaxOptions + "\nthrownError:"
				+ thrownError + "\n" + xhr.responseText);
	}

};

App.redirectLogin = function() {
	window.location.href = App._set.loginUrl;
};

App.ajaxDone = function(json, callBack) {
	if (json.statusCode == App.statusCode.error) {
		if (json.message && alertMsg)
			alertMsg.error(json.message);

		callBack();
	}
	if (json.statusCode == App.statusCode.ok) {
		if (json.message && alertMsg)
			alertMsg.info(json.message);

	} else if (json.statusCode == App.statusCode.timeout) {
		App.redirectLogin();
	}
};

App.statusCode = {
	ok : 200,
	error : 300,
	timeout : 301
};

App._set = {
	loginUrl : ''
};

/**
 * 分页按钮事件
 * 
 * @param _this
 * @returns {boolean}
 */
App.prototype.goPage = function(_this) {
	var $this = $(_this);
	var goPagination = $this.closest(".go-pagination");
	var index = goPagination.find(":text").val();
	var total = parseInt(goPagination.attr("totalCount"));

	if (index < 1)
		index = 1;
	else if (index > total)
		index = total;

	$("#pageNum").val(index);

	this.loadSearchForm();
	return false;
};

App.prototype.showBigImg = function(_this) {
	var $this = $(this);
	CommonUI.$imgModel.find("img")[0].src = _this.src;
	CommonUI.$imgModel.modal('show');
};

/**
 * 分页按钮事件
 * 
 * @param _this
 * @returns {boolean}
 */
function goPage(_this) {
	var $this = $(_this);
	var goPagination = $this.closest(".go-pagination");
	var index = goPagination.find(":text").val();
	var total = parseInt(goPagination.attr("totalCount"));

	if (index < 1)
		index = 1;
	else if (index > total)
		index = total;

	$("#pageNum").val(index);

	loadSearchForm();
	return false;
}
 

App.validateForm = function() {

};

 


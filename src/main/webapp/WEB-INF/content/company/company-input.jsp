<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/company/company!save.action" class="pageForm required-validate"
              onsubmit="return iframeCallback(this,dialogAjaxDone)" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${company.id}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>头图:</label>
                    <c:if test="${company.id > 0}">
                        <img src="${company.headImage}" width="50px" height="50px">
                        <input type="file" name="companyImage">
                    </c:if>

                    <c:if test="${company == null}">
                        <input type="file" name="companyImage">
                    </c:if>
                </div>

                <div class="unit">
                    <label>新闻内容:</label>
                    <textarea class="editor textInput" style="width: 800px; height: 400px;"
                              name="detail">${company.detail}</textarea>
                </div>


            </div>

            <div class="formBar">
                <ul>
                    <li>
                        <div class="buttonActive">
                            <div class="buttonContent">
                                <button type="submit" class="toolBar-btn">提交</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="button">
                            <div class="buttonContent">
                                <button type="button" class="close toolBar-btn2">取消</button>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

        </form>

    </div>
</div>

<script>
    $(function () {
        //根据省份获取城市列表
        var id = "${id}";

        $("#province").change(function () {
            var provinceId = $(this).val();
            if (provinceId != '') {
                $.post("city/city!getCities.action", {
                    provinceId: provinceId
                }, function (result) {
                    $("#city").empty();
                    var option = "<option value=''>--请选择--</option>";
                    $("#city").append(option);
                    for (var i = 0; i < result.length; i++) {
                        option = '<option value="' + result[i].id + '">' + result[i].cityName + '</option>'
                        $("#city").append(option);
                    }

                })
            }

        });


        $("#city").change(function () {
            var cityId = $(this).val();
            if (id == "") {
                if (cityId != '') {
                    $.post("area/area!getAreas.action", {
                        cityId: cityId
                    }, function (result) {
                        $("#area").empty();
                        for (var i = 0; i < result.length; i++) {
                            var inputCheckbox = result[i].areaName + '<input type="checkbox" checked name="areaIds" value="' + result[i].id + '" id="' + result[i].id + '">'
                            $("#area").append(inputCheckbox);
                        }

                    })
                }
            }

        })

    })


</script>
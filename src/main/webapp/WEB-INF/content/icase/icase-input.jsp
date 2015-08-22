<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
    <div class="pageContent">

        <form method="post" action="${ctx}/icase/icase!save.action" class="pageForm required-validate"
              onsubmit="return iframeCallback(this,dialogAjaxDone)" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${id}"/>

            <div class="pageFormContent" layoutH="70">

                <div class="unit">
                    <label>案例名称:</label>
                    <input type="text" name="caseName" value="${caseName}">
                </div>


                <div class="unit">
                    <label>案例头图:</label>
                    <c:if test="${id > 0}">
                        <img src="${headImage}" width="50px" height="50px">
                        <input type="file" name="caseImage">
                    </c:if>

                    <c:if test="${id == null}">
                        <input type="file" name="caseImage">
                    </c:if>
                </div>


                <div class="unit">
                    <label>案例内容:</label>
                    <textarea class="editor textInput" style="width: 670px; height: 250px;"
                              name="caseContent">${caseContent}</textarea>
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
/**
 * Created by sfdeng on 14/12/25.
 */
$(function(){
    var UI = {
        $title : $('#title'),
        $phone : $('#phone'),
        $question : $('#question'),
        $btnAsk : $('#btn-ask')
    };
    UI.$btnAsk.on('click',function(){
        if(UI.$title.val().trim()==""){
            tips("提示","标题不能为空");
            return false;
        }
        if(UI.$title.val().trim().length>50){
            $('#myModal').modal('show');
            tips("提示","标题不能超过50个字");
            return false;
        }
        if(UI.$phone.val().trim()==""){
            tips("提示","联系方式不能为空");
            return false;
        }
        if(UI.$phone.val().length!=0){
            var mobile = /^1[3|4|5|6|7|8|9][0-9]{1}[0-9]{8}$/;
            var mobileVal = UI.$phone.val();
            var mobileResult = mobile.test(mobileVal);
            if (mobileResult == false) {
                tips("提示","联系方式格式不正确");
                return false;
            }
        }
        if(UI.$question.val().trim()==""){
            tips("提示","提问内容不能为空");
            return false;
        }
        if(UI.$question.val().trim().length>300){
            $('#myModal').modal('show');
            tips("提示","提问内容不能超过300个字");
            return false;
        }
        $.ajax({
            type: "POST",
            url: rootCtx+"/rest/consult/save",
            data:$("#form").serialize(),
            dataType : 'json',
            success: function (result) {
            	tips("提示","感谢您的提问，您的问题将在老师回复后显示，页面3秒后跳转");
                var i = 4;
                setInterval(function(){
                    if (i>0){
                        i--;
                        $('#tips').text("感谢您的提问，您的问题将在老师回复后显示，页面"+i+"秒后跳转");
                    }else{
                        window.location.href=rootCtx+"/rest/consult";
                    }
                },1000);
            },
            error: function (result) {
                tips("提示","提交失败，请稍后再试");
            }
        });
    });
    function tips(title,tips){
        $('#myModal').modal('show');
        $('#myModalLabel').text(title);
        $('#tips').text(tips);
    }
});
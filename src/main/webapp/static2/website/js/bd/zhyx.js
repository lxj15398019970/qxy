$(function () {
    $('#fullpage').fullpage({
        //sectionsColor: ['#9ed048', '#fff', '#f4f4f4', '#ffffff', '#f4f4f4', '#ffffff', '#f4f4f4', '#fff'],
        anchors: ['firstPage', 'secondPage', '3rdPage', 'fourPage', 'fivePage', 'sixPage', 'sevenPage', 'eightPage'],
        verticalCentered: false,
        navigation: true,
        slidesNavigation: true,
        navigationPosition: 'right',
        'afterLoad': function (anchorLink, index) {
            if (index == 1) {
                $('#header-top').animate({height: '115px'}, 'show');
                $('#footer').animate({height: '40px', padding: '20px 0'}, 'show');
                $('#pageContent').animate({marginTop: '20px'}, 'show');
                $('#tip-next').addClass('fadeInUp').show();
            } else {
                $('#tip-next').removeClass('fadeInUp').hide();
                $('#header-top').animate({height: '-20px'}, 'show');
                $('#footer').animate({height: '-20px', padding: 0}, 'show');
                $('#pageContent').animate({marginTop: '-5px'}, 'show');
            }
            if (index == 2) {
                $('#section1 .list-num-box').show().removeClass('fadeInUp').addClass('fadeInDown');
                $('#download-android,#download-appstore,#download-ewm').show().addClass('fadeIn')
            } else {
                $('#section1 .list-num-box').removeClass('fadeInDown').addClass('fadeInUp');
                $('#download-android,#download-appstore,#download-ewm').removeClass('fadeIn').hide();
            }
            if (index == 3) {
                $('#section2 .list-num-box').show().removeClass('fadeInUp').addClass('fadeInDown');
                $('#register-pic1,#register-pic2,#register-pic3').show().addClass('fadeIn');
            } else {
                $('#section2 .list-num-box').removeClass('fadeInDown').addClass('fadeInUp');
                $('#register-pic1,#register-pic2,#register-pic3').removeClass('fadeIn').hide();
            }
            if (index == 4) {
                $('#section3 .list-num-box').show().removeClass('fadeInUp').addClass('fadeInDown');
                $('#bind-pic1,#bind-pic2,#bind-pic3').show().addClass('fadeIn');
            } else {
                $('#section3 .list-num-box').removeClass('fadeInDown').addClass('fadeInUp');
                $('#bind-pic1,#bind-pic2,#bind-pic3').removeClass('fadeIn').hide();
            }
            if (index == 5) {
                $('#section4 .list-num-box').show().removeClass('fadeInUp').addClass('fadeInDown');
                $('#approve-pic1,#approve-pic2,#approve-pic3').show().addClass('fadeIn');
            } else {
                $('#section4 .list-num-box').removeClass('fadeInDown').addClass('fadeInUp');
                $('#approve-pic1,#approve-pic2,#approve-pic3').removeClass('fadeIn').hide();
            }
            if (index == 6) {
                $('#tip-next2').addClass('fadeInDown');
                $('img#logo').show().addClass('bounceIn');
                $('.num5-pic1').show().addClass('fadeIn');
            } else {
                $('#tip-next2').removeClass('fadeInDown');
                $('img#logo').removeClass('bounceIn').hide();
                $('.num5-pic1').removeClass('fadeIn').hide();
            }
            if (index == 7) {
                $('#section6 .list-num-box').show().removeClass('fadeInUp').addClass('fadeInDown');
            } else {
                $('#section6 .list-num-box').removeClass('fadeInDown').addClass('fadeInUp');
            }
            if (index == 8) {
                $('#section7-logoinfo').show().addClass('bounceIn');
                $('#num7-pic1').show().addClass('fadeIn');
            } else {
                $('#section7-logoinfo').removeClass('bounceIn').hide();
                $('#num7-pic1').removeClass('fadeIn').hide();
            }


        }
    })
})
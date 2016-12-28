<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>爆朋 CMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="${rc.contextPath}/static/manage/css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="${rc.contextPath}/static/manage/css/charisma-app.css" rel="stylesheet">
    <link href='${rc.contextPath}/static/manage/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${rc.contextPath}/static/manage/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/jquery.noty.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/elfinder.min.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/uploadify.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="${rc.contextPath}/static/manage/bower_components/jquery/jquery.min.js"></script>
	<script src="${rc.contextPath}/static/common/js/jQuery.md5.js"></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->


</head>

<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>Welcome to BaoPeng CMS</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info">
            <a href="${rc.contextPath}/home/forget.htm">忘记密码？</a>
            </div>
            <form name="loginForm" action="javascript:;" class="form-horizontal" >
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="text" class="form-control" placeholder="请输入手机号" name="username" id="username">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="password" class="form-control" placeholder="请输入密码" name="password" id="password">
                    </div>
                    <div class="clearfix"></div>

                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button onclick="doSubmit();" class="btn btn-primary">登录</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript -->

		<script type="text/javascript">
		function doSubmit() {
			var password = $("#password").val().trim();
			var username = $("#username").val().trim();
			if(username==null ||username==""){
				layer.tips('请输入账号', '#username');
				return false;
			}
			if(password==null ||password==""){
				layer.tips('请输入密码', '#password');
				return false;
			}
			$.post("${rc.contextPath}/home/login.do",{"password":$.md5(password.trim()),"username":username},function(result){
				var json =  $.parseJSON(result);
				if(json.code==0){
					location.href = "${rc.contextPath}"+json.data;
				}else{
					alert(json.message);
				}
			});
		}
		</script>

<script src="${rc.contextPath}/static/manage/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="${rc.contextPath}/static/manage/js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='${rc.contextPath}/static/manage/bower_components/moment/min/moment.min.js'></script>
<script src='${rc.contextPath}/static/manage/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="${rc.contextPath}/static/manage/bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="${rc.contextPath}/static/manage/bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="${rc.contextPath}/static/manage/js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="${rc.contextPath}/static/manage/bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="${rc.contextPath}/static/manage/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="${rc.contextPath}/static/manage/js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="${rc.contextPath}/static/manage/js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="${rc.contextPath}/static/manage/js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="${rc.contextPath}/static/manage/js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="${rc.contextPath}/static/manage/js/jquery.history.js"></script>
<script src="${rc.contextPath}/static/layer/layer.js"></script>

</body>
</html>

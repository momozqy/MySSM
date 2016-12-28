<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>忘记密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="${rc.contextPath}/static/manage/css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="${rc.contextPath}/static/manage/css/charisma-app.css" rel="stylesheet">
    <link href='${rc.contextPath}/static/manage/css/jquery.noty.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/elfinder.min.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/uploadify.css' rel='stylesheet'>
    <link href='${rc.contextPath}/static/manage/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="${rc.contextPath}/static/manage/bower_components/jquery/jquery.min.js"></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<script src="${rc.contextPath}/static/common/js/jQuery.md5.js"></script>

</head>

<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>忘记密码</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <form name="loginForm" class="form-horizontal" action="" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone blue"></i></span>
                        <input type="text" class="form-control" placeholder="输入手机号" name="username" id="username">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-check blue"></i></span>
                        <input type="text" class="form-control" placeholder="输入验证码" name="code" id="code">
                     <span class="input-group-addon  btn-primary" onclick="sendCode(this);">发送验证码</span>
                    </div>
                    <div class="clearfix"></div><br>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock blue"></i></span>
                        <input type="password" class="form-control" placeholder="输入新密码" name="password" id="password">
                    </div>
                    <div class="clearfix"></div><br>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock blue"></i></span>
                        <input type="password" class="form-control" placeholder="请再输入新密码" name="repassword" id="repassword">
                    </div>
                    <div class="clearfix"></div>
					<div class="center col-md-5">
					  <span onclick="verificationCode()" class="btn btn-primary">下一步</span>
					 </div>
					 
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript -->

		<script type="text/javascript">
		function verificationCode(){
			var phone = $('#username').val().trim();
			var reg = vailPhone(phone);
			 if (true != reg) {
				 layer.tips(reg,"#username");
			     return false;
			 };
			var code = $('#code').val().trim();
			 if (code=="") {
				 layer.tips("请输入验证码","#code");
			     return false;
			 };
			 var password = $('#password').val().trim();
			if(password==""){
				 layer.tips("请输入密码","#password");
				 return false;
			}
			if(password.length<6){
				layer.tips("密码长度大于6","#password");
			 	return false;
			}
			var repassword = $('#repassword').val().trim();
			if(repassword==""){
				 layer.tips("请再次输入密码","#repassword");
				 return false;
			}
			if(repassword.length<6){
				layer.tips("密码长度大于6","#repassword");
			 	return false;
			}
			if(repassword!=password){
				layer.tips("两次密码不一致","#repassword");
			 	return false;
			}
			$.post("${rc.contextPath}/home/resetPassword.do",{"code":code,"password":$.md5(password.trim())},function(result){
				 var json =  $.parseJSON(result);
				 if(json.code==0){
					 window.location.href = "${rc.contextPath}/home/index.htm";
				}else{
					 layer.alert(json.message);
				}
			});
		}
		function sendCode(obj) {
			if(count==0){
				var phone = $('#username').val().trim();
				var reg = vailPhone(phone);
				 if (true != reg) {
					 layer.tips(reg,"#username");
				     return false;
				 };
				 timeout(obj);
				 $.post("${rc.contextPath}/home/sendCode.do",{"phone":phone,"type":1},function(result){
					 var json =  $.parseJSON(result);
					 if(json.code==0){
						
					 }else{
						 layer.alert(json.message);
					 }
				});
			}
			
		}
		var count = 0;
		function timeout(obj){
			count =60;
			$(obj).prop("disabled", true);
			v=setInterval(function(){
				if(count==0){
					clearInterval(v);
					$(obj).text("重新发送");
					$(obj).prop("disabled", false);
					return;
				}
				count--;				
				$(obj).text("发送验证码("+count+")");
			},1000);
		}
		function vailPhone(phone){
		      var flag = false;
		      var message = "";
		      var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;       
		      if(phone == ''){
		        message = "手机号码不能为空！";
		      }else if(phone.length !=11){
		        message = "请输入有效的手机号码！";
		      }else if(!myreg.test(phone)){
		        message = "请输入有效的手机号码！";
		      }else{
		          flag = true;
		      }
		      if(!flag){
		    	  return message;
		      }
		      return flag;
		 }
		</script>

<script src="${rc.contextPath}/static/manage/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${rc.contextPath}/static/layer/layer.js"></script>
</body>
</html>

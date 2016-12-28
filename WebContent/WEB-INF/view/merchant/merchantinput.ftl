<!DOCTYPE html>
<html lang="zh">
<#include "manage/header.ftl"/>
<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">
	<#include "manage/nav.ftl"/></div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<#include "manage/menu.ftl"/>
			<!-- left menu ends -->

			<noscript>
				<div class="alert alert-block col-md-12">
					<h4 class="alert-heading">Warning!</h4>

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
					<ul class="breadcrumb">
						<li><a href="${rc.contextPath}/manage/index">首页</a></li>
						<li>添加商户</li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-edit"></i> 添加商户
								</h2>
							</div>
							<div class="box-content">
								<#include "manage/uploadFile.ftl"/>
								<div class="row">
									<form role="form" id="pForm"
										action="javascript:;" method="post" />
									<div class="form-group  col-md-4">
										<label for="name">企业名称</label> <input type="text" name="name"
											id="name" class="form-control" placeholder="输入企业名称" value="${merchant.name!}">
											<input type="text" name="id" id="id"
											 class="form-control" value="${merchant.id!}" style="display:none">
									</div>
									<div class="form-group  col-md-4">
										<label for="corporation">企业法人</label> <input type="text" id="corporation" name="corporation" value="${merchant.corporation!}"
											id="address" class="form-control" placeholder="输入企业法人">
									</div>
									<div class="form-group  col-md-4">
										<label for="phone">联系方式</label> <input type="text" name="phone" value="${merchant.phone!}"
											id="phone" class="form-control" placeholder="输入联系方式">
									</div>
									<div class="form-group  col-md-4">
										<label for="address">企业地址</label> <input type="text" name="address" value="${merchant.address!}"
											id="address" class="form-control" placeholder="输入企业地址">
									</div>
									<div class="form-group  col-md-4">
										<label for="email">企业邮箱</label> <input type="text" name="email" value="${merchant.email!}"
											id="email" class="form-control" placeholder="输入企业邮箱">
									</div>
									<div class="form-group  col-md-12">
									</div>
									<div class="form-group  col-md-4">
										<label for="appid">微信appid</label> <input type="text" name="appid" value="${merchant.appid!}"
											id="appid" class="form-control" placeholder="微信appid">
									</div>
									<div class="form-group  col-md-4">
										<label for="appsercet">微信appsercet</label> <input type="text" name="appsercet" value="${merchant.appsercet!}"
											id="appsercet" class="form-control" placeholder="微信appsercet">
									</div>
									<div class="form-group col-md-12">
										<label for="picShow">营业执照</label><br /> <input type="hidden"
											name="merchant.photo" id='photo' value='${rc.contextPath}${merchant.photo!}'/> <img
											src='${rc.contextPath}${merchant.photo!}' id="picShow"
											name="picShow"
											style="max-height: 300px; width: expression(document.body.clientHeight &gt; 400 ?"
											400px":"auto"); overflow:hidden;" alt="图片">
									</div>
									<div class="form-group col-md-12">
										<button type="button" class="btn btn-success"
											onclick="validatecode();">提 交</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-warning"
											onclick="goIndex();">取 消</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<script>
					function validatecode() {
						var id=$("#id").val();
						if(id==""){
							id=0;
						}
						var name=$("#name").val();
						if(name==""){
							layer.tips('请输入企业名','#name')
							return false;
						}
						var address=$("#address").val();
						if(address==""){
							layer.tips('请输入企业地址','#address')
							return false;
						}
						var phone=$("#phone").val();
						if(phone==""){
							layer.tips('请输入联系方式','#phone')
							return false;
						}
						var email=$("#email").val();
						if(email==""){
							layer.tips('请输入企业邮箱','#email')
							return false;
						}
						var corporation=$("#corporation").val();
						if(corporation==""){
							layer.tips('请输入企业法人','#corporation')
							return false;
						}
						var license=$("#photo").val();
						var appid=$("#appid").val();
						var appsercet=$("#appsercet").val();
						var json = {
								"id":id,
								"name":name,
								"address":address,
								"phone":phone,
								"email":email,
								"corporation":corporation,
								"license":license,
								"appid":appid,
								"appsercet":appsercet
						}
						$.post("${rc.contextPath}/merchant/updateMerchant.do",json,function(result){
							var json =  $.parseJSON(result);
							if(json.code==0){
								layer.alert('操作成功', function(){
									window.location.href = "${rc.contextPath}/userMerchant/merchantBindUser.htm?id="+json.data;
							 	});
							}else{
								layer.alert(json.message);
							}
						})
						var $btn = $(this).button('loading')
					}
					function goIndex() {
						window.location.href = "${rc.contextPath}/merchant/allMerchant.htm";
					}
					$(function() {
						$('#fileupload').fileupload({
							url : _BASE + '/file',
							done : function(e, result) {
								var json =  result.result;
								if (json.code == 0) {
									$("#photo").val(json.data);
									$("#picShow").attr('src', json.data);
								} else {
									layer.alert(data.message);
								}
							}
						});
					})
					
				</script>

				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->
	<#include "manage/footer.ftl">
</body>
</html>




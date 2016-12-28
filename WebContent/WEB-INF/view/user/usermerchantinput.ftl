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
						<li>授权</li>
					</ul>
				</div>

				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2>
									<i class="glyphicon glyphicon-edit"></i> 授权商户给用户
								</h2>
							</div>
							<div class="box-content">
								<div class="row">
									<form role="form" id="pForm" action="javascript:;" method="post" />
									
									<div class="form-group  col-md-6">
										<label for="name">被授权人</label> 
										<input type="text" value="${user.name!}" id="name" class="form-control" placeholder="输入用户名" disabled>
										<input type="text" value="${user.id!}" id="id" class="form-control" placeholder="输入userId" style="display:none">
									</div>
									<div class="form-group  col-md-12">
									</div>
									<div class="form-group col-md-6">
								        <label for="addType">功能点分类</label>
										<select name="type" data-placeholder="选择功能点分类" id="addType"class="form-control" multiple='multiple'>
								        	<option value='0' >菜单</option>
								        	<option value='1' >功能点</option>
										</select>
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
      $(function() {
    	$("#addType").select2();
        initdata();
      });
				</script>

				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->
	<#include "manage/footer.ftl">
</body>
</html>




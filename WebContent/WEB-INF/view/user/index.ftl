<!DOCTYPE html>
<html lang="zh">
 <#include "manage/header.ftl"/> 
  <#include "menu/userType.ftl"/> 
<body>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">
	<#include "manage/nav.ftl"/>
        
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <#include "manage/menu.ftl"/> 
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="${rc.contextPath}/manage/index">首页</a>
        </li>
        <li>
            ${usertype}管理
        </li>
    </ul>
	</div>
	<a href="#" title="去往新页面，添加${urlPath!}" data-toggle="modal" data-target="#updateModal" data-type="user" data-toggle="tooltip" class="btn btn-info">添加${usertype}</a>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-user"></i>${usertype}列表</h2>
    </div>
    <div class="box-content">
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>名字</th>
        <th>手机</th>
        <th>用户类型</th>
        <th>授权</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
   	   <tr>
	      	<td>${user.name!}</td>
			<td class="center">${user.phone!}</td>
			<td class="center">
	        	<a class="btn btn-primary" href="${rc.contextPath}/userMerchant/userBindMerchant.htm?id=${user.id}"   ><i class="glyphicon glyphicon-eye-open icon-white"></i></a>
			</td>
	        <td class="center">
	        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal" data-type="user" data-id="${user.id}" data-name="${user.name}" data-phone="${user.phone}"><i class="glyphicon glyphicon-edit icon-white"></i></button>
	           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal"  data-id="${user.id}" data-operateUrl="${rc.contextPath}/home/deleteUser.do"><i class="glyphicon glyphicon-trash icon-white"></i></button>
	        </td>
       </tr>
    </#list>
    </tbody>
    <tfoot>
    <tr>
        <th>名字</th>
        <th>手机</th> 
        <th>用户类型</th>
        <th>授权</th>
        <th>操作</th>
    </tr>
    </tfoot>
    </table>
    </div>
    </div>
    </div>
<#include "manage/deleteModel.ftl"/> 
<#include "manage/updateModel.ftl"/> 
<script>

$('#updateModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var type = button.data('type') // Extract info from data-* attributes
  if("user"==type){
 	 userHtml(button);
  }
});

//初始化添加或修改用户页面
function userHtml(button){
	 var id = button.data('id') // Extract info from data-* attributes
	  var phone = button.data("phone");
	  var name = button.data('name');
	  if(id==undefined){
		  id=0;
	  }
	  if(phone==undefined){
		  phone="";
	  }
	  if(name==undefined){
		  name="";
	  }
	  var body ="";
	  body += '	<input type="hidden" class="form-control" id="id" name="id" value="'+id+'">';
	  body += '	<div class="form-group">';
	  body += '	<label for="name" class="control-label">用户名:</label>';
	  body += '	<input type="text" class="form-control" id="name" name="name" placeholder="请输入用户名" value="'+name+'">';
	  body += '	</div>';
	  body += '	<div class="form-group">';
	  body += '	<label for="phone">用户手机：</label>';
	  body += '	<input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机号" value="'+phone+'">';
	  body += '	</div>';
	  var title ="";
	  if(id!=null && id!=""){
		  title ="修改用户信息";
	  }else{
		  title ="添加用户信息";
	  }
	  
	  updateModel(title,body,function(){udpateUser()});
}
//服务器上传用信息
function udpateUser (){
	var id = $('#id').val();
	var phone = $('#phone').val().trim();
	var name = $("#name").val().trim();
	var type = $("#type").val();
	if(name==""){
		layer.tips('请输入用户名', '#name');
		return false;
	}
	if(phone==""){
		layer.tips('请输入手机号', '#phone');
		return false;
	}else{
		var flag = vailPhone(phone);
		if(true!=flag){
			layer.tips(flag, '#phone');
			return false;
		}
	}
	
	var json ={
			'id':id,
			'name':name,
			'phone':phone,
			'type':type,
	}
	$.post("${rc.contextPath}/home/addUser.do",json,function(result){
		var json =  $.parseJSON(result);
		if(json.code==0){
			layer.alert('操作成功', function(){
				window.location.reload();
			});
		}else{
			layer.alert(json.message);
		}
	})
    var $btn = $(this).button('loading')
  }

</script>

    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

	<#include "manage/footer.ftl">
</body>
</html>




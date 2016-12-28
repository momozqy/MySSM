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
            功能点管理
        </li>
    </ul>
	</div>
	<a href="#" title="去往新页面，添加${urlPath!}" data-toggle="modal" data-target="#updateModal" data-type="menu" data-toggle="tooltip" class="btn btn-info">添加功能点</a>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-user"></i> 功能点列表</h2>
    </div>
    <div class="box-content">
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>父菜单</th>
        <th>子菜单</th>
        <th>类型</th>
        <th>授权</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list features as menu>
   	   <tr>
	      	<td>${menu.menuName!}</td>
			<td class="center">#</td>
			<td class="center">菜单</td>
	        <td class="center">
	        	<button type="button" class="btn btn-primary" data-toggle="modal" data-id="${menu.id}" data-target="#updateModal" data-type="auth"><i class="glyphicon glyphicon-eye-open icon-white"></i></button>
	        </td>
	        <td class="center">
	        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal" data-type="menu" data-id="${menu.id}" data-parentId="${menu.parentId}" data-menuName="${menu.menuName}" data-menutype="${menu.type}"  data-orderNum="${menu.orderNum}"  data-menuUrl="${menu.menuUrl}"><i class="glyphicon glyphicon-edit icon-white"></i></button>
	           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal"  data-id="${menu.id}" data-operateUrl="${rc.contextPath}/manage/deleteMenu.do"><i class="glyphicon glyphicon-trash icon-white"></i></button>
	        </td>
       </tr>
	       <#list menu.children as submenu>
	   <tr>
		  	<td>${menu.menuName!}</td>
			<td class="center">${submenu.menuName!}</td>
			<#if submenu.type==0>
			<td class="center">菜单</td>
			<#else>
			<td class="center">功能点</td>
			</#if>
			<td class="center">
		        <button type="button" class="btn btn-primary" data-toggle="modal" data-id="${submenu.id}" data-target="#updateModal" data-type="auth"><i class="glyphicon glyphicon-eye-open icon-white"></i></button>
			</td>
		    <td class="center">
		        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal" data-type="menu" data-id="${submenu.id}" data-parentId="${submenu.parentId}" data-menuName="${submenu.menuName}" data-menutype="${submenu.type}" data-orderNum="${submenu.orderNum}" data-menuUrl="${submenu.menuUrl}"><i class="glyphicon glyphicon-edit icon-white"></i></button>
		        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal"  data-id="${submenu.id}" data-operateUrl="${rc.contextPath}/manage/deleteMenu.do"><i class="glyphicon glyphicon-trash icon-white"></i></button>
		    </td>
	     </tr>
	       </#list>
    </#list>
    </tbody>
    <tfoot>
    <tr>
        <th>父菜单</th>
        <th>子菜单</th>
        <th>类型</th>
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
	  var type = button.data('type'); // Extract info from data-* attributes
	  if("auth"==type){
		  authHtml(button);
	  }else if("menu"==type){
		  menuHtml(button)
	  }
	});
	function authHtml(button){
		var id = button.data('id'); // Extract info from data-* attributes
		var body ="";
		body += '	<input type="hidden" class="form-control" id="powerMenuId" value="'+id+'" />';
		<#list userType as type>
			body += '    	 <span><input name="powerManager" type="checkbox" value="${type[0]}" />${type[1]}</span>';	
		</#list>
		updateModel("修改权限",body,function(){udpateAuth()});
		initAuth(id);
	}
	function initAuth(id) {
		$.post("${rc.contextPath}/manage/getAccess.do",{"id":id},function(result){
			var json =  $.parseJSON(result);
			if(json.code==0){
			 $(json.data).each(function(i,val) { 
				 $("input[name='powerManager'][value='"+val+"']").attr("checked",true);

			 })
			}
		});
	}
	function udpateAuth(){
		var types ="";
		if($("input[name='powerManager']:checked").length>0){
			$("input[name='powerManager']:checked").each(function(){
				types+=$(this).val()+",";
			})
			//去掉末尾的逗号
			types = types.substring(0,types.length-1);
		}
		var menuId = $('#powerMenuId').val();
		$.post("${rc.contextPath}/manage/updateAccess.do",{"types":types,"menuId":menuId},function(result){
			var json =  $.parseJSON(result);
			if(json.code==0){
				layer.alert("操作成功",function(){
	          	 	window.location.reload();
				});
			}else{
				layer.alert(json.message,function(){
	          	 	window.location.reload();
				});
			}
		});
		
	}
	function menuHtml(button){
		var body ="";
		body += '<input type="hidden" class="form-control" id="id" name="id">';
		body += '<div class="form-group">';
		body += '    <label for="menuName" class="control-label">菜单名称:</label>';
		body += '     <input type="text" class="form-control" id="menuName" name="menuName" placeholder="请输入菜单名称" >';
		body += '</div>';
		body += '<div class="form-group">';
		body += '    <label for="editType">功能点分类</label>';
		body += '	<select name="type" id="type"class="form-control" >';
		body += '    	<option value="0" >菜单</option>';
		body += '    	<option value="1" >功能点</option>';
		body += '	</select>';
		body += '  </div>';
		body += '  <div class="form-group">';
		body += '    <label for="editMenu">所属菜单</label>';
		body += '	<select name="parentId" id="parentId"class="form-control" >';
		body += '        <option value="0">顶级菜单</option>';
	        	<#list features as menu>
	    body += '        	<option value="${menu.id}" title="${menu.type}">${menu.menuName}</option>';
	        	</#list>
	    body += '	</select>';
	    body += ' </div>';
	    body += '  <div class="form-group">';
	    body += '    <label for="typeUrl">接口路径</label>';
	    body += '	<input type="text" class="form-control" id="menuUrl" name="menuUrl" placeholder="请输入接口的相对路径">';
	    body += '  </div>';
	    body += '  <div class="form-group">';
	    body += '    <label for="source">位置排序</label>';
	    body += '	<input type="text" class="form-control" id="orderNum" name="orderNum"  placeholder="菜单的顺序">';
	    body += ' </div>';
	    updateModel("修改权限",body,function(){
	    	updateMenu();
	    });
	    initMenu(button);
	}
	


function initMenu(button) {
  var id = button.data('id') // Extract info from data-* attributes
  if(id!=null && id!=""){
	  updateModelTitle("修改菜单");
	  var parentId = button.data("parentid");
	  var menuName = button.data('menuname') // Extract info from data-* attributes
	  var menuUrl= button.data('menuurl'); 
	  var orderNum= button.data('ordernum'); 
	  var type = button.data('menutype');
	  $("#id").val(id);
	  $("#type").val(type);
	  $("#type").attr("disabled",true);
	  $("#parentId").val(parentId);
	  $("#parentId").attr("disabled",true);
	  $('#menuUrl').val(menuUrl);
	  $('#menuName').val(menuName);
	  $('#orderNum').val(orderNum);
  }else{
	  updateModelTitle("添加菜单");
	  $("#id").val("");
	  $("#parentId").attr("disabled",false);
	  $("#type").attr("disabled",false);
	  $('#menuUrl').val("");
	  $('#menuName').val("");
	  $('#orderNum').val("");
  }
}
function updateMenu() {
	var id = $('#id').val();
	var menuName = $('#menuName').val().trim();
	var menuUrl = $("#menuUrl").val().trim();
	var parentId = $("#parentId").val().trim();
	var type = $("#type").val().trim();
	var orderNum = $("#orderNum").val().trim();
	if(menuName==""){
		layer.tips('请输入菜单名', '#menuName');
		return false;
	}
	if(orderNum!=""){
		if(isNaN(orderNum)){
			layer.tips('必须为数字', '#orderNum');
			return false;
		}
	}
	if(parentId==0 && type==1){
		layer.alert("功能点不能为顶级菜单！");
		return false;
	}
	var json ={
			'id':id,
			'menuName':menuName,
			'menuUrl':menuUrl,
			'parentId':parentId,
			'orderNum':orderNum,
			'type':type
	}
	$.post("${rc.contextPath}/manage/updateMenu.do",json,function(result){
		layer.alert("操作成功",function(){
      	 	window.location.reload();
		});
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




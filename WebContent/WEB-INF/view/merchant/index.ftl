<!DOCTYPE html>
<html lang="zh">
 <#include "manage/header.ftl"/> 
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
            商户管理
        </li>
    </ul>
	</div>
	<a href="${rc.contextPath}/merchant/updateMerchant.htm"  class="btn btn-info">添加商户</a>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2><i class="glyphicon glyphicon-user"></i> 商户列表</h2>
    </div>
    <div class="box-content">
    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
    <thead>
    <tr>
        <th>商户名称</th>
        <th>企业法人</th>
        <th>企业地址</th>
        <th>添加管理员</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list merchants as merchant>
    <tr>
        <td>${merchant.name!}</td>
		<td class="center">${merchant.corporation!}</td>
		<td class="center">${merchant.address!}</td>
		<td class="center">
			<a class="btn btn-primary" href="${rc.contextPath}/userMerchant/merchantBindUser.htm?id=${merchant.id}" ><i class="glyphicon glyphicon-eye-open icon-white"></i></a>
		</td>
        <td class="center">
        	<a class="btn btn-primary" href="${rc.contextPath}/merchant/updateMerchant.htm?id=${merchant.id}"><i class="glyphicon glyphicon-edit icon-white"></i></a>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal" data-operateUrl="${rc.contextPath}/merchant/delete.do" data-id="${merchant.id}"><i class="glyphicon glyphicon-trash icon-white"></i></button>
        </td>
    </tr>
    </#list>
    </tbody>
    <tfoot>
    <tr>
        <th>商户名称</th>
        <th>企业法人</th>
        <th>企业地址</th>
        <th>添加管理员</th>
        <th>操作</th>
    </tr>
    </tfoot>
    </table>
    </div>
    </div>
    </div>
<#include "manage/deleteModel.ftl"/> 

    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

	<#include "manage/footer.ftl">
</body>
</html>




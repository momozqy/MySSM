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
	<#include "/manage/menu.ftl"/>
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
	            Dashboard
	        </li>
    	</ul>
</div>


	<div class=" row">
	</div>
	
	
	<div class="row">
	</div>


	<br/>
	<br/>
    <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->


	<#include "manage/footer.ftl">
</body>
</html>




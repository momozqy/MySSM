 
 
<script>
	var _BASE="${rc.contextPath}" ;
	var _RES_BASE=_BASE + "/static/manage/" ;
</script>
<!-- external javascript -->
<script src="${rc.contextPath}/static/manage/js/bootstrap.min.js"></script> 

<!-- library for cookie management -->
<script src="${rc.contextPath}/static/manage/js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='${rc.contextPath}/static/manage/bower_components/moment/min/moment.min.js'></script>
<script src='${rc.contextPath}/static/manage/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script type="text/javascript" src="${rc.contextPath}/static/datatables/js/datatables.min.js"></script>

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
<!-- application script for Charisma demo -->
<script src="${rc.contextPath}/static/manage/js/charisma.js"></script>    
<script src="/static/manage/js/chosen.jquery.js"></script>
<script src="${rc.contextPath}/static/date/js/bootstrap-datetimepicker.min.js"></script>
<script src="${rc.contextPath}/static/layer/layer.js"></script>
    <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${rc.contextPath}/index.html"> <img alt="Charisma Logo" src="${rc.contextPath}/static/manage/img/logo20.png" class="hidden-xs"/>
                <span>Baopeng.cn</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">${Session["username"]}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="${rc.contextPath}/home/logout.htm">登出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> Change Theme / Skin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                </ul>
            </div>
            <!-- theme selector ends -->
        </div>
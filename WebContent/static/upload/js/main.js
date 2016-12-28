/*
 * jQuery File Upload Plugin JS Example
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/* global $, window */

$(function () {
    'use strict';


    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload({
    	url: _BASE+'/file',
    	done:function(e,result){  
            //done方法就是上传完毕的回调函数，其他回调函数可以自行查看api  
            //注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息  
            //返回的数据在result.result中，假设我们服务器返回了一个json对象  
            console.log(JSON.stringify(result.result));  
        } 
    });

    // Load existing files:
    $('#fileupload').addClass('fileupload-processing');
    $.ajax({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: $('#fileupload').fileupload('option', 'url'),
        dataType: 'json',
        context: $('#fileupload')[0]
    }).always(function () {
        $(this).removeClass('fileupload-processing');
    }).done(function (result) {
        $(this).fileupload('option', 'done')
            .call(this, $.Event('done'), {result: result});
    });
});

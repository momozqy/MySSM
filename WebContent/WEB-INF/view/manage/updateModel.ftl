<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改</h4>
      </div>
      <div class="modal-body">
      	
      </div>
      <div class="modal-footer">
      	 <button type="button"  class="btn btn-default" data-dismiss="modal">取消</button>
	  	 <button type="button"  class="btn btn-primary" data-loading-text="Loading..."  autocomplete="off" >确定</button>
      </div>
    </div>
  </div>
</div>
<script>
function updateModel(title,body,callback){
	$('#updateModal').find('.modal-title').text(title)
	$('#updateModal').find('.modal-body').html("").append(body);
	$('#updateModal').find('.modal-footer').find('.btn-primary').unbind().bind("click",callback);
}
function updateModelTitle(title){
	$('#updateModal').find('.modal-title').text(title);
}
function updateModelBody(body){
	$('#updateModal').find('.modal-body').html("").append(body);
}
function updateModelBindButton(callback){
	$('#updateModal').find('.modal-footer').find('.btn-primary').unbind().bind("click",callback);
}
</script>

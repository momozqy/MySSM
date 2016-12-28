<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="deleteModalLabel">操作提示</h4>
      </div>
      <div class="modal-body">
      	<input type="hidden" class="form-control" id="deleteId" name="deleteId" />
      	<input type="hidden" class="form-control" id="operateUrl" name="operateUrl" />
      	 您确定要删？
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" name="myButton" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">确定</button>
      </div>
    </div>
  </div>
</div>
<script>
$('#deleteModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var operateUrl = button.data('operateurl') // Extract info from data-* attributes
  var id = button.data('id');
  var modal = $(this)
  $('#operateUrl').val(operateUrl);
  $('#deleteId').val(id);
});
$('#myButton').on('click', function () {
	$.post($('#operateUrl').val(),{"id":$('#deleteId').val()},function(result){
	 	layer.alert('删除成功', function(){
    	   	window.location.reload();
	 	});
	})
    var $btn = $(this).button('loading')
  });
 </script>
 
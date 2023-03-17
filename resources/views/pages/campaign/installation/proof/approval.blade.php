
<form action="{{$url}}" class="formName" method="post" enctype="multipart/form-data">
    {{ csrf_field() }}
    <input type="hidden" value="{{$id}}" name="id">
    <input type="hidden" value="{{$bucket}}" name="bucket">
    <div class="form-group">
        <label>Status</label>
        <select class="form-control" name='status' id='status'>
            <!-- <option value="1">Approve</option> -->
            <option value="0">Reject</option>
        </select>
    </div>
    <div class="form-group">
        <label>Comment</label>
        <textarea class="form-control" name='comment' id='comment'></textarea>
    </div>
</form>

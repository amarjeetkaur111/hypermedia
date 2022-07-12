@php
if(isset($data) && $data){
    $description = $data->description;
}
else{
    $description = null;
}
@endphp
<form action="{{$url}}" class="formName" method="post" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="form-group">
        <label>Description</label>
        <textarea name="description" class="form-control name">{{ $description }}</textarea>
    </div>
    <div class="form-group">
        <label>File</label>
        <input type="file" name="permit_file" class="form-control">
    </div>
</form>

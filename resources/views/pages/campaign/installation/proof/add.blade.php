@extends('layouts.admin')
@section('content')
<link rel="stylesheet" href="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.css') }}">


<style>
    .form-control {
        border: 1px solid #aaa;
    }
    input[type="file"] {
  display: block;
}
.imageThumb {
  max-height: 75px;
  border: 2px solid;
  padding: 1px;
  cursor: pointer;
}
.pip {
  display: inline-block;
  margin: 10px 0px;
}
.remove {
  display: block;
  background: white;
  border: 1px solid black;
  color: black;
  font-weight:bolder;
  text-align: center;
  cursor: pointer;width:15.6rem;
  font-size:10px;
}
.remove:hover {
  background: white;
  color: black;
}
</style>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">{{$campaign_name->name}} Proof Pictures</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Proof Pictures
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <form class="form-horizontal" method="post" action="{{ $action }}" enctype="multipart/form-data">
            <div class="card">
                @csrf
                <div class="card-body">
                    <h4 class="card-title">{{ $add }}</h4>
                    <div class="row">
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 control-label col-form-label">Assets</label>
                            <div class="col-sm-9">
                                <select type="file" class="form-control"  id="assets" name="assets">
                                  @foreach($assets as $assets)
                                    @foreach($assets->asset_data as $ast)
                                      @If(empty($ast->proof) || $ast->proof->status == 0)
                                    <option value="{{$ast->id}}:{{$assets->id}}">{{$ast->name}}-{{$ast->ref_no}}</option>
                                      @endif
                                    @endforeach
                                  @endforeach
                                </select>
                                @if ($errors->has('assets'))
                                <span class="text-danger">{{ $errors->first('assets') }}</span>
                                @endif
                            </div>
                        </div>  
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 control-label col-form-label">Pictures</label>
                            <div class="col-sm-9">
                                <input type="file"  id="files" name="file[]" multiple accept="image/*">
                                @if ($errors->has('file'))
                                <span class="text-danger">{{ $errors->first('file') }}</span>
                                @endif
                            </div>
                        </div>                             
                    </div>
                    <div class="row" id='result'>
                    </div>   
                    <input type="hidden" value="{{$c_id}}" name="campaign_id">
                    
                </div>
            </div>

            <div class="border-top">
                <div class="card-body">
                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection

@push('custom-scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js" integrity="sha512-d4KkQohk+HswGs6A1d6Gak6Bb9rMWtxjOa0IiY49Q3TeFd5xAzjWXDCBW9RS7m86FQ4RzM2BdHmdJnnKRYknxw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script src="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.js') }}"></script>
<script>
        var dt = new DataTransfer();
    window.onload = function() {

  //Check File API support
  if (window.File && window.FileList && window.FileReader) {
    var filesInput = document.getElementById("files");
    filesInput.addEventListener("change", function(event) {
      var files = event.target.files; //FileList object
      var output = document.getElementById("result");
      output.innerHTML = '';
      var count = 0;

      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        //Only pics
        if (!file.type.match('image'))
          continue;

        dt.items.add(file) 

        var picReader = new FileReader();
        picReader.fileName = file.name
        picReader.onload = function(event) {
          var picFile = event.target;
          var div = document.createElement("div");
                    console.log(dt.files);

          output.innerHTML += "<div class='col-md-4 col-sm-12 pip'><img class='thumbnail' width='250' src='" + picFile.result + "'" + "title='" + event.target.fileName + "'/><br/><span name='"+event.target.fileName+"' data-id=" +i+ " class='remove'>Remove image</span>"+
          "</div>";            
        }
        //Read the image
        picReader.readAsDataURL(file);
        count++;
      }
    });
  } else {
    console.log("Your browser does not support File API");
  }

  
}
$('body').on('click','.remove',function(){
      var name = $(this).attr('name');
      $(this).parent(".pip").remove();  

      for(let j = 0; j < dt.items.length; j++){
          console.log(name+' -  '+dt.items[j].getAsFile().name);

          if(name === dt.items[j].getAsFile().name){
          dt.items.remove(j);
          console.log(dt.files);
          }
      }
  document.getElementById('files').files = dt.files;       
  });


</script>
@endpush
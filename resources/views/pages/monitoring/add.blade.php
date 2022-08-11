@extends('layouts.admin')
@section('content')
    @php
        $photo = asset('assets/dummy.png');
        if(isset($data) && $data){
            $photo = asset($data->photo_path);
        }
            
    @endphp
    <style>
        .form-control {
            border: 1px solid #aaa;
        }
    </style>
    <div class="page-wrapper" id='monitoring'>
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Campaign Monitoring</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Campaign Monitoring
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="card">
                <form class="form-horizontal" method="post" action="{{ $action }}" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <h4 class="card-title">{{ $add }}</h4>
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Campaign</label>
                                    <div class="col-sm-9">
                                        <select type="text" name="campaign_id" id="campaign_id" class="form-control" required>
                                            @if(isset($data->campaign))
                                                <option value="{{ old('campaign_id',$data->campaign->id) }}">{{ $data->campaign->name }}</option>
                                            @endif
                                        </select>
                                        @if ($errors->has('campaign_id'))
                                            <span class="text-danger">{{ $errors->first('campaign_id') }}</span>
                                        @endif
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Photo</label>
                                    <div class="col-md-9">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input form-control"
                                                   name="photo" id="photo"
                                                   accept="image/*">
                                        </div>
                                        @if ($errors->has('photo'))
                                            <span class="text-danger">{{ $errors->first('photo') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname"
                                           class="col-sm-3 text-end control-label col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        @if(isset($data->description))
                                            <textarea type="text" class="form-control" name="description"
                                          placeholder="Description Here">{{old('description',$data->description)}}</textarea>
                                        @else
                                            <textarea type="text" class="form-control" name="description"
                                          placeholder="Description Here">{{old('description')}}</textarea>
                                        @endif
                                        @if ($errors->has('description'))
                                            <span class="text-danger">{{ $errors->first('description') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Status</label>
                                    <div class="col-sm-9">
                                        <select type="text" name="status" id="status" class="form-control">
                                        @if(isset($data->status))
                                            <option value="Active" {{old('status',$data->status)=='Active'?"selected":' '}}>Active</option>
                                            <option value="Inactive" {{old('status',$data->status)=='Inactive'?"selected":' '}}>Inactive</option>
                                        @else
                                            <option value="Active" {{old('status')=='Active'?"selected":' '}}>Active</option>
                                            <option value="Inactive" {{old('status')=='Inactive'?"selected":' '}}>Inactive</option>
                                        @endif
                                        </select>
                                        @if ($errors->has('status'))
                                            <span class="text-danger">{{ $errors->first('status') }}</span>
                                        @endif
                                    </div>
                                </div>
                                @if($add == 'Add')
                                <div class="form-group row">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9 form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="defect_btn">
                                        <input type="hidden" name="defect" id="defect" value='0'>
                                        <label class="form-check-label" for="defect_btn">
                                            Add To Defect Asset List
                                        </label>
                                    </div>
                                </div>  
                                @endif
                                <div class="defect_group hide">
                                    <div class="form-group row">
                                        <label for=""
                                            class="col-sm-3 text-end control-label col-form-label">Video</label>
                                        <div class="col-md-9">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input form-control"
                                                    name="video" id="video"
                                                    accept="video/*">
                                            </div>                                        
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="asset"
                                            class="col-sm-3 text-end control-label col-form-label">Asset</label>
                                        <div class="col-sm-9">
                                            <select type="text" name="asset_id" id="asset" class="form-control">
                                            </select>
                                            @if ($errors->has('asset_id'))
                                                <span class="text-danger">{{ $errors->first('asset_id') }}</span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="location"
                                            class="col-sm-3 text-end control-label col-form-label">Location</label>
                                        <div class="col-sm-9">
                                            <select type="text" name="location_id" id="location" class="form-control">
                                            </select>
                                            @if ($errors->has('location_id'))
                                                <span class="text-danger">{{ $errors->first('location_id') }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12" style="display: flex; justify-content: center; align-items: center">
                                    <img id="output"
                                         src="{{$photo}}"
                                         alt="Joseph Doe Junior" class="img-fluid img-thumbnail" height="100%"
                                         style="min-height: 50px">
                            </div>
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
    </div>
@endsection

@push('custom-scripts')
    <script>


        photo.onchange = evt => {
            const [file] = photo.files
            if (file) {
                output.src = URL.createObjectURL(file)
            } else {
                output.src = '{{asset('assets/images/RAYQUBE_logo_White Text-01-01.png')}}'
            }
        }


        $(function () {

            $('#output').click(function(){ $('#photo').trigger('click'); });
            $('#status').select2({
                width: '100%'
            });

            $('#campaign_id').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-campaigns') }}',
                    data: function (params) {
                        var query = {
                            search: params.term,
                            type: 'public'
                        }
                        return query;
                    },
                    processResults: function (data) {
                        // Transforms the top-level key of the response object from 'items' to 'results'
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.name,
                                    id: item.id
                                }
                            })
                        }
                    }
                }
            });
            $('#asset').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-campaign-asset') }}',
                    data: function (params) {
                        var query = {
                            search: params.term,
                            type: 'public',
                            campaign_id:$('#campaign_id').val(),
                        }
                        return query;
                    },
                    processResults: function (data) {
                        // Transforms the top-level key of the response object from 'items' to 'results'
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.ref_no +' - '+ item.name,
                                    id: item.id
                                }
                            })
                        }
                    }
                }
            });
            $('#location').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-locations') }}',
                    data: function (params) {
                        var query = {
                            search: params.term,
                            type: 'public'
                        }
                        return query;
                    },
                    processResults: function (data) {
                        // Transforms the top-level key of the response object from 'items' to 'results'
                        return {
                            results: $.map(data, function (item) {
                                return {
                                    text: item.name,
                                    id: item.id
                                }
                            })
                        }
                    }
                }
            });

        });
        @if(isset($status))
        $('#status').val('{!!$status!!}').trigger('change');
        @endif

    </script>
@endpush

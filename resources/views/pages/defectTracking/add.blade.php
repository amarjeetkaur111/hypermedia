@extends('layouts.admin')
@section('content')
    @php
        $photo = asset('assets/dummy.png');
            if(old('description')){
                $description = old('description');
                $status = old('status');
                $location = old('location_id');
                $asset = old('asset_id');
            }
            else if(isset($data) && $data){
                $description = $data->description;
                $status = $data->status;
                $photo = asset('uploads/'.$data->photo_path);
                $asset = $data->asset ?? null;
                $location = $data->location ?? null;
                $department = $data->campaign->department;
            }
            else{
                $description = null;
                $status = null;
                $location = null;
                $asset = null;
                $department = null;
            }
    @endphp
    <style>
        .form-control {
            border: 1px solid #aaa;
        }
    </style>
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Defect Tracking</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Defect Tracking
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
                                           class="col-sm-3 text-end control-label col-form-label">Photo</label>
                                    <div class="col-md-9">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input form-control"
                                                   name="photo" id="photo"
                                                   accept="image/*">
                                        </div>
                                        @if ($errors->has('campaign_id'))
                                            <span class="text-danger">{{ $errors->first('campaign_id') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for=""
                                           class="col-sm-3 text-end control-label col-form-label">Video</label>
                                    <div class="col-md-9">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input form-control"
                                                   name="video" id="photo"
                                                   accept="video/*">
                                        </div>                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for=""
                                           class="col-sm-3 text-end control-label col-form-label">Department</label>
                                    <div class="col-md-9">
                                        <select type="text" name="department_id" id="department" class="form-control">
                                            @if($department)
                                                <option value="{{ $department->id }}">{{ $department->ref_no.' - '.$department->name }}</option>
                                            @endif
                                        </select>
                                        @if ($errors->has('department_id'))
                                            <span class="text-danger">{{ $errors->first('department_id') }}</span>
                                        @endif                                 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for=""
                                           class="col-sm-3 text-end control-label col-form-label">Owner</label>
                                    <div class="col-md-9">
                                        <select type="text" name="owner_id" id="owner" class="form-control">
                                            <option value="1">Hypermedia</option>
                                            <option value="2">Mall Owned</option>
                                            <option value="3">MAF Owned</option>
                                            <option value="4">Metro Owned</option>
                                        </select>                
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="fname"
                                           class="col-sm-3 text-end control-label col-form-label">Description</label>
                                    <div class="col-sm-9">
                                <textarea type="text" class="form-control" name="description"
                                          placeholder="Description Here">{{$description}}</textarea>
                                        @if ($errors->has('description'))
                                            <span class="text-danger">{{ $errors->first('description') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Asset</label>
                                    <div class="col-sm-9">
                                        <select type="text" name="asset_id" id="asset" class="form-control">
                                            @if($asset)
                                                <option value="{{ $asset->id }}">{{ $asset->ref_no.' - '.$asset->name }}</option>
                                            @endif
                                        </select>
                                        @if ($errors->has('asset_id'))
                                            <span class="text-danger">{{ $errors->first('asset_id') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Location</label>
                                    <div class="col-sm-9">
                                        <select type="text" name="location_id" id="location" class="form-control">
                                            @if($location)
                                                <option value="{{ $location->id }}">{{ $location->name }}</option>
                                            @endif
                                        </select>
                                        @if ($errors->has('location_id'))
                                            <span class="text-danger">{{ $errors->first('location_id') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email1"
                                           class="col-sm-3 text-end control-label col-form-label">Status</label>
                                    <div class="col-sm-9">
                                        <select type="text" name="status" id="status" class="form-control">
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                        @if ($errors->has('status'))
                                            <span class="text-danger">{{ $errors->first('status') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12"
                                 style="display: flex; justify-content: center; align-items: center">
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
            }
        }


        $(function () {

            $('#output').click(function () {
                $('#photo').trigger('click');
            });

            $('#status').select2({
                width: '100%'
            });

            $('#asset').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-assets') }}',
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

            $('#department').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-departments') }}',
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
        @if($status)
        $('#status').val('{!!$status!!}').trigger('change');
        @endif

    </script>
@endpush

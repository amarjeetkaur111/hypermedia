@extends('layouts.admin')
@section('content')
    @php
        $current_network = null;
        $department = null;
        $location = null;
        if(old('name')){
            $name = old('name');
            $type = old('type');
            $installation_time = old('installation_time');
            $ref_no = old('ref_no');
            $description = old('description');
            $status = old('status');
            $owner = old('owner_id');
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $type = $data->type;
            $department = $data->department;
            $location = $data->location;
            $installation_time = $data->installation_time ? getFormattedTime($data->installation_time) : null;
            $ref_no = $data->ref_no;
            $description = $data->description;
            $status = $data->status;
            $current_network = $data->network ? $data->network->id : null;
            $owner = $data->owned_by;
        }
        else{
            $name = null;
            $type = null;
            $installation_time = null;
            $ref_no = null;
            $description = null;
            $status = null;
            $owner = null;
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Assets</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Assets
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
                        <h4 class="card-title">{{ $add }}</h4>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Ref Number</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ref_no" value="{{$ref_no}}"
                                       placeholder="Ref Number Here">
                                @if ($errors->has('ref_no'))
                                    <span class="text-danger">{{ $errors->first('ref_no') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="{{$name}}"
                                       placeholder="Name Here">
                                @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Type</label>
                            <div class="col-sm-9">
                                <select name="type" class="form-control">
                                    <option value="static" {{ $type == 'static' ? 'selected="selected"' : '' }}>Static</option>
                                    <option value="digital" {{ $type == 'digital' ? 'selected="selected"' : '' }}>Digital</option>
                                    <option value="promospace" {{ $type == 'promospace' ? 'selected="selected"' : '' }}>PromoSpace</option>
                                </select>
                                @if ($errors->has('type'))
                                    <span class="text-danger">{{ $errors->first('type') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Package Type</label>
                            <div class="col-sm-9">
                                <select name="type" class="form-control">
                                    <option value="package" {{ $type == 'package' ? 'selected="selected"' : '' }}>Package</option>
                                    <option value="individual" {{ $type == 'individual' ? 'selected="selected"' : '' }}>Individual</option>
                                </select>
                                @if ($errors->has('type'))
                                    <span class="text-danger">{{ $errors->first('type') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="slots" class="col-sm-3 text-end control-label col-form-label">Slots</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" name="slot" value="15"
                                       placeholder="Enter Slot">
                                @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="assets" class="col-sm-3 text-end control-label col-form-label">No of Assets</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" name="asset" value="1"
                                       placeholder="Enter Assets">
                                @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email1"
                                   class="col-sm-3 text-end control-label col-form-label">Photo</label>
                            <div class="col-md-9">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input form-control"
                                           name="asset_photo" id="asset_photo"
                                           accept="image/*">
                                </div>
                                @if ($errors->has('asset_photo'))
                                    <span class="text-danger">{{ $errors->first('asset_photo') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Location</label>
                            <div class="col-sm-9">
                                <select name="location" class="form-control" id="location" required>
                                    <option selected disabled  value="">Select Location</option>
                                    @if($location)
                                        <option value="{{ $location->id }}" selected>{{ $location->name }}</option>
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
                                <select type="text" name="owner_id" id="owner" class="form-control" required>
                                    <option value="">Select Owner</option>
                                    <option value="Hypermedia">Hypermedia</option>
                                    <option value="Mall Owned">Mall Owned</option>
                                    <option value="MAF Owned">MAF Owned</option>
                                    <option value="Metro Owned">Metro Owned</option>
                                    <option value="Lulu Owned">Lulu Owned</option>
                                    <option value="Carrefour Owned">Carrefour Owned</option>
                                    <option value="Abu Dhabi Union Co-op">Abu Dhabi Union Co-op</option>
                                    <option value="Sharjah Union Co-op">Sharjah Union Co-op</option>
                                </select>                
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Department</label>
                            <div class="col-sm-9">
                                <select name="department_id" class="form-control" id="department_id" required>
                                    <option  value="">Select Department</option>
                                    @if($department)
                                        <option value="{{ $department->id }}" selected>{{ $department->name }}</option>
                                    @endif
                                </select>
                                @if ($errors->has('department_id'))
                                    <span class="text-danger">{{ $errors->first('department_id') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Installation Time</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control installation_time" name="installation_time" value="{{$installation_time}}"
                                       placeholder="Day(s) Hours:Minutes">
                                @if ($errors->has('installation_time'))
                                    <span class="text-danger">{{ $errors->first('installation_time') }}</span>
                                @endif
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
                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Assigned to
                                network</label>
                            <div class="col-sm-9">
                                <select name="network" class="form-control">
                                    <option disabled selected>Select a network</option>
                                    @foreach($networks as $key => $value)
                                        <option
                                            value="{{$key}}" {{ $key == $current_network ? 'selected="selected"' : '' }}>{{ $value }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('status'))
                                    <span class="text-danger">{{ $errors->first('status') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Status</label>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js" integrity="sha512-d4KkQohk+HswGs6A1d6Gak6Bb9rMWtxjOa0IiY49Q3TeFd5xAzjWXDCBW9RS7m86FQ4RzM2BdHmdJnnKRYknxw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script>

        $(function () {
            $('#status').select2({
                width: '100%'
            });
            $('#department_id').select2({
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

            console.log('Ready...')
            $.mask.definitions['D'] = "[0-3]";
            $.mask.definitions['d'] = "[0-9]";
            $.mask.definitions['H'] = "[0-1]";
            $.mask.definitions['h'] = "[0-9]";
            $.mask.definitions['M'] = "[0-5]";
            $.mask.definitions['m'] = "[0-9]";

            $(".installation_time").mask("Dd Hh:Mm");
        });
        @if($status)
        $('#status').val('{!!$status!!}').trigger('change');
        @endif
        @if($owner)
        $('#owner').val('{!!$owner!!}');
        @endif

    </script>
@endpush

@extends('layouts.admin')
@section('content')
    @php
        if(old('name')){
            $name = old('name');
            $building_name = old('building_name');
            $street = old('street');
            $city = old('city');
            $area = old('area');
            $country = old('country');
            $near_by_landmark = old('near_by_landmark');
            $status = old('status');
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $building_name = $data->building_name;
            $street = $data->street;
            $city = $data->city;
            $area = $data->area;
            $country = $data->country;
            $near_by_landmark = $data->near_by_landmark;
            $status = $data->status;
        }
        else{
            $name = null;
            $building_name = null;
            $street = null;
            $city = null;
            $area = null;
            $country = null;
            $near_by_landmark = null;
            $status = null;
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Locations</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Locations
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="card">
                <form class="form-horizontal" method="post" action="{{ $action }}">
                    @csrf
                    <div class="card-body">
                        <h4 class="card-title">{{ $add }}</h4>
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
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Building Name/Apartment Number</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="building_name" value="{{$building_name}}"
                                       placeholder="Building Name/Apartment Number Here">
                                @if ($errors->has('building_name'))
                                    <span class="text-danger">{{ $errors->first('building_name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Street</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="street" value="{{$street}}"
                                       placeholder="Street Here">
                                @if ($errors->has('street'))
                                    <span class="text-danger">{{ $errors->first('street') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Area</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="area" value="{{$area}}"
                                       placeholder="Area Here">
                                @if ($errors->has('area'))
                                    <span class="text-danger">{{ $errors->first('area') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">City</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="city" value="{{$city}}"
                                       placeholder="City Here">
                                @if ($errors->has('city'))
                                    <span class="text-danger">{{ $errors->first('city') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Country</label>
                            <div class="col-sm-9">
                                <input type="tel" class="form-control" name="country" value="{{$country}}"
                                       placeholder="Country Here">
                                @if ($errors->has('country'))
                                    <span class="text-danger">{{ $errors->first('country') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Near By Landmark</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="near_by_landmark" value="{{$near_by_landmark}}"
                                       placeholder="Near By Landmark Here">
                                @if ($errors->has('near_by_landmark'))
                                    <span class="text-danger">{{ $errors->first('near_by_landmark') }}</span>
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

    <script>

        $(function () {
            $('#status').select2({
                width: '100%'
            });
            console.log('Ready...')
        });
        @if($status)
        $('#status').val('{!!$status!!}').trigger('change');
        @endif

    </script>
@endpush

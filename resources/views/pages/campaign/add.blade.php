@extends('layouts.admin')
@section('content')
    <link rel="stylesheet" href="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.css') }}">
    <style>
        .select2-dropdown{width:180px !important;}
    </style>
    @php
        $count = 0;
        $buckets = collect();
        if(old('name')){
            $name = old('name');
            $agency = old('agency');
            $brand = old('brand');
            $client_name = null;
            $department_name =null;
            $contract_name = old('contract_name');
            $contract_number = old('contract_number');
            $description = old('description');
            $start_date = old('start_date');
            $start_time = old('start_time');  
            $end_date = old('end_date');
            $end_time = old('end_time');
            $campaign_type = old('campaign_type');
            $payment_status = old('payment_status');
            $booking_order = old('booking_order');
            $status = old('status');
            $market = old('market');
            $type = old('type');
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $agency = $data->agency;
            $brand = $data->brand;
            $client_name = $data->client ?? null;
            $department_name = $data->department ?? null;
            $contract_name = $data->contract_name;
            $contract_number = $data->contract_number;
            $description = $data->description;
            $start_date = $data->start_date ? \Carbon\Carbon::parse($data->start_date)->format('d/m/Y') : null;
            $start_time = $data->start_time ? \Carbon\Carbon::parse($data->start_time)->format('H:i') : null;
            $end_date = $data->end_date ? \Carbon\Carbon::parse($data->end_date)->format('d/m/Y') : null;
            $end_time = $data->end_time ? \Carbon\Carbon::parse($data->end_time)->format('H:i') : null;
            $campaign_type = $data->campaign_type;
            $payment_status = $data->payment_status;
            $booking_order = $data->booking_order;
            $status = $data->status;
            $market = $data->market;
            $type = $data->type;
            $buckets = $data->buckets ? $data->buckets->load('locations','assets','assetNetwork') : collect();
        }
        else{
            $name = null;
            $agency = null;
            $brand = null;
            $client_name = null;
            $department_name = null;
            $contract_name = null;
            $contract_number = null;
            $description = null;
            $start_date = null;
            $start_time = '00:00';
            $end_date = null;
            $end_time = '00:00';
            $campaign_type = null;
            $payment_status = null;
            $booking_order = null;
            $status = null;
            $market = null;
            $type = null;
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
                    <h4 class="page-title">Campaign</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Campaign
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
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="name" value="{{$name}}"
                                           placeholder="Name Here" required>
                                    @if ($errors->has('name'))
                                        <span class="text-danger">{{ $errors->first('name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Agency</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="agency" value="{{$agency}}"
                                           placeholder="Agency Here" required>
                                    @if ($errors->has('agency'))
                                        <span class="text-danger">{{ $errors->first('agency') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Client</label>
                                <div class="col-sm-9">
                                    <select name="client_name" class="form-control" id="client_name" required>
                                        <option>Select Client</option>
                                        @if($client_name)
                                            <option value="{{ $client_name->id }}"
                                                    selected>{{ $client_name->name }}</option>
                                        @endif
                                    </select>
                                    @if ($errors->has('client_name'))
                                        <span class="text-danger">{{ $errors->first('client_name') }}</span>
                                    @endif
                                </div>
                            </div>
{{--                            <div class="form-group row col-md-6">--}}
{{--                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Brand</label>--}}
{{--                                <div class="col-sm-9">--}}
{{--                                    <input type="text" class="form-control" name="brand" value="{{$brand}}"--}}
{{--                                           placeholder="Brand Here" required>--}}
{{--                                    @if ($errors->has('brand'))--}}
{{--                                        <span class="text-danger">{{ $errors->first('brand') }}</span>--}}
{{--                                    @endif--}}
{{--                                </div>--}}
{{--                            </div>--}}
                            <div class="form-group row col-md-6">
                                <label for="email1" class="col-sm-3 text-end control-label col-form-label">Department</label>
                                <div class="col-sm-9">
                                    <select type="text" name="department_id" id="department_id" class="form-control" required>
                                        <option value="">Select Department</option>
                                        @if($department_name)
                                            <option value="{{ $department_name->id }}"
                                                    selected>{{ $department_name->name }}</option>
                                        @endif
                                    </select>
                                    @if ($errors->has('department_id'))
                                        <span class="text-danger">{{ $errors->first('department_id') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Contract
                                    Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="contract_name"
                                           value="{{$contract_name}}"
                                           placeholder="Contract Name Here" required>
                                    @if ($errors->has('contract_name'))
                                        <span class="text-danger">{{ $errors->first('contract_name') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Contract
                                    Number</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="contract_number"
                                           value="{{$contract_number}}"
                                           placeholder="Contract Number Here" required>
                                    @if ($errors->has('contract_number'))
                                        <span class="text-danger">{{ $errors->first('contract_number') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Starting
                                    at</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control date_mask" name="start_date"
                                           value="{{ $start_date }}" placeholder="Start Date here"
                                           required>
                                    @if ($errors->has('start_date'))
                                        <span class="text-danger">{{ $errors->first('start_date') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Starting at
                                    Time</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control time_mask" name="start_time"
                                           value="{{ $start_time }}" placeholder="Start time here"
                                           required>
                                    @if ($errors->has('start_time'))
                                        <span class="text-danger">{{ $errors->first('start_time') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Ending
                                    At</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control date_mask" name="end_date"
                                           value="{{ $end_date }}" placeholder="End Date here"
                                           required>
                                    @if ($errors->has('end_date'))
                                        <span class="text-danger">{{ $errors->first('end_date') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-3 text-end control-label col-form-label">Ending At
                                    Time</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control time_mask" name="end_time"
                                           value="{{ $end_time }}" placeholder="End time here"
                                           required>
                                    @if ($errors->has('end_time'))
                                        <span class="text-danger">{{ $errors->first('end_time') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="email1" class="col-sm-3 text-end control-label col-form-label">Campaign
                                    Type</label>
                                <div class="col-sm-9">
                                    <select type="text" name="campaign_type" id="campaign_type" class="form-control">
                                        <option value="Confirmed">Confirmed</option>
                                        <option value="Tentative">Tentative</option>
                                    </select>
                                    @if ($errors->has('campaign_type'))
                                        <span class="text-danger">{{ $errors->first('campaign_type') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="email1" class="col-sm-3 text-end control-label col-form-label">Payment
                                    Status</label>
                                <div class="col-sm-9">
                                    <select type="text" name="payment_status" id="payment_status" class="form-control">
                                        <option value="Pending">Pending</option>
                                        <option value="Completed">Completed</option>
                                    </select>
                                    @if ($errors->has('payment_status'))
                                        <span class="text-danger">{{ $errors->first('payment_status') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="email1" class="col-sm-3 text-end control-label col-form-label">Booking
                                    Order</label>
                                <div class="col-sm-9">
{{--                                    <select type="text" name="booking_order" id="booking_order" class="form-control">--}}
{{--                                        <option value="Typing">Typing</option>--}}
{{--                                        <option value="Not Applicable">Not Applicable</option>--}}
{{--                                        <option value="InProgress">InProgress</option>--}}
{{--                                    </select>--}}
                                    <div class="typeahead__container">
                                        <div class="typeahead__field">
                                            <div class="typeahead__query">
                                                <input class="js-typeahead form-control"
                                                       name="booking_order"
                                                       autocomplete="off" value="{{ $booking_order }}">
                                            </div>
                                        </div>
                                    </div>
{{--                                    <input type="text" class="form-control js-typeahead" name="booking_order" value="{{ $booking_order }}" />--}}
                                    @if ($errors->has('booking_order'))
                                        <span class="text-danger">{{ $errors->first('booking_order') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="email1" class="col-sm-3 text-end control-label col-form-label">Booking
                                    Order File</label>
                                <div class="col-sm-9">
                                    <input type="file" name="booking_order_file" id="booking_order_file"
                                           class="form-control" accept=".xlsx, .xls, .csv, .pdf">
                                    @if ($errors->has('booking_order_file'))
                                        <span class="text-danger">{{ $errors->first('booking_order_file') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group row col-md-6">
                                <label for="email1"
                                       class="col-sm-3 text-end control-label col-form-label">Market</label>
                                <div class="col-sm-9">
                                    <select type="text" name="market" id="market" class="form-control">
                                        @include('includes.admin.select.country')
                                    </select>
                                    @if ($errors->has('market'))
                                        <span class="text-danger">{{ $errors->first('market') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="email1"
                                       class="col-sm-3 text-end control-label col-form-label">Status</label>
                                <div class="col-sm-9">
                                    <select type="text" name="status" id="status" class="form-control">
                                        <option value="Not Started">Not Started</option>
                                        <option value="Active">Active</option>
                                        <option value="Completed">Completed</option>
                                        <option value="Cancelled">Cancelled</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                    @if ($errors->has('status'))
                                        <span class="text-danger">{{ $errors->first('status') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                            <div class="form-group row col-md-6">
                            <label for="email1"
                                       class="col-sm-3 text-end control-label col-form-label">Type</label>
                                <div class="col-sm-9">
                                    <select type="text" name="type" id="type" class="form-control">
                                        <option >Select</option>
                                        <option value="digital">Digital</option>
                                        <option value="Static">Static</option>
                                        <!-- <option value="Completed">Completed</option>
                                        <option value="Cancelled">Cancelled</option>
                                        <option value="Inactive">Inactive</option> -->
                                    </select>
                                    @if ($errors->has('type'))
                                        <span class="text-danger">{{ $errors->first('type') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group row col-md-6">
                                <label for="fname" class="col-sm-2 text-end control-label col-form-label">Description</label>
                                <div class="col-sm-9">
                                <textarea class="form-control" name="description"
                                          placeholder="Description Here">{{$description}}</textarea>
                                    @if ($errors->has('description'))
                                        <span class="text-danger">{{ $errors->first('description') }}</span>
                                    @endif
                                </div>
                            </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Buckets</h4>
                    </div>
                    <div style="display: flex; justify-content: flex-end; padding: 10px">
                        <button class="btn btn-primary" id="add_btn"><i class="fa fa-plus"> Add Bucket</i></button>
                    </div>
                    <div class="buckets_div"
                         style="padding-left: 10px; font-size: 0.7rem;display: flex; flex-flow: column; ">
                        @if($buckets->count())
                            @foreach($buckets as $bucket)
                                <div class="row  row-data" style="margin-right: 0;">
                                    <input type="hidden" name="bucket_id[{{ $count }}]" value="{{$bucket->id}}">
                                    <div class="form-group row col-md-6">

                                        <div class="form-group col-md-3">
                                            <label class="mt-3">Start Date</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control date_mask" name="bucket_start_date[{{ $count }}]" id="start_date_{{ $count }}" value="{{ \Carbon\Carbon::parse($bucket->start_date)->format('d/m/Y') }}"
                                                    placeholder="Start Date" required>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="mt-3">End Date</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control date_mask" id="end_date_{{ $count }}" name="bucket_end_date[{{ $count }}]"
                                                   placeholder="End Date"
                                                   value="{{ \Carbon\Carbon::parse($bucket->end_date)->format('d/m/Y') }}"
                                                    placeholder="End Date" required>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="mt-3">Department{{ $count }}</label>
                                            <div class="input-group">
                                                <select type="text" name="bucket_department[{{ $count }}]" id="department_{{ $count }}" class="form-control department">
                                                    <option value="{{ $bucket->assets->department->id }}" selected="selected">{{ $bucket->assets->department->name }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="mt-3">Location</label>
                                            <div class="input-group">
                                                <div class="input-group">
                                                    <select type="text" name="bucket_location[{{ $count }}]" id="location_{{ $count }}" class="form-control locations">
                                                        <option value="{{ $bucket->location }}" selected>{{ $bucket->locations->name }}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="form-group row col-md-6">
                                        <div class="form-group col-md-3">
                                            <label class="mt-3">Type</label>
                                            <div class="input-group">
                                                <select type="text" name="bucket_assettype[{{$count}}]" id="assettype_{{$count}}" class="form-control assettype">
                                                    <option value="0" >Select Type</option>
                                                    <option value="digital" @if($bucket->asset_type == 'digital') selected @endif>Digital</option>
                                                    <option value="static" @if($bucket->asset_type == 'static') selected @endif>Static</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="mt-3">Assets</label>
                                            <div class="input-group">
                                                <select type="text" name="bucket_assetname[{{$count}}]" id="assetname_{{$count}}" class="form-control filter assetname" required>
                                                    <option value="{{ $bucket->assets->name}}" selected="selected">{{ $bucket->assets->name}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label class="mt-3">Specific Asset</label>
                                            <div class="input-group">
                                                <!-- <select class="form-control assets" id="ref_no"  name="bucket_asset[0]"
                                                        required>{!! getAssetAndNetwork() !!} </select> -->
                                                    <select class="form-control assets" id="refno_{{ $count }}"  name="bucket_asset[{{ $count++ }}]"
                                                        required>{!! getAssetAndNetwork($bucket->asset ? ['asset',$bucket->asset] : ['network',$bucket->asset_network]) !!}</select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group col-md-1">
                                                <button class="btn-danger remove-row"><i class="fa fa-minus"></i></button>
                                            </div>
                                        </div>                                       

                                    <div class="details_div" style="display: flex; flex-flow: row;">
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                   class="col-sm-4 text-end control-label col-form-label">Asset
                                                Type</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary asset_type" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                   class="col-sm-4 text-end control-label col-form-label">Quantity</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary quantity" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                   class="col-sm-4 text-end control-label col-form-label">Availability</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary availability" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                   class="col-sm-4 text-end control-label col-form-label">Installation
                                                Time</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary inst_time" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @else
                            <div class="row  row-data" style="margin-right: 0;">
                                <div class="form-group row col-md-6">
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">Start Date</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control date_mask" name="bucket_start_date[0]" id="start_date_0"  placeholder="Start Date" required>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">End Date</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control date_mask" name="bucket_end_date[0]" id="end_date_0"  placeholder="End Date" required>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">Department</label>
                                            <div class="input-group">
                                                <select type="text" name="bucket_department[0]" id="department_0" class="form-control department">
                                                    <option value="0" selected="selected">Select Department</option>
                                                </select>
                                            </div>
                                        </div>
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">Location</label>
                                        <div class="input-group">
                                            <div class="input-group">
                                                <select type="text" name="bucket_location[0]" id="location_0" class="form-control locations">
                                                    <option value="0" selected="selected">Select Location</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="form-group row col-md-6">
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">Type</label>
                                        <div class="input-group">
                                            <select type="text" name="bucket_assettype[0]" id="assettype_0" class="form-control assettype">
                                                <option value="0">Select Type</option>
                                                <option value="digital">Digital</option>
                                                <option value="static">Static</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label class="mt-3">Assets</label>
                                        <div class="input-group">
                                            <select type="text" name="bucket_assetname[0]" id="assetname_0" class="form-control filter assetname" required>
                                                <option value="0" selected="selected">Select Assets</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label class="mt-3">Specific Asset</label>
                                        <div class="input-group">
                                            <!-- <select class="form-control assets" id="ref_no"  name="bucket_asset[0]"
                                                    required>{!! getAssetAndNetwork() !!} </select> -->
                                                <select class="form-control assets" id="refno_0"  name="bucket_asset[0]"
                                                    required> </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group col-md-1">
                                            <button class="btn-danger remove-row"><i class="fa fa-minus"></i></button>
                                        </div>
                                    </div>
                                    <div class="details_div" style="display: flex; flex-flow: row;">
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                class="col-sm-4 text-end control-label col-form-label">Asset Type</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary asset_type" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                class="col-sm-4 text-end control-label col-form-label">Quantity</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary quantity" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                class="col-sm-4 text-end control-label col-form-label">Availability</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary availability" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row col-md-3">
                                            <label for="fname"
                                                class="col-sm-4 text-end control-label col-form-label">Installation
                                                Time</label>
                                            <div class="col-sm-7">
                                                <div class="alert alert-secondary inst_time" role="alert">
                                                    ---
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
            integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"
            integrity="sha512-d4KkQohk+HswGs6A1d6Gak6Bb9rMWtxjOa0IiY49Q3TeFd5xAzjWXDCBW9RS7m86FQ4RzM2BdHmdJnnKRYknxw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
        <script src="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.js') }}"></script>
    <script>
        $count = {{ $count ?? 1 }};
        if ($count < 1) {
            $count = 1;
        }
        $(function () {
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

            
            $('.js-typeahead').typeahead({
                // input: '.js-typeahead',
                order: "desc",
                source: {
                    data: [
                        "Not Applicable", "In Progress"
                    ]
                },callback: {
                    onInit: function () {
                        console.log('Initializing js type ahead')
                    }
                }
            });

            $('#add_btn').on('click', function (e) {
                e.preventDefault()
                addRow();
            });

            $('body').on('click', '.remove-row', function (e) {
                e.preventDefault()
                $(this).closest('.row-data').remove()
            })

            $('#status').select2({
                width: '100%'
            });
            $('#market').select2({
                width: '100%'
            });

            $('#campaign_type').select2({
                width: '100%'
            });
            $('#payment_status').select2({
                width: '100%'
            });
            $('#booking_order').select2({
                width: '100%'
            });

            function addRow() {
                $html = '<div class="row row-data" style="margin-right: 0;">' +
                '           <div class="form-group row col-md-6"> ' +
                '                   <div class="form-group col-md-3"> '+
                '                       <label class="mt-3">Start Date</label> '+
                '                       <div class="input-group"> '+
                '                           <input type="text" class="form-control date_mask" id="start_date_' + $count + '" name="bucket_start_date[' + $count + ']" '+
                '                               placeholder="Start Date" required> '+
                '                       </div> '+
                '                   </div> '+
                '                   <div class="form-group col-md-3"> '+
                '                       <label class="mt-3">End Date</label> '+
                '                       <div class="input-group"> '+
                '                           <input type="text" class="form-control date_mask" id="end_date_' + $count + '" name="bucket_end_date[' + $count + ']" '+
                '                               placeholder="End Date" required> '+
                '                       </div> '+
                '                   </div> '+
                '                   <div class="form-group col-md-3"> '+
                '                      <label class="mt-3">Department</label> '+
                '                            <div class="input-group"> '+
                '                                <select type="text" name="bucket_department[' + $count + ']" id="department_' + $count + '" class="form-control department" required> '+
                '                                   <option value="0" selected="selected">Select Department</option> '+
                '                               </select> '+
                '                           </div>'+
                '                      </div> '+
                '                   <div class="form-group col-md-3"> '+
                '                       <label class="mt-3">Location</label> '+
                '                       <div class="input-group"> '+
                '                           <div class="input-group"> '+
                '                               <select name="bucket_location[' + $count + ']"  id="location_' + $count + '" class="form-control locations" required> '+
                '                                   <option value="0" disabled selected>Select Location</option> '+
                '                              </select> '+
                '                           </div> '+
                '                       </div> '+
                '                   </div> '+
               
                '               </div> '+
                '               <div class="form-group row col-md-6"> '+
                '                   <div class="form-group col-md-3"> '+
                '                       <label class="mt-3">Type</label> '+
                '                       <div class="input-group"> '+
                '                           <select type="text" name="bucket_assettype[' + $count + ']" id="assettype_' + $count + '" class="form-control assettype"> '+
                '                               <option value="0">Select Type</option> '+
                '                               <option value="digital">Digital</option> '+
                '                               <option value="static">Static</option> '+
                '                           </select> '+
                '                       </div> '+
                '                   </div> '+
                '                   <div class="form-group col-md-3"> '+
                '                       <label class="mt-3">Assets</label> '+
                '                       <div class="input-group"> '+
                '                           <select type="text" name="bucket_assetname[' + $count + ']" id="assetname_' + $count + '" class="form-control filter assetname" required> '+
                '                               <option value="0" selected="selected">Select Assets</option> '+
                '                           </select> '+
                '                       </div> '+
                '                   </div> '+
                '                   <div class="form-group col-md-5"> '+
                '                       <label class="mt-3">Specific Asset</label> '+
                '                       <div class="input-group"> '+
                '                               <select class="form-control assets" id="refno_' + $count + '"  name="bucket_asset[' + $count++ + ']" '+
                '                                   required> </select> '+
                '                       </div> '+ 
                '                   </div> '+
                
                '                   <div class="form-group col-md-1"> '+
                '                           <button class="btn-danger remove-row"><i class="fa fa-minus"></i></button> '+
                '                       </div> '+
                '                   </div> '+


                    // '        <div class="form-group row col-md-3">' +
                    // '            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Asset</label>' +
                    // '            <div class="col-sm-9">' +
                    // '                 <select class="form-control assets" name="bucket_asset[' + $count + ']" required> {!! getAssetAndNetwork() !!}</select>' +
                    // '            </div>' +
                    // '         </div>' +
                    // '             <div class="form-group row col-md-3">' +
                    // '             <label for="fname"' +
                    // '            class="col-sm-4 text-end control-label col-form-label">Location</label>' +
                    // '        <div class="col-sm-8">' +
                    // '             <select class="form-control locations" name="bucket_location[' + $count + ']" required>' +
                    // '                <option disabled selected>Select Location</option>' +
                    // '            </select>' +
                    // '         </div>' +
                    // '    </div>' +
                    // '         <div class="form-group row col-md-3">' +
                    // '             <label for="fname" class="col-sm-3 text-end control-label col-form-label">Start Date</label>' +
                    // '            <div class="col-sm-7">' +
                    // '                 <input type="text" class="form-control date_mask" name="bucket_start_date[' + $count + ']" placeholder="Start Date" required>' +
                    // '            </div>' +
                    // '         </div>' +
                    // '         <div class="form-group row col-md-3">' +
                    // '             <label for="fname" class="col-sm-3 text-end control-label col-form-label">End Date</label>' +
                    // '            <div class="col-sm-7">' +
                    // '                 <input type="text" class="form-control date_mask" name="bucket_end_date[' + $count++ + ']" placeholder="End Date" required>' +
                    // '            </div>' +
                    // '            <div class="col-sm-2">' +
                    // '                <button class="btn-danger remove-row"><i class="fa fa-minus"></i></button>' +
                    // '            </div>' +
                    // '         </div>' +
                    '         <div class="details_div" style="display: flex; flex-flow: row;">' +
                    '             <div class="form-group row col-md-3">' +
                    '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Asset Type</label>' +
                    '                <div class="col-sm-7">' +
                    '                    <div class="alert alert-secondary asset_type" role="alert">' +
                    '                        ---' +
                    '                    </div>' +
                    '                 </div>' +
                    '            </div>' +
                    '            <div class="form-group row col-md-3">' +
                    '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Quantity</label>' +
                    '                <div class="col-sm-7">' +
                    '                    <div class="alert alert-secondary quantity" role="alert">' +
                    '                        ---' +
                    '                    </div>' +
                    '                </div>' +
                    '             </div>' +
                    '             <div class="form-group row col-md-3">' +
                    '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Availability</label>' +
                    '                <div class="col-sm-7">' +
                    '                    <div class="alert alert-secondary availability" role="alert"> --- </div>' +
                    '                 </div>' +
                    '            </div>' +
                    '            <div class="form-group row col-md-3">' +
                    '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Installation Time</label>' +
                    '                <div class="col-sm-7">' +
                    '                    <div class="alert alert-secondary inst_time" role="alert"> --- </div>' +
                    '                </div>' +
                    '            </div>' +
                    '        </div>' +
                    '    </div>';
                $('.buckets_div').append($html);
                initializeSelect()
            }


            function initializeSelect() {
                $(".time_mask").mask("Hh:Ii");
                $(".date_mask").mask("Dd/Mm/Yqwe");

                $(".department:visible").each(function (ii, ele) {
                        if ($(ele).hasClass("select2-hidden-accessible")) {
                            $(ele).select2('destroy');
                        }
                        $(ele).select2({
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
                                // alert('fsadf');
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
                    $('#department_'+ii).on("select2:selecting", function(e) { 
                            $('#assetname_'+ii).val('0').trigger('change')
                            $('#refno_'+ii).val('0').trigger('change')
                            $('#location_'+ii).val('0').trigger('change')
                        });
                });
                         
                $(".assetname:visible").each(function (ii, ele) {
                    if ($(ele).hasClass("select2-hidden-accessible")) {
                        $(ele).select2('destroy');
                    }
                    $(ele).select2({
                        width: '100%',
                        ajax: {
                            url: '{{ route('select-2-get-asset-name') }}',
                            data: function (params) {
                                var id = $(this).attr('id');
                                var number = id.split("_");     
                                var query = {
                                    search: params.term,
                                    department:$('#department_'+number[1]).val(),
                                    location:$('#location_'+number[1]).val(),
                                    assettype:$('#assettype_'+number[1]).val(),
                                    type: 'public'
                                }
                                return query;
                            },
                            processResults: function (data) {
                                // Transforms the top-level key of the response object from 'items' to 'results'
                                console.log(data);
                                return {
                                    results: $.map(data, function (item) {
                                        return {
                                            text: item.name,
                                            id: item.name
                                        }
                                    })
                                }
                            }
                        }
                    });
                });

                $(".locations:visible").each(function (ii, ele) {
                    if ($(ele).hasClass("select2-hidden-accessible")) {
                        $(ele).select2('destroy');
                    }
                    $(ele).select2({
                        width: '100%',
                        ajax: {
                            url: '{{ route('select-2-get-locations') }}',
                            data: function (params) {
                                var query = {
                                    search: params.term,
                                    department:$('#department_'+ii).val(),
                                    type: 'public'
                                }
                                return query;
                            },
                            processResults: function (data) {
                                // Transforms the top-level key of the response object from 'items' to 'results'
                                console.log(data);
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
                    $('#location_'+ii).on("select2:selecting", function(e) { 
                            $('#assetname_'+ii).val('0').trigger('change')
                            $('#refno_'+ii).val('0').trigger('change')
                        });
                });

                
                $('body').on('change', '.filter', function (e) {
                    var val = $(this).val();
                    var id = $(this).attr('id');
                    var number = id.split("_");            
                    var CSRF_TOKEN = '{{ csrf_token() }}';
                    $.ajax({
                        url: '{{ route('select-2-get-asset-namennetwork') }}',                    
                        type: 'POST',
                        data: {_token: CSRF_TOKEN,                        
                                name:val,
                                department:$('#department_'+number[1]).val(),
                                location:$('#location_'+number[1]).val(),
                                assettype:$('#assettype_'+number[1]).val(),
                            },
                        dataType: 'text',
                        success:function(response){
                            console.log(response);
                            var $select = $('#refno_'+number[1]);
                            // $select.find('option').remove();
                            $select.html(response);
                            $('#refno_'+number[1]).select2();
                            
                        },error:function(xhr){
                            console.log(xhr)
                        }
                    })
                });
                

                $(".assets:visible").each(function (ii, ele) {
                    if ($(ele).hasClass("select2-hidden-accessible")) {
                        $(ele).select2('destroy');
                    }
                    $(ele).select2({
                        width: '100%'
                    }).on('select2:select', function () {                       
                        var startdate = $('#start_date_' + ii).val();
                        var enddate = $('#end_date_' + ii).val();
                        var location = $('#location_' + ii).val();
                        if(startdate == '' || enddate == '' || location==0)
                        {
                            $.dialog({
                                title: 'Warning!',
                                content: 'Select Location & Date Range!',
                            });
                            $('#refno_'+ii).val('0').trigger('change')
                        }
                        else
                        {
                            $this = $(this).val()
                            $main = $(this).closest('.row-data');
                            $main.LoadingOverlay('show');
                            $.ajax({
                                url: '{{ route('admin-campaign-bucket-get-asset-data') }}',
                                method: 'post',
                                async: false,
                                data: {
                                    data: $this,
                                    startdate: startdate,
                                    enddate: enddate,
                                },
                                success: function (response) {
                                    if (response.status === 'Success') {
                                        $asset_type = response.data.asset_type;
                                        $quantity = response.data.quantity;
                                        $availability = response.data.availability;
                                        $inst_time = response.data.inst_time;
                                        $main.find('.asset_type').html($asset_type)
                                        $main.find('.quantity').html($quantity)
                                        $main.find('.availability').html($availability)
                                        $main.find('.inst_time').html($inst_time)
                                        $main.LoadingOverlay('hide');
                                    }
                                },
                                error: function (xhr) {
                                    console.log(xhr)
                                }
                            })
                        }
                    });
                });
            }

            $('#client_name').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-clients') }}',
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


                   // $('.location').select2({
                //     width: '100%',
                //     ajax: {
                //         url: '{{ route('select-2-get-locations') }}',
                //         data: function (params) {
                //             var query = {
                //                 search: params.term,
                //                 type: 'public'
                //             }
                //             return query;
                //         },
                //         processResults: function (data) {
                //             // Transforms the top-level key of the response object from 'items' to 'results'
                //             return {
                //                 results: $.map(data, function (item) {
                //                     return {
                //                         text: item.name,
                //                         id: item.id
                //                     }
                //                 })
                //             }
                //         }
                //     }
                // });

                

                // $('#ref_no').select2({
                //     width: '100%',
                //     ajax: {
                //         url: '{{ route('select-2-get-asset-namennetwork') }}',
                //         datatype:'text',
                //         data: function (params) {
                //             var query = {
                //                 search: params.term,
                //                 type: 'public',
                //                 department: $('#department').val(),
                //                 location:$('#location').val(),
                //                 name:$('#asset_name').val(),
                //                 assettype:$('#assettype').val()
                //             }
                //             return query;
                //         },
                //         processResults: function (data) {
                //             console.log(data);
                //             // var $select = $('#ref_no');
                //             // $select.find('option').remove();
                //             // $select.append(data)
                //             // Transforms the top-level key of the response object from 'items' to 'results'
                //             return {
                //                 results: $.map(data, function (item) {
                //                     return {
                //                         text: item.name,
                //                         id: item.id
                //                     }
                //                 })
                //             }
                //         }
                //     }
                // });

                // $('body').on('click', '#ref_no', function (e) {
                //     let department = $('#department').val();
                //     let location = $('#location').val();
                //     let name =  $('#asset_name').val();
                //     var CSRF_TOKEN = '{{ csrf_token() }}';
                //     $.ajax({
                //         url: '{{ route('select-2-get-asset-namennetwork') }}',                    
                //         type: 'POST',
                //         data: {_token: CSRF_TOKEN,                        
                //                 department:department,
                //                 location:location,
                //                 name:name,
                //                 assettype:$('#assettype').val(),
                //             },
                //         dataType: 'text',
                //         success:function(response){
                //             console.log(response);
                //             var $select = $('#ref_no');
                //             $select.find('option').remove();
                //             $select.append(response)
                //         },error:function(xhr){
                //             console.log(xhr)
                //         }
                //     })
                // });


            $.mask.definitions['D'] = "[0-3]";
            $.mask.definitions['d'] = "[0-9]";
            $.mask.definitions['M'] = "[0-1]";
            $.mask.definitions['m'] = "[0-9]";
            $.mask.definitions['Y'] = "[2]";
            $.mask.definitions['q'] = "[0]";
            $.mask.definitions['w'] = "[1-2]";
            $.mask.definitions['e'] = "[0-9]";
            $.mask.definitions['H'] = "[0-2]";
            $.mask.definitions['h'] = "[0-9]";
            $.mask.definitions['I'] = "[0-5]";
            $.mask.definitions['i'] = "[0-9]";
            $.mask.definitions['S'] = "[0-5]";
            $.mask.definitions['s'] = "[0-9]";

            // $(".time_mask").mask("Hh:Ii");
            // $(".date_mask").mask("Dd/Mm/Yqwe");


            console.log('Ready...')
            initializeSelect()

            @if($buckets->count())
            $(".assets:visible").each(function (ii, ele) {
                $(ele).trigger('select2:select');
            })
            @endif

        });
        @if($status)
        $('#status').val('{!!$status!!}').trigger('change');
        @endif
        @if($market)
        $('#market').val('{!!$market!!}').trigger('change');
        @endif
        @if($campaign_type)
        $('#campaign_type').val('{!!$campaign_type!!}').trigger('change');
        @endif
        @if($payment_status)
        $('#payment_status').val('{!!$payment_status!!}').trigger('change');
        @endif
{{--        @if($booking_order)--}}
{{--        $('#booking_order').val('{!!$booking_order!!}').trigger('change');--}}
{{--        @endif--}}


    </script>
@endpush

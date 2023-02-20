@extends('layouts.admin')
@section('content')
    <link href="{{ asset('assets/expand.css') }}" rel="stylesheet"/>
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
                <div class="card-body">
                    {{--                    <h5 class="card-title">Basic Datatable</h5>--}}
                    <div class="table-responsive">
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                        <a class="btn btn-primary" href="{{ route('admin-assets-add') }}"><i
                                                class="fa fa-plus"> Add Asset</i></a>
                                    </div>
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                        <div
                                            class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                            <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                        </div>
                                    @endif
                                    <div style="padding:0px 15px;border:0.5px solid lightgray;border-radius:20px;margin-bottom: 10px;">
                                        <div class="row filters mb-4">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Package Type</label>
                                                        <div class="input-group">
                                                            <select type="text" name="market" id="market" class="form-control">
                                                                <option value="0" selected="selected">Select Package Type</option>
                                                                <option value="package">Package</option>
                                                                <option value="individual">Individual</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Type</label>
                                                        <div class="input-group">
                                                            <select type="text" name="type" id="type" class="form-control">
                                                                <option value="0">Select Type</option>
                                                                <option value="digital">Digital</option>
                                                                <option value="Static">Static</option>
                                                                <option value="Promospace">Promospace</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Location</label>
                                                        <div class="input-group">
                                                            <select type="text" name="location" id="location" class="form-control">
                                                                <option value="0" selected="selected">Select Location</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Owned by</label>
                                                        <div class="input-group">
                                                            <select type="text" name="owned_by" id="owned_by" class="form-control"> 
                                                                <option value="0">Select Owned by</option>                
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Installation Time</label>
                                                        <div class="input-group">
                                                            <select type="text" name="installation_time" id="installation_time" class="form-control">
                                                                <option value="0">Select Installation Time</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Status</label>
                                                        <div class="input-group">
                                                            <select type="text" name="installation_time" id="installation_time" class="form-control">
                                                                <option value="0">Select Status</option>
                                                                <option value="Active">Active</option>
                                                                <option value="Inactive">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Slots</label>
                                                        <div class="input-group">
                                                            <input type="number" class="form-control" id="end_date" placeholder="" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <div class="btn-group"></div>
                                                        <button class="btn btn-primary" style="margin-top: 45px" id="date_reset"><i class="fas fa-redo-alt"> Reset</i></button>
                                                    </div>     
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <table id="zero_config" class="table table-striped table-bordered dataTable table-sm"
                                           role="grid" aria-describedby="zero_config_info" style="font-size: 12px;width: 100%; border-spacing: 0px; border-collapse: separate;">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0">
                                                No
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Package Type
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                OwnedBy
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Type
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Name
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Location
                                            </th>  
                                            <th class="sorting" tabindex="0">
                                                Ref No
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Installation Time
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Slots
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Status
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Action
                                            </th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('custom-scripts')
    <script src="{{asset('assets/expand.js')}}"></script>
    <script>

        $(function () {
            var i =1;
            $.fn.dataTableExt.oStdClasses.sWrapper = "";
            var table = $('#zero_config').DataTable({
                processing: true,
                dom: "<'row'<'col-sm-12 col-md-6 font-12'l><'col-sm-12 col-md-6 font-12'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-5 font-12'i><'col-sm-12 col-md-7 font-12'p>>",
                serverSide: true,
                ajax: "{{ url()->current() }}",
                "drawCallback": function (settings) {
                    $('.img_click').magnificPopup({
                        type: 'image',
                        closeOnContentClick: true,
                        mainClass: "mfp-img-mobile",
                        image: {
                            verticalFit: true,
                        }, zoom: {
                            enabled: true,
                            duration: 200,
                        },
                    });
                },
                columns: [
                    // {data: 'id', name: 'id'},
                    // {"render": function() { return i++; }, orderable: true},
                    {data: 'DT_RowIndex', orderable: false, searchable: false},
                    {data: 'package_type', name: 'package_type', orderable: true, searchable: true},
                    {data: 'owned_by', name: 'owned_by', orderable: true, searchable: true},
                    {data: 'type', name: 'type', orderable: true, searchable: true},
                    {data: 'name', name: 'name', orderable: true, searchable: true},
                    {data: 'location', name: 'location', orderable: true, searchable: true},
                    {data: 'ref_no', name: 'ref_no', orderable: true, searchable: true},
                    {data: 'installation_time', name: 'installation_time'},
                    // {data: 'asset_photo', name: 'asset_photo'},
                    {data: 'slots', name: 'slots'},
                    {data: 'status', name: 'status'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

        });
        
    </script>
@endpush

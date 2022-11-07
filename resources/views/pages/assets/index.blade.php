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
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4" style="margin-left:-20px">
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
                                    <table id="zero_config" class="table table-striped table-bordered dataTable"
                                           role="grid" aria-describedby="zero_config_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0">
                                                No
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
                                                Preview
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
            var table = $('#zero_config').DataTable({
                processing: true,
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
                    {data: 'owned_by', name: 'owned_by', orderable: true, searchable: true},
                    {data: 'type', name: 'type', orderable: true, searchable: true},
                    {data: 'name', name: 'name', orderable: true, searchable: true},
                    {data: 'location', name: 'location', orderable: true, searchable: true},
                    {data: 'ref_no', name: 'ref_no', orderable: true, searchable: true},
                    {data: 'installation_time', name: 'installation_time'},
                    {data: 'asset_photo', name: 'asset_photo'},
                    {data: 'status', name: 'status'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

        });
    </script>
@endpush

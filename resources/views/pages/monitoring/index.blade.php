@extends('layouts.admin')
@section('content')
    <link href="{{ asset('assets/expand.css') }}" rel="stylesheet" />
    <div class="page-wrapper">
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
                <div class="card-body">
                    {{--                    <h5 class="card-title">Basic Datatable</h5>--}}
                    <div class="">
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                        <a class="btn btn-primary" href="{{ route('admin-campaign-monitoring-add') }}"><i class="fa fa-plus"> Add Campaign Monitoring</i></a>
                                    </div>
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                        <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                            <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                        </div>
                                    @endif
                                    <table id="zero_config" class="table table-striped table-bordered dataTable table-sm"
                                           role="grid" aria-describedby="zero_config_info" style="font-size: 12px;width: 100%; border-spacing: 0px; border-collapse: separate;">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0">
                                                Id
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Campaign
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Description
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

            $.fn.dataTableExt.oStdClasses.sWrapper = "";
            var table = $('#zero_config').DataTable({
                processing: true,
                dom: "<'row'<'col-sm-12 col-md-6 font-12'l><'col-sm-12 col-md-6 font-12'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-5 font-12'i><'col-sm-12 col-md-7 font-12'p>>",
                scrollX: true,
                serverSide: true,
                ajax: "{{ url()->current() }}",
                "drawCallback": function( settings ) {
                    $('.img_click').magnificPopup({
                        type: 'image',
                        closeOnContentClick: true,
                        mainClass: "mfp-img-mobile",
                        image: {
                            verticalFit: true,
                        },zoom: {
                            enabled: true,
                            duration: 200,
                        },
                    });
                },
                columns: [
                    // {data: 'id', name: 'id'},
                    {data: 'DT_RowIndex', orderable: false, searchable: false},
                    {data: 'campaign_id', name: 'campaign_id'},
                    {data: 'description', name: 'description'},
                    {data: 'photo_preview', name: 'photo_preview' , orderable: false, searchable: false},
                    {data: 'status', name: 'status'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

        });
    </script>
@endpush

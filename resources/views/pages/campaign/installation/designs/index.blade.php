@extends('layouts.admin')
@section('content')
    <link href="{{ asset('assets/expand.css') }}" rel="stylesheet" />
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Installation Designs</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Installation Designs
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
                                        <a class="btn btn-primary" href="{{ route('admin-campaign-installation-designs-add',['installation_id'=>$installation_id]) }}"><i class="fa fa-plus"> Add Installation Design</i></a>
                                    </div>
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                        <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                            <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                        </div>
                                    @endif
                                    <table id="zero_config" class="table table-striped table-bordered dataTable"
                                           role="grid" aria-describedby="zero_config_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0">
                                                Id
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Installation Type
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


            var table = $('#zero_config').DataTable({
                processing: true,
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
                    {data: 'id', name: 'id'},
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

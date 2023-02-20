@extends('layouts.admin')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Clients</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Clients
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
                                        <a class="btn btn-primary" href="{{ route('admin-clients-add') }}"><i class="fa fa-plus"> Add Clients</i></a>
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
                                                Name
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Email
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Number
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Location
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

    <script>

        $(function () {
            $.fn.dataTableExt.oStdClasses.sWrapper = "";
            var table = $('#zero_config').DataTable({
                processing: true,
                dom: "<'row'<'col-sm-12 col-md-6 font-12'l><'col-sm-12 col-md-6 font-12'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-5 font-12'i><'col-sm-12 col-md-7 font-12'p>>",
                scrollX: true,
                serverSide: true,
                ajax: "{{ url()->current() }}",
                columns: [
                    // {data: 'id', name: 'id'},
                    {data: 'DT_RowIndex', orderable: false, searchable: false},
                    {data: 'name', name: 'name'},
                    {data: 'email', name: 'email'},
                    {data: 'number', name: 'number'},
                    {data: 'location', name: 'location'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

        });
    </script>
@endpush

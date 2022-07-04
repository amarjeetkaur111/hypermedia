@extends('layouts.admin')
@section('content')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
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
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label class="mt-3">Start Date</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control datepicker-autoclose" id="start_date"
                                                       placeholder="dd/mm/yyyy" autocomplete="off"/>
                                                <div class="input-group-append">
                                                    <span class="input-group-text h-100"><i
                                                            class="mdi mdi-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="mt-3">End Date</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control  datepicker-autoclose" id="end_date"
                                                       placeholder="dd/mm/yyyy" autocomplete="off"/>
                                                <div class="input-group-append">
                                                    <span class="input-group-text h-100"><i
                                                            class="mdi mdi-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="btn-group"></div>
                                            <button class="btn btn-primary" style="margin-top: 45px" id="date_reset"><i
                                                    class="fas fa-redo-alt" > Reset</i></button>
                                        </div>
                                        <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                            <a class="btn btn-primary" href="{{ route('admin-campaign-add') }}"><i
                                                    class="fa fa-plus"> Add Campaign</i></a>
                                        </div>
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
                                            <th class="sorting_asc" tabindex="0" width="5%">
                                                Id
                                            </th>
                                            <th class="sorting" tabindex="0" width="15%">
                                                Name
                                            </th>
                                            <th class="sorting" tabindex="0" width="10%">
                                                Type
                                            </th>
                                            <th class="sorting" tabindex="0" width="10%">
                                                Agency
                                            </th>
                                            <th class="sorting" tabindex="0" width="10%">
                                                Client
                                            </th>
                                            <th class="sorting" tabindex="0" width="10%">
                                                Brand
                                            </th>
                                            <th class="sorting" tabindex="0" width="10%">
                                                Status
                                            </th>
                                            <th class="sorting" tabindex="0" width="40%">
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

    <script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
    <script>
        $start = $('#start_date').val()
        $end = $('#end_date').val()

        $(function () {

            $('#date_reset').on('click',function(){
                $('#start_date').val('').change()
                $('#end_date').val('').change()
            })
            $("#start_date").datepicker({
                format: "dd/mm/yyyy",
                changeMonth: true,
                changeYear: true,
                autoclose: true,
                todayHighlight: true,
            }).on('change',function(){
                $start = $('#start_date').val()
                table.draw();
            });

            $("#end_date").datepicker({
                format: "dd/mm/yyyy",
                changeMonth: true,
                changeYear: true,
                autoclose: true,
                todayHighlight: true,
            }).on('change',function(){
                $end = $('#end_date').val()
                table.draw();
            });

            var table = $('#zero_config').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ url()->current() }}",
                    data:function(d) {
                        d.start_date = $start;
                        d.end_date =  $end;
                    }
                },
                columns: [
                    {data: 'id', name: 'id'},
                    {data: 'name', name: 'name'},
                    {data: 'campaign_type', name: 'campaign_type'},
                    {data: 'agency', name: 'agency'},
                    {data: 'client.name', name: 'client_name'},
                    {data: 'brand', name: 'brand'},
                    {data: 'status', name: 'status'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

            $body = $('body');

            $body.on('click', '.assign-button', function () {
                $href = $(this).attr('data-href')
                $.confirm({
                    title: 'Assign Campaign',
                    content: 'url:' + $href,
                    columnClass: 'medium',
                    buttons: {
                        formSubmit: {
                            text: 'Submit',
                            btnClass: 'btn-blue',
                            action: function () {
                                var name = this.$content.find('#user').val();
                                if (!name) {
                                    $.alert('Select a User first');
                                    return false;
                                } else {
                                    $('#from-assign').submit()
                                }
                            }
                        },
                        cancel: function () {
                            //close
                        },
                    },
                });
            });


            $body.on('click', '.status-button', function () {
                $href = $(this).attr('data-href')
                $.confirm({
                    title: 'Select Status!',
                    content: '' +
                        '<form action="' + $href + '" class="formName" method="post" >' +
                        '{{ csrf_field() }}' +
                        '<div class="form-group">' +
                        '<label>Choose Status</label>' +
                        '<select type="text" name="campaign_status" id="campaign_status" class="form-control name">' +
                        '<option selected disabled>Select Status</option>' +
                        '<option value="Active">Active</option>' +
                        '<option value="Installing">Installing</option>' +
                        '<option value="Dismantling">Dismantling</option>' +
                        '<option value="Completed">Completed</option>' +
                        '<option value="Cancelled">Cancelled</option>' +
                        '<option value="Inactive">Inactive</option>' +
                        '</select>' +
                        '</div>' +
                        '</form>',
                    buttons: {
                        formSubmit: {
                            text: 'Submit',
                            btnClass: 'btn-blue',
                            action: function () {
                                var name = this.$content.find('.name').val();
                                if (!name) {
                                    $.alert('Select a status first');
                                    return false;
                                } else {
                                    $('.formName').submit()
                                }
                            }
                        },
                        cancel: function () {
                            //close
                        },
                    },
                });
            })
        });
    </script>
@endpush

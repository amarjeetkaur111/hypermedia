@extends('layouts.admin')
@section('content')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Campaign Installation Types</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Installation Types
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
                                {{-- <div class="row">--}}
                                {{-- <div class="col-md-4">--}}
                                {{-- <label class="mt-3">Start Date</label>--}}
                                {{-- <div class="input-group">--}}
                                {{-- <input type="text" class="form-control datepicker-autoclose"--}}
                                {{-- id="start_date"--}}
                                {{-- placeholder="dd/mm/yyyy" autocomplete="off"/>--}}
                                {{-- <div class="input-group-append">--}}
                                {{-- <span class="input-group-text h-100"><i--}}
                                {{-- class="mdi mdi-calendar"></i></span>--}}
                                {{-- </div>--}}
                                {{-- </div>--}}
                                {{-- </div>--}}
                                {{-- <div class="col-md-4">--}}
                                {{-- <label class="mt-3">End Date</label>--}}
                                {{-- <div class="input-group">--}}
                                {{-- <input type="text" class="form-control  datepicker-autoclose"--}}
                                {{-- id="end_date"--}}
                                {{-- placeholder="dd/mm/yyyy" autocomplete="off"/>--}}
                                {{-- <div class="input-group-append">--}}
                                {{-- <span class="input-group-text h-100"><i--}}
                                {{-- class="mdi mdi-calendar"></i></span>--}}
                                {{-- </div>--}}
                                {{-- </div>--}}
                                {{-- </div>--}}
                                {{-- <div class="col-md-4">--}}
                                {{-- <div class="btn-group"></div>--}}
                                {{-- <button class="btn btn-primary" style="margin-top: 45px" id="date_reset"><i--}}
                                {{-- class="fas fa-redo-alt"> Reset</i></button>--}}
                                {{-- </div>--}}
                                <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                    <a class="btn btn-primary" href="{{ route('admin-campaign-installation-types-add',['campaign_id'=>$campaign_id]) }}"><i class="fa fa-plus"> Add Types</i></a>
                                </div>
                                {{-- </div>--}}
                                @if(\Illuminate\Support\Facades\Session::has('msg'))
                                <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                    <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                </div>
                                @endif
                                <table id="zero_config" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="zero_config_info">
                                    <thead>
                                        <tr role="row">
                                            {{-- <th class="sorting" tabindex="0">
{{--                                                Type--}}
                                            {{-- </th>--}}
                                            <th class="sorting" tabindex="0">
                                                Type
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Instructions
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Dates
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Status
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Priority
                                            </th>
                                            <!-- <th class="sorting" tabindex="0">
                                                Permits
                                            </th> -->
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

<script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script>
    $start = $('#start_date').val()
    $end = $('#end_date').val()
    $body = $('body');
    $(function() {


        $('#date_reset').on('click', function() {
            $('#start_date').val('').change()
            $('#end_date').val('').change()
        })
        $("#start_date").datepicker({
            format: "dd/mm/yyyy",
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            todayHighlight: true,
        }).on('change', function() {
            $start = $('#start_date').val()
            table.draw();
        });

        $("#end_date").datepicker({
            format: "dd/mm/yyyy",
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            todayHighlight: true,
        }).on('change', function() {
            $end = $('#end_date').val()
            table.draw();
        });


        $body.on('click', '.photos_btn', function(e) {
            e.preventDefault();
            $href = $(this).attr('dt-data-id');
            jc_avail_photo = $.confirm({
                animateFromElement: true,
                title: 'Photos',
                content: 'url:' + $href,
                columnClass: 'large',
                buttons: {
                    Close: function() {
                        return;
                    },
                },
            });
        })



        $body.on('click', '.asset_btn', function(e) {
            e.preventDefault();
            $href = $(this).attr('dt-data-id');
            jc_avail_photo = $.confirm({
                animateFromElement: true,
                title: 'Assets',
                content: 'url:' + $href,
                columnClass: 'large',
                buttons: {
                    Close: function() {
                        return;
                    },
                },
            });
        })

        $body.on('click', '.permits_btn', function(e) {
            e.preventDefault();
            $href = $(this).attr('dt-data-id');
            $href_inner = $(this).attr('dt-add-href');
            jc_avail_permit = $.confirm({
                animateFromElement: true,
                title: 'Permits',
                content: 'url:' + $href,
                columnClass: 'large',
                buttons: {
                    Add: {
                        text: "Add Permit",
                        btnClass: 'btn-blue',
                        action: function() {

                            $.confirm({
                                title: 'Add Permit!',
                                content: 'url:' + $href_inner,
                                buttons: {
                                    formSubmit: {
                                        text: 'Submit',
                                        btnClass: 'btn-blue',
                                        action: function() {
                                            var name = this.$content.find('.name').val();
                                            if (!name) {
                                                $.alert('Give some description');
                                                return false;
                                            } else {
                                                $('.formName').submit()
                                            }
                                        }
                                    },
                                    cancel: function() {
                                        //close
                                    },
                                },
                            });
                            jc_avail_permit.close();
                        },
                    },
                    Close: function() {
                        return;
                    },
                },
            });
        })

        $body.on('click', '.edit-btnss', function(e) {
            console.log('clicked')
            $href_inner = $(this).attr('hrefs')
            e.preventDefault();
            $.confirm({
                title: 'Add Permit!',
                content: 'url:' + $href_inner,
                buttons: {
                    formSubmit: {
                        text: 'Submit',
                        btnClass: 'btn-blue',
                        action: function() {
                            var name = this.$content.find('.name').val();
                            if (!name) {
                                $.alert('Give some description');
                                return false;
                            } else {
                                $('.formName').submit()
                            }
                        }
                    },
                    cancel: function() {
                        //close
                    },
                },
            });
            jc_avail_permit.close();
        })

        $body.on('click', '.location-btn', function(e) {
            e.preventDefault();
            $data = $(this).attr('data-list-loc')
            $.confirm({
                title: 'Locations',
                content: $data,
                columnClass: 'small',
                buttons: {
                    cancel: function() {
                        //close
                    },
                },
            });
        })

        var table = $('#zero_config').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ url()->current() }}",
                data: function(d) {
                    d.start_date = $start;
                    d.end_date = $end;
                }
            },
            // "drawCallback":function(settings){
            //     // $('[data-toggle="tooltip"]').tooltip()
            //     // $('[data-toggle="tooltip"]').tooltip()
            // },
            columns: [
                // {data: 'type', name: 'status'},
                {
                    data: 'type',
                    name: 'type'
                },
                {
                    data: 'instructions',
                    name: 'instructions'
                },
                {
                    data: 'start_date',
                    name: 'start_date'
                },
                {
                    data: 'status',
                    name: 'status'
                },
                {
                    data: 'priority',
                    name: 'priority',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
                // {data: 'campaign_type', name: 'campaign_type'},
                // {data: 'client.name', name: 'client_name'},
                // {data: 'market', name: 'market'},
                // {data: 'start_date', name: 'start_date'},
                // {data: 'booking_order', name: 'booking_order'},
                // {data: 'payment_status', name: 'payment_status'},
                // {data: 'photos', name: 'photos', orderable: false, searchable: false},
            ]
        });


        $body.on('click', '.assign-button', function() {
            $href = $(this).attr('data-href')
            $.confirm({
                title: 'Assign Campaign',
                content: 'url:' + $href,
                columnClass: 'medium',
                buttons: {
                    formSubmit: {
                        text: 'Submit',
                        btnClass: 'btn-blue',
                        action: function() {
                            var name = this.$content.find('#user').val();
                            if (!name) {
                                $.alert('Select a User first');
                                return false;
                            } else {
                                $('#from-assign').submit()
                            }
                        }
                    },
                    cancel: function() {
                        //close
                    },
                },
            });
        });


        $body.on('click', '.status-button', function() {
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
                    '<option value="Not Started">Not Started</option>' +
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
                        action: function() {
                            var name = this.$content.find('.name').val();
                            if (!name) {
                                $.alert('Select a status first');
                                return false;
                            } else {
                                $('.formName').submit()
                            }
                        }
                    },
                    cancel: function() {
                        //close
                    },
                },
            });
        })
    });

    $body.on('click','.instruction_view', function() {
        var instruction = $(this).attr('dt-data-id');
        $.confirm({
            title: 'Instructions',
            content: instruction,
            buttons: {
               
                cancel: function() {
                    // $.alert('Canceled!');
                },
                
            }
        });
    })
</script>
@endpush
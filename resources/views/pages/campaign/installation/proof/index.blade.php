@extends('layouts.admin')
@section('content')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">{{strtoupper($campaign_name)}}</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-campaign-installation-index') }}">Production</a></li>
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
                                
                                <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                    <a class="btn btn-primary" href="{{ route('admin-campaign-installation-proofpictures-add',['campaign_id'=>$campaign_id]) }}"><i class="fa fa-plus"> Add Proof Pictures</i></a>
                                </div>
                                @if(\Illuminate\Support\Facades\Session::has('msg'))
                                <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                    <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                </div>
                                @endif
                                <table id="zero_config" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="zero_config_info">
                                    <thead>
                                        <tr role="row">                                 
                                            <th class="sorting" tabindex="0">
                                                Added On
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Location
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Photos
                                            </th>    
                                            <th class="sorting" tabindex="0">
                                                Status
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Comment
                                            </th>
                                            @canany(['Level1', 'Level2'])
                                            <th class="sorting" tabindex="0">
                                                Action
                                            </th>
                                            @endcanany

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
@canany(['Level1', 'Level2','Level4','Level4'])
<script>
     var table = $('#zero_config').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ url()->current() }}",
                data: function(d) {
                    
                }
            },
            // "drawCallback":function(settings){
            //     // $('[data-toggle="tooltip"]').tooltip()
            //     // $('[data-toggle="tooltip"]').tooltip()
            // },
            columns: [
                // {data: 'type', name: 'status'},
                {
                    data: 'added_on',
                    name: 'added_on'
                },
                {
                    data: 'location',
                    name: 'location'
                },
                {
                    data: 'photos',
                    name: 'photos',
                    orderable: false
                },
                {
                    data: 'status',
                    name: 'status',
                    orderable: false
                },
                {
                    data: 'comment',
                    name: 'comment'
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
</script>

@endcanany
@canany(['Level7'])
<script>
     var table = $('#zero_config').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ url()->current() }}",
                data: function(d) {
                   
                }
            },
            // "drawCallback":function(settings){
            //     // $('[data-toggle="tooltip"]').tooltip()
            //     // $('[data-toggle="tooltip"]').tooltip()
            // },
            columns: [
                // {data: 'type', name: 'status'},
                {
                    data: 'added_on',
                    name: 'added_on'
                },
                {
                    data: 'photos',
                    name: 'photos',
                    orderable: false
                },
                {
                    data: 'status',
                    name: 'status',
                    orderable: false
                },
                {
                    data: 'comment',
                    name: 'comment'
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
</script>

@endcanany
<script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script>
    $start = $('#start_date').val()
    $end = $('#end_date').val()
    $body = $('body');
    $(function() {

        $body.on('click', '.approval', function(e) {
            $href_inner = $(this).attr('href')
            e.preventDefault();
            $.confirm({
                title: 'Approve / Reject!',
                content: 'url:' + $href_inner,
                buttons: {
                    formSubmit: {
                        text: 'Submit',
                        btnClass: 'btn-blue',
                        action: function() {
                            var status = this.$content.find('#status').val();
                            var comment = this.$content.find('#comment').val();
                            if (status == 0 && !comment) {
                                $.alert('Give some comment');
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
                            var name = this.$content.find('#users').val();
                            if (name == '') {
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
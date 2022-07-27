@extends('layouts.admin')
@section('content')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
<link href="{{ asset('assets/css/overview.css') }}" rel="stylesheet" />
<link href="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.css')}}" rel="stylesheet" />
<link href="{{ asset('assets/extra-libs/calendar/calendar.css')}}" rel="stylesheet" />


<style> 
    .btn_margin{
        margin: 1%;
    }
    #zero_config{font-size:11px;}
    .table th {    padding: 0.4rem; }
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
    <div class="tab">
        <button class="tablinks campaign_listing" data-id="campaign_listing">Campaign Listing</button>
        <button class="tablinks" data-id="campaign_calander">Calendar</button>
    </div>
    <div class="container-fluid">
        <div id="campaign_listing" class="tabcontent">
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
                                                <input type="text" class="form-control datepicker-autoclose" id="start_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text h-100"><i class="mdi mdi-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="mt-3">End Date</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control  datepicker-autoclose" id="end_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                <div class="input-group-append">
                                                    <span class="input-group-text h-100"><i class="mdi mdi-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="btn-group"></div>
                                            <button class="btn btn-primary" style="margin-top: 45px" id="date_reset"><i class="fas fa-redo-alt"> Reset</i></button>
                                        </div>
                                        <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                            <a class="btn btn-primary" href="{{ route('admin-campaign-add') }}"><i class="fa fa-plus"> Add Campaign</i></a>
                                        </div>
                                    </div>
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                    <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                        <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                    </div>
                                    @endif
                                    <table id="zero_config" class="table table-striped table-bordered dataTable text-center" role="grid" aria-describedby="zero_config_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting" tabindex="0">
                                                    Name
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Type
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Client
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Market
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Campaign Type
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Dates
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Booking Order
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Payment Status
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Permits
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Locations
                                                </th>
                                                <th class="sorting" tabindex="0">
                                                    Photos
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
        <div id="campaign_calander" class="tabcontent calan">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="form-group row">
                        <label for="staticEmail" class="col-sm-12 col-form-label">Select Year</label>
                        <select class="form-select" aria-label="Default select example" id="dateyear">
                            <option selected>Select Year</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                            <option value="2031">2031</option>
                            <option value="2032">2032</option>
                            <option value="2033">2033</option>
                            <option value="2034">2034</option>
                            <option value="2035">2035</option>
                            <option value="2036">2036</option>
                            <option value="2037">2037</option>
                            <option value="2038">2038</option>
                            <option value="2039">2039</option>
                            <option value="2040">2040</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div><br />
            <div class="card">
                <div class="card-body" id="monthsArray">

                </div>
            </div>
        </div>
    </div>

</div>
@endsection

@push('custom-scripts')

<script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<!-- <script src="{{ asset('assets/libs/jquery/dist/jquery.min.js')}}"></script> -->
<!-- <script src="{{ asset('dist/js/jquery.ui.touch-punch-improved.js')}}"></script> -->
<!-- <script src="{{ asset('dist/js/jquery-ui.min.js')}}"></script> -->
<!-- Bootstrap tether Core JavaScript -->
<script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{ asset('assets/libs/moment/min/moment.min.js')}}"></script>
<script src="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.js')}}"></script>
<script src="{{ asset('dist/js/pages/calendar/cal-init.js')}}"></script>
<script
    src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script src="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.js') }}"></script>



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
            
            columns: [{
                    data: 'name',
                    name: 'name',"bSort": true
                },
                {
                    data: 'campaign_type',
                    name: 'campaign_type'
                },
                {
                    data: 'client.name',
                    name: 'client_name'
                },
                {
                    data: 'market',
                    name: 'market'
                },
                {
                    data: 'type',
                    name: 'type'
                },
                {
                    data: 'start_date',
                    name: 'start_date'
                },
                {
                    data: 'booking_order',
                    name: 'booking_order'
                },
                {
                    data: 'payment_status',
                    name: 'payment_status'
                },
                {
                    data: 'permits',
                    name: 'permits',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'locations',
                    name: 'locations',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'photos',
                    name: 'photos',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'status',
                    name: 'status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false,
                    
                },
                
            ]
        });


        $('thead > tr> th:nth-child(13)').css({ 'min-width': '200px', 'max-width': '200px' });

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
</script>
<script>
    $body.on('click', '.tablinks', function(evt) {
        var divId = $(this).attr('data-id');
        //    alert(divId)
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace("active", "");
        }
        document.getElementById(divId).style.display = "block";
        evt.currentTarget.className += " active";
    });
    $(document).ready(function() {
        $('#campaign_listing').click();
        $('.campaign_listing').addClass('active');
    });

    $('#dateyear').on('change', function() {
        var value = $(this).val();
        var route = "{{route('months')}}"
        $main = $('#monthsArray');
        $.ajax({
            type: "GET",
            url: route,
            data: {data:value},
            beforeSend: function() {
                $main.LoadingOverlay('show');
            },
            success: function(response) {
                console.log(response);
                if(response){
                    $main.html(response);
                }else{
                    $main.html('');
                }
            },complete:function(){
                $main.LoadingOverlay('hide');
            }
        });
    })
</script>
@endpush

@extends('layouts.admin')
@section('content')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
<link href="{{ asset('assets/css/overview.css') }}" rel="stylesheet" />
<link
      href="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.css')}}"
      rel="stylesheet"
    />
    <link href="{{ asset('assets/extra-libs/calendar/calendar.css')}}" rel="stylesheet" />
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
                                    <table id="zero_config" class="table table-striped table-bordered dataTable" role="grid" aria-describedby="zero_config_info">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting" tabindex="0" width="10%">
                                                    Name
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Type
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Client
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Market
                                                </th>
                                                <th class="sorting" tabindex="0" width="10%">
                                                    Dates
                                                </th>
                                                <th class="sorting" tabindex="0" width="10%">
                                                    Booking Order
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Payment Status
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Permits
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Locations
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Photos
                                                </th>
                                                <th class="sorting" tabindex="0" width="5%">
                                                    Status
                                                </th>
                                                <th class="sorting" tabindex="0" width="30%">
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
            <div class="card">
                <div class="card-body">
                    <!-- <h4 class="page-title">Calendar</h4> -->
                    <!-- ----------------------------------------------------------------------- -->


                    <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <h4 class="page-title">Calendar</h4>
              <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Library
                    </li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <!-- ============================================================== -->
          <!-- Start Page Content -->
          <!-- ============================================================== -->
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="">
                  <div class="row">
                    
                    <div class="col-lg-12">
                      <div class="card-body b-l calender-sidebar">
                        <div id="calendar"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- BEGIN MODAL -->
          <div class="modal none-border" id="my-event">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title"><strong>Add Event</strong></h4>
                  <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-hidden="true"
                  >
                    &times;
                  </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary waves-effect"
                    data-dismiss="modal"
                  >
                    Close
                  </button>
                  <button
                    type="button"
                    class="btn btn-success save-event waves-effect waves-light"
                  >
                    Create event
                  </button>
                  <button
                    type="button"
                    class="btn btn-danger delete-event waves-effect waves-light"
                    data-dismiss="modal"
                  >
                    Delete
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- Modal Add Category -->
          <div class="modal fade none-border" id="add-new-event">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title"><strong>Add</strong> a category</h4>
                  <button
                    type="button"
                    class="close"
                    data-dismiss="modal"
                    aria-hidden="true"
                  >
                    &times;
                  </button>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="row">
                      <div class="col-md-6">
                        <label class="control-label">Category Name</label>
                        <input
                          class="form-control form-white"
                          placeholder="Enter name"
                          type="text"
                          name="category-name"
                        />
                      </div>
                      <div class="col-md-6">
                        <label class="control-label"
                          >Choose Category Color</label
                        >
                        <select
                          class="form-select shadow-none form-white"
                          data-placeholder="Choose a color..."
                          name="category-color"
                        >
                          <option value="success">Success</option>
                          <option value="danger">Danger</option>
                          <option value="info">Info</option>
                          <option value="primary">Primary</option>
                          <option value="warning">Warning</option>
                          <option value="inverse">Inverse</option>
                        </select>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="
                      btn btn-danger
                      waves-effect waves-light
                      save-category
                    "
                    data-dismiss="modal"
                  >
                    Save
                  </button>
                  <button
                    type="button"
                    class="btn btn-secondary waves-effect"
                    data-dismiss="modal"
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- END MODAL -->
          <!-- ============================================================== -->
          <!-- End PAge Content -->
          <!-- ============================================================== -->
        </div>
               

        











                    <!-- ------------------------------------------------------------------------------- -->
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
    <script src="{{ asset('dist/js/jquery-ui.min.js')}}"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="{{ asset('assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js')}}"></script>
    <script src="{{ asset('assets/extra-libs/sparkline/sparkline.js')}}"></script>
    <!--Wave Effects -->
    <script src="{{ asset('dist/js/waves.js')}}"></script>
    <!--Menu sidebar -->
    <script src="{{ asset('dist/js/sidebarmenu.js')}}"></script>
    <!--Custom JavaScript -->
    <script src="{{ asset('dist/js/custom.min.js')}}"></script>
    <!-- this page js -->
    <script src="{{ asset('assets/libs/moment/min/moment.min.js')}}"></script>
    <script src="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.js')}}"></script>
    <script src="{{ asset('dist/js/pages/calendar/cal-init.js')}}"></script>
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
                    name: 'name'
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
                    searchable: false
                },
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
    $(document).ready(function(){ 
    $('#campaign_listing').click();
    $('.campaign_listing').addClass('active');
    });
</script>
@endpush
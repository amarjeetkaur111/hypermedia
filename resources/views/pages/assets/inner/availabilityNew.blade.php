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
    #zero_config, .filters{font-size:11px;}
    .table th {    padding: 0.4rem; }
    #zero_config_wrapper{padding-left:0;}
   .select2-dropdown{width:180px !important;}
</style>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Availability Check</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Availability Helper
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="padding: 0px 20px;">
        <div id="campaign_listing" class="tabcontent">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12"> 
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                    <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                        <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                    </div>
                                    @endif
                                    <div style="padding:0px 15px;border:0.5px solid lightgray;border-radius:20px;margin-bottom: 10px;">
                                        <div class="row filters mb-4">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Department</label>
                                                        <div class="input-group">
                                                            <select type="text" name="department_id" id="department_id" class="form-control">
                                                                <option value="0" selected="selected">Select Department</option>
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
                                                        <label class="mt-3">Type</label>
                                                        <div class="input-group">
                                                            <select type="text" name="type" id="type" class="form-control">
                                                                <option value="0">Select Type</option>
                                                                <option value="digital">Digital</option>
                                                                <option value="static">Static</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Assets</label>
                                                        <div class="input-group">
                                                            <select type="text" name="name" id="name" class="form-control">
                                                                <option value="0" selected="selected">Select Assets</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Specific Asset</label>
                                                        <div class="input-group">
                                                            <select type="text" name="ref_no" id="ref_no" class="form-control">
                                                                <option value="0" selected="selected">Select Asset Name</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Start Date</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control datepicker-autoclose" id="start_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">End Date</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control  datepicker-autoclose" id="end_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <div class="btn-group"></div>
                                                        <button class="btn btn-primary" style="margin-top: 10px;margin-bottom: 5px;" id="date_reset"><i class="fas fa-redo-alt"> Reset</i></button>
                                                        <button class="btn btn-primary" id="search"><i class="fas fa-search"> Search</i></button>
                                                    </div>     
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="table-class" style="display: flex; justify-content: center; align-items: center; margin-top: 20px">
                                        
                                    </div>
                                </div>
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
<script src="{{ asset('assets/libs/moment/min/moment.min.js')}}"></script>
<script src="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.js')}}"></script>
<script src="{{ asset('dist/js/pages/calendar/cal-init.js')}}"></script>
<script
    src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script src="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.js') }}"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<script>
    $start = $('#start_date').val()
    $end = $('#end_date').val()
    $body = $('body');

    $(function() {
        $('#date_reset').on('click', function() {
            $('#start_date').val('').change()
            $('#end_date').val('').change()
            $('#department_id').val('0').change()
            $('#location').val('0').change()
            $('#ref_no').val('0').change()
            $('#name').val('0').change()
            $('.table-class').html('')
        })

        $('#department_id').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-departments') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        type: 'public'
                    }
                    return query;
                },
                processResults: function (data) {
                    // Transforms the top-level key of the response object from 'items' to 'results'
                    return {
                        results: $.map(data, function (item) {
                            return {
                                text: item.name,
                                id: item.id
                            }
                        })
                    }
                }
            }
        });

        $('#location').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-locations') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        department:$('#department_id').val(),
                        type: 'public'
                    }
                    return query;
                },
                processResults: function (data) {
                    // Transforms the top-level key of the response object from 'items' to 'results'
                    return {
                        results: $.map(data, function (item) {
                            return {
                                text: item.name,
                                id: item.id
                            }
                        })
                    }
                }
            }
        });

        $('#ref_no').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-asset-nameref') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        department:$('#department_id').val(),
                        location:$('#location').val(),
                        assettype:$('#type').val(),
                        name:$('#name').val(),
                        type: 'public'
                    }
                    return query;
                },
                processResults: function (data) {
                    // Transforms the top-level key of the response object from 'items' to 'results'
                    console.log(data);
                    return {
                        results: $.map(data, function (item) {
                            return {
                                text: item.name+' : '+item.ref_no,
                                id: item.id
                            }
                        })
                    }
                }
            }
        });

        $('#name').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-asset-name') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        department:$('#department_id').val(),
                        location:$('#location').val(),
                        assettype:$('#type').val(),
                        type: 'public'
                    }
                    return query;
                },
                processResults: function (data) {
                    // Transforms the top-level key of the response object from 'items' to 'results'
                    console.log(data);
                    return {
                        results: $.map(data, function (item) {
                            return {
                                text: item.name,
                                id: item.name
                            }
                        })
                    }
                }
            }
        });

        $("#start_date").datepicker({
            format: "dd/mm/yyyy",
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            todayHighlight: true,
        }).on('change', function() {
            $start = $('#start_date').val()
            // table.draw();
        });

        $("#end_date").datepicker({
            format: "dd/mm/yyyy",
            changeMonth: true,
            changeYear: true,
            autoclose: true,
            todayHighlight: true,
        }).on('change', function() {
            $end = $('#end_date').val()
            // table.draw();
        });

        $body.on('click', '#search', function(e) {
            e.preventDefault();
            let department = $('#department_id').val();
            let location = $('#location').val();
            let startdate = $('#start_date').val();
            let enddate =  $('#end_date').val();
            let name =  $('#name').val();
            let ref_no =  $('#ref_no').val();
            var CSRF_TOKEN = '{{ csrf_token() }}';

            if(department== 0 || startdate == '' || enddate == '')
            {
                // alert('Select Department & Date Range');
                $.dialog({
                    title: 'Warning!',
                    content: 'Select Department & Date Range!',
                });
            }
            else{
                $.ajax({
                    url: '{{ route('admin-assets-availability-helper-postnew') }}',                    
                    type: 'POST',
                    data: {_token: CSRF_TOKEN, 
                            startdate: startdate,
                            enddate: enddate,
                            department:department,
                            location:location,
                            name:name,
                            ref_no:ref_no,
                            assettype:$('#type').val(),
                        },
                    dataType: 'text',
                    success:function(response){
                        $('.table-class').html()
                        $('.table-class').html(response)
                    },error:function(xhr){
                        console.log(xhr)
                    }
                })
            }
        })
    })

</script>
@endpush

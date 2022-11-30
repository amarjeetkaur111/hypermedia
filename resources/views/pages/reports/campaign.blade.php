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


   fieldset {
        border-width: 1px;
        border-radius: 10px;
        border:1px solid grey;
        margin-top:1rem;
        padding:10px;
    }
    legend{
        font-weight:900;
        font-size:13px;
    }
</style>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Campaign Reports</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Campaign Reports
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
                                    @if($errors->any())
                                        @foreach ($errors->all() as $error)
                                            <div class="alert alert-warning">
                                                <strong>{{ $error }}</strong>
                                            </div>
                                        @endforeach
                                    @endif 
                                <form method="post" action="{{route('admin-reports-getCampaign')}}">
                                    @csrf
                                    <div style="padding:0px 15px;border:0.5px solid lightgray;border-radius:20px;margin-bottom: 10px;">
                                        <div class="row filters mb-4">
                                            <div class="col-md-6">
                                            <fieldset>
                                                <legend>Search Campaign Details:</legend>
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-12">
                                                        <label class="mt-3">Campaign</label>
                                                        <div class="input-group">
                                                            <select name="campaign" name="campaign" id="campaign" class="form-control">
                                                                <option value="" selected="selected">Select Campaign</option>
                                                            </select>
                                                        </div>
                                                    </div>   
                                                    <div class="col-md-4 col-sm-12">
                                                        <label class="mt-3">Location</label>
                                                        <div class="input-group">
                                                            <select type="text" name="location" id="location" class="form-control">
                                                                <option value="" selected="selected">Select Location</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12 mt-5">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" value="1" id="pp" name="pp">
                                                            <label class="custom-control-label" for="pp">With Proof Pictures</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row text-right mt-3">                                                   
                                                    <div class="col-md-12 col-sm-12">
                                                        <button  type="submit" value="1" name="one" class="btn btn-primary" id="search"><i class="fas fa-download"> Download Report</i></button>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <legend>Search Campaigns:</legend>
                                                    <div class="row">
                                                        <div class="col-md-4 col-sm-12">
                                                            <label class="mt-3">Start Date</label>
                                                            <div class="input-group">
                                                                <input type="text" class="form-control datepicker-autoclose" name="startdate" id="start_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12">
                                                            <label class="mt-3">End Date</label>
                                                            <div class="input-group">
                                                                <input type="text" class="form-control  datepicker-autoclose" name="enddate" id="end_date" placeholder="dd/mm/yyyy" autocomplete="off" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12">
                                                            <button class="btn btn-primary" style="margin-top: 40px" id="date_reset"><i class="fas fa-redo-alt"> Reset</i></button>
                                                        </div>     
                                                    </div>
                                                    <div class="row text-right mt-3">                                                   
                                                        <div class="col-md-12 col-sm-12">
                                                            <button type="submit" value="1" name="all" class="btn btn-primary" id="search"><i class="fas fa-download"> Download Report</i></button>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>                                            
                                        </div>
                                    </div>
                                </form>
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
        $('#date_reset').on('click', function(e) {
            e.preventDefault();
            $('#start_date').val('').change()
            $('#end_date').val('').change()
            $('#campaign').val('0').change()
            $('#location').val('0').change()
            // $('#ref_no').val('0').change()
            // $('#name').val('0').change()
            // $('.table-class').html('')
        })

        

        $('#campaign').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-campaigns') }}',
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
                url: '{{ route('select-2-get-campaign_locations') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        campaign:$('#campaign').val(),
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

        // $body.on('click', '#search', function(e) {
        //     e.preventDefault();
        //     let department = $('#department_id').val();
        //     let location = $('#location').val();
        //     let startdate = $('#start_date').val();
        //     let enddate =  $('#end_date').val();
        //     let name =  $('#name').val();
        //     let ref_no =  $('#ref_no').val();
        //     var CSRF_TOKEN = '{{ csrf_token() }}';

        //     if(department== 0 || startdate == '' || enddate == '')
        //     {
        //         // alert('Select Department & Date Range');
        //         $.dialog({
        //             title: 'Warning!',
        //             content: 'Select Department & Date Range!',
        //         });
        //     }
        //     else{
                
        //     }
        // })
    })

</script>
@endpush

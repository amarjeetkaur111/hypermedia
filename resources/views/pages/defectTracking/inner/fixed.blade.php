<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
<link href="{{ asset('assets/css/overview.css') }}" rel="stylesheet" />
<link href="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.css')}}" rel="stylesheet" />
<link href="{{ asset('assets/extra-libs/calendar/calendar.css')}}" rel="stylesheet" />
<form id="defect-fixed" method="post" action="{{ $action }}">
    @csrf
        <h4>{{$defect->asset->ref_no}}-{{$defect->asset->name}} Working From?</h4>
        <label class="mt-3">Select Date</label>
        <div class="input-group">
            <input type="text" class="form-control datepicker-autoclose" name="date" id="start_date" placeholder="dd/mm/yyyy" autocomplete="off" required/>
        </div>
</form>
<script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<!-- <script src="{{ asset('assets/libs/jquery/dist/jquery.min.js')}}"></script> -->
<!-- <script src="{{ asset('dist/js/jquery.ui.touch-punch-improved.js')}}"></script> -->
<!-- <script src="{{ asset('dist/js/jquery-ui.min.js')}}"></script> -->
<!-- Bootstrap tether Core JavaScript -->
<!-- <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script> -->
<script src="{{ asset('assets/libs/moment/min/moment.min.js')}}"></script>
<script src="{{ asset('assets/libs/fullcalendar/dist/fullcalendar.min.js')}}"></script>
<script src="{{ asset('dist/js/pages/calendar/cal-init.js')}}"></script>

<script>
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
</script>


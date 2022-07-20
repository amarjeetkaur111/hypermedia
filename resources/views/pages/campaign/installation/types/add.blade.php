@extends('layouts.admin')
@section('content')
<link rel="stylesheet" href="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.css') }}">
@php
$count = 0;

if(old('type')){
$type = old('type');
$instructions = old('instructions');
$priority = old('priority');
$start_date = old('start_date');
$end_date = old('end_date');
$campaign_type = old('campaign_type');
$status = old('status');
}
else if(isset($data) && $data){
$type = $data->type;
$instructions = $data->instructions;
$priority = $data->priority;
$start_date = $data->start_date ? \Carbon\Carbon::parse($data->start_date)->format('d/m/Y') : null;
$end_date = $data->end_date ? \Carbon\Carbon::parse($data->end_date)->format('d/m/Y') : null;
$campaign_type = $data->campaign_type;
$status = $data->status;
}
else{
$type = null;
$instructions = null;
$priority = null;
$start_date = null;
$end_date = null;
$campaign_type = null;
$status = null;
}
@endphp
<style>
    .form-control {
        border: 1px solid #aaa;
    }
</style>
<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Installations</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Installations
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <form class="form-horizontal" method="post" action="{{ $action }}" enctype="multipart/form-data">
            <div class="card">
                @csrf
                <div class="card-body">
                    <h4 class="card-title">{{ $add }}</h4>
                    <div class="row">
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Type</label>
                            <div class="col-sm-9">
                                <select name="type" class="form-control" id="type" required>
                                    <option>Select Type</option>
                                    <option value="installation">Installation</option>
                                    <option value="dismantle">Dismantle</option>
                                    <option value="sizes">Sizes</option>
                                    <option value="maintenance">Maintenance</option>
                                </select>
                                @if ($errors->has('type'))
                                <span class="text-danger">{{ $errors->first('type') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Instructions</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="instructions" value="{{$instructions}}" placeholder="Instructions Here" required>
                                @if ($errors->has('instructions'))
                                <span class="text-danger">{{ $errors->first('instructions') }}</span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Starting
                                at</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control date_mask" name="start_date" value="{{ $start_date }}" placeholder="Start Date here" required>
                                @if ($errors->has('start_date'))
                                <span class="text-danger">{{ $errors->first('start_date') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Ending
                                At</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control date_mask" name="end_date" value="{{ $end_date }}" placeholder="End Date here" required>
                                @if ($errors->has('end_date'))
                                <span class="text-danger">{{ $errors->first('end_date') }}</span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group row col-md-6">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Priority</label>
                            <div class="col-sm-9">
                                <select name="priority" class="form-control" id="priority" required>
                                    <option>Select Priority</option>
                                    <option value="high">High</option>
                                    <option value="medium">Medium</option>
                                    <option value="low">Low</option>
                                </select>
                                @if ($errors->has('type'))
                                <span class="text-danger">{{ $errors->first('type') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row col-md-6">
                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Status</label>
                            <div class="col-sm-9">
                                <select type="text" name="status" id="status" class="form-control">
                                    <option value="Not Started">Not Started</option>
                                    <option value="Active">Active</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                                @if ($errors->has('status'))
                                <span class="text-danger">{{ $errors->first('status') }}</span>
                                @endif
                            </div>
                        </div>

                    </div>

                    <input type="hidden" value="{{$c_id}}" name="campaign_id">





                </div>
            </div>

            <div class="border-top">
                <div class="card-body">
                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection

@push('custom-scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js" integrity="sha512-d4KkQohk+HswGs6A1d6Gak6Bb9rMWtxjOa0IiY49Q3TeFd5xAzjWXDCBW9RS7m86FQ4RzM2BdHmdJnnKRYknxw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script src="{{ asset('jquery-typeahead/dist/jquery.typeahead.min.js') }}"></script>
<script>
   $count = {{ $count ?? 1 }};
    
    if ($count < 1) {
        $count = 1;
    }
    $(function() {


        $('.js-typeahead').typeahead({
            // input: '.js-typeahead',
            order: "desc",
            source: {
                data: [
                    "Not Applicable", "In Progress"
                ]
            },
            callback: {
                onInit: function() {
                    console.log('Initializing js type ahead')
                }
            }
        });

        $('#add_btn').on('click', function(e) {
            e.preventDefault()
            addRow();
        });

        $('body').on('click', '.remove-row', function(e) {
            e.preventDefault()
            $(this).closest('.row-data').remove()
        })

        $('#status').select2({
            width: '100%'
        });
        $('#market').select2({
            width: '100%'
        });

        $('#campaign_type').select2({
            width: '100%'
        });
        $('#payment_status').select2({
            width: '100%'
        });
        $('#booking_order').select2({
            width: '100%'
        });

        function addRow() {
            $html = '<div class="row row-data" style="margin-right: 0;">' +
                '        <div class="form-group row col-md-3">' +
                '            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Asset</label>' +
                '            <div class="col-sm-9">' +
                '                 <select class="form-control assets" name="bucket_asset[' + $count + ']" required> {!! getAssetAndNetwork() !!}</select>' +
                '            </div>' +
                '         </div>' +
                '             <div class="form-group row col-md-3">' +
                '             <label for="fname"' +
                '            class="col-sm-4 text-end control-label col-form-label">Location</label>' +
                '        <div class="col-sm-8">' +
                '             <select class="form-control locations" name="bucket_location[' + $count + ']" required>' +
                '                <option disabled selected>Select Location</option>' +
                '            </select>' +
                '         </div>' +
                '    </div>' +
                '         <div class="form-group row col-md-3">' +
                '             <label for="fname" class="col-sm-3 text-end control-label col-form-label">Start Date</label>' +
                '            <div class="col-sm-7">' +
                '                 <input type="text" class="form-control date_mask" name="bucket_start_date[' + $count + ']" placeholder="Start Date" required>' +
                '            </div>' +
                '         </div>' +
                '         <div class="form-group row col-md-3">' +
                '             <label for="fname" class="col-sm-3 text-end control-label col-form-label">End Date</label>' +
                '            <div class="col-sm-7">' +
                '                 <input type="text" class="form-control date_mask" name="bucket_end_date[' + $count++ + ']" placeholder="End Date" required>' +
                '            </div>' +
                '            <div class="col-sm-2">' +
                '                <button class="btn-danger remove-row"><i class="fa fa-minus"></i></button>' +
                '            </div>' +
                '         </div>' +
                '         <div class="details_div" style="display: flex; flex-flow: row;">' +
                '             <div class="form-group row col-md-3">' +
                '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Asset Type</label>' +
                '                <div class="col-sm-7">' +
                '                    <div class="alert alert-secondary asset_type" role="alert">' +
                '                        ---' +
                '                    </div>' +
                '                 </div>' +
                '            </div>' +
                '            <div class="form-group row col-md-3">' +
                '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Quantity</label>' +
                '                <div class="col-sm-7">' +
                '                    <div class="alert alert-secondary quantity" role="alert">' +
                '                        ---' +
                '                    </div>' +
                '                </div>' +
                '             </div>' +
                '             <div class="form-group row col-md-3">' +
                '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Availability</label>' +
                '                <div class="col-sm-7">' +
                '                    <div class="alert alert-secondary availability" role="alert"> --- </div>' +
                '                 </div>' +
                '            </div>' +
                '            <div class="form-group row col-md-3">' +
                '                 <label for="fname" class="col-sm-4 text-end control-label col-form-label">Installation Time</label>' +
                '                <div class="col-sm-7">' +
                '                    <div class="alert alert-secondary inst_time" role="alert"> --- </div>' +
                '                </div>' +
                '            </div>' +
                '        </div>' +
                '    </div>';
            $('.buckets_div').append($html);
            initializeSelect()
        }


        function initializeSelect() {
            $(".time_mask").mask("Hh:Ii");
            $(".date_mask").mask("Dd/Mm/Yqwe");
            $(".locations:visible").each(function(ii, ele) {
                if ($(ele).hasClass("select2-hidden-accessible")) {
                    $(ele).select2('destroy');
                }

            });

            $(".assets:visible").each(function(ii, ele) {
                if ($(ele).hasClass("select2-hidden-accessible")) {
                    $(ele).select2('destroy');
                }

            });
        }






        $.mask.definitions['D'] = "[0-3]";
        $.mask.definitions['d'] = "[0-9]";
        $.mask.definitions['M'] = "[0-1]";
        $.mask.definitions['m'] = "[0-9]";
        $.mask.definitions['Y'] = "[2]";
        $.mask.definitions['q'] = "[0]";
        $.mask.definitions['w'] = "[1-2]";
        $.mask.definitions['e'] = "[0-9]";
        $.mask.definitions['H'] = "[0-2]";
        $.mask.definitions['h'] = "[0-9]";
        $.mask.definitions['I'] = "[0-5]";
        $.mask.definitions['i'] = "[0-9]";
        $.mask.definitions['S'] = "[0-5]";
        $.mask.definitions['s'] = "[0-9]";

        // $(".time_mask").mask("Hh:Ii");
        // $(".date_mask").mask("Dd/Mm/Yqwe");


        console.log('Ready...')
        initializeSelect()



    });
    @if($status)
    $('#status').val('{!!$status!!}').trigger('change');
    @endif
    @if($priority)
    $('#priority').val('{!!$priority!!}').trigger('change');
    @endif
    @if($type)
    $('#type').val('{!!$type!!}').trigger('change');
    @endif
</script>
@endpush
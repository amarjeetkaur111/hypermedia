@extends('layouts.admin')
@section('content')
<style>
    .input-group > .form-control {font-size:12px;}
</style>
    <link href="{{ asset('assets/expand.css') }}" rel="stylesheet"/>
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Assets</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Assets
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
                    <div class="">
                        <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div style="display: flex; justify-content: flex-end; padding-bottom: 10px">
                                        <a class="btn btn-primary" href="{{ route('admin-assets-add') }}"><i
                                                class="fa fa-plus"> Add Asset</i></a>
                                    </div>
                                    @if(\Illuminate\Support\Facades\Session::has('msg'))
                                        <div
                                            class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                                            <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                                        </div>
                                    @endif
                                    <div style="padding:0px 15px;border:0.5px solid lightgray;border-radius:20px;margin-bottom: 10px; font-size:12px;">
                                        <div class="row filters mb-4">
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-2 col-sm-12">
                                                        <label class="mt-3">Package</label>
                                                        <div class="input-group">
                                                            <select type="text" name="packagetype" id="packagetype" class="form-control">
                                                                <option value="0" selected="selected">Select Package Type</option>
                                                                <option value="package">Package</option>
                                                                <option value="individual">Individual</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 col-sm-12">
                                                        <label class="mt-3">Type</label>
                                                        <div class="input-group">
                                                            <select type="text" name="assettype" id="assettype" class="form-control">
                                                                <option value="0">Select Type</option>
                                                                <option value="digital">Digital</option>
                                                                <option value="static">Static</option>
                                                                <option value="Promospace">Promospace</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5 col-sm-12">
                                                        <label class="mt-3">Location</label>
                                                        <div class="input-group">
                                                            <select type="text" name="locations_id" id="locations_id" class="form-control">
                                                                <option value="0" selected="selected">Select Location</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Owned by</label>
                                                        <div class="input-group">
                                                            <select type="text" name="owned_by" id="owned_by" class="form-control"> 
                                                                <option selected disabled  value="">Select Owner</option>
                                                                <option value="Hypermedia">Hypermedia</option>
                                                                <option value="Mall Owned">Mall Owned</option>
                                                                <option value="MAF Owned">MAF Owned</option>
                                                                <option value="Metro Owned">Metro Owned</option>
                                                                <option value="Lulu Owned">Lulu Owned</option>
                                                                <option value="Carrefour Owned">Carrefour Owned</option>
                                                                <option value="Abu Dhabi Union Co-op">Abu Dhabi Union Co-op</option>
                                                                <option value="Sharjah Union Co-op">Sharjah Union Co-op</option>           
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row">
                                                    <!-- <div class="col-md-3 col-sm-12">
                                                        <label class="mt-3">Installation Time</label>
                                                        <div class="input-group">
                                                            <select type="text" name="installation_time" id="installation_time" class="form-control">
                                                                <option value="0">Select Installation Time</option>
                                                            </select>
                                                        </div>
                                                    </div> -->
                                                    <div class="col-md-4 col-sm-12">
                                                        <label class="mt-3">Status</label>
                                                        <div class="input-group">
                                                            <select type="text" name="installation_time" id="status" class="form-control">
                                                                <option value="0">Select Status</option>
                                                                <option value="Active">Active</option>
                                                                <option value="Inactive">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <label class="mt-3">Slots</label>
                                                        <div class="input-group">
                                                            <input type="number" class="form-control" id="slot" placeholder="" autocomplete="off" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <div class="btn-group"></div>
                                                        <button class="btn btn-primary" style="margin-top: 45px" id="date_reset"><i class="fas fa-redo-alt"> Reset</i></button>
                                                    </div>     
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <table id="zero_config" class="table table-striped table-bordered dataTable table-sm"
                                           role="grid" aria-describedby="zero_config_info" style="font-size: 12px;width: 100%; border-spacing: 0px; border-collapse: separate;">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0">
                                                No
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Package Type
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                OwnedBy
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Type
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Name
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Location
                                            </th>  
                                            <th class="sorting" tabindex="0">
                                                Ref No
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Installation Time
                                            </th>
                                            <th class="sorting" tabindex="0">
                                                Slots
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
    </div>
@endsection

@push('custom-scripts')
    <script src="{{asset('assets/expand.js')}}"></script>
    <script>

        $(function () {
            $('#date_reset').on('click', function() {
                $('#packagetype').val('0').change()
                $('#assettype').val('0').change()
                $('#locations_id').val('0').change()
                $('#owned_by').val('').change()
                $('#status').val('0').change()
                $('#slot').val('').change()
            })

            var i =1;
            $.fn.dataTableExt.oStdClasses.sWrapper = "";
            var table = $('#zero_config').DataTable({
                processing: true,
                dom: "<'row'<'col-sm-12 col-md-6 font-12'l><'col-sm-12 col-md-6 font-12'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-12 col-md-5 font-12'i><'col-sm-12 col-md-7 font-12'p>>",
                scrollX: true,
                serverSide: true,
                ajax: 
                    {
                    url: "{{ url()->current() }}",
                    data: function(d) {
                        d.packagetype = $('#packagetype').val(),
                        d.assettype = $('#assettype').val(),
                        d.locations_id = $('#locations_id').val(),
                        d.owned_by = $('#owned_by').val(),
                        d.status = $('#status').val(),
                        d.slot = $('#slot').val()
                    }
                },                
                "drawCallback": function (settings) {
                    $('.img_click').magnificPopup({
                        type: 'image',
                        closeOnContentClick: true,
                        mainClass: "mfp-img-mobile",
                        image: {
                            verticalFit: true,
                        }, zoom: {
                            enabled: true,
                            duration: 200,
                        },
                    });
                },
                columns: [
                    // {data: 'id', name: 'id'},
                    // {"render": function() { return i++; }, orderable: true},
                    {data: 'DT_RowIndex', orderable: false, searchable: false},
                    {data: 'package_type', name: 'package_type', orderable: true, searchable: true},
                    {data: 'owned_by', name: 'owned_by', orderable: true, searchable: true},
                    {data: 'type', name: 'type', orderable: true, searchable: true},
                    {data: 'name', name: 'name', orderable: true, searchable: true},
                    {data: 'location', name: 'location', orderable: true, searchable: true},
                    {data: 'ref_no', name: 'ref_no', orderable: true, searchable: true},
                    {data: 'installation_time', name: 'installation_time'},
                    // {data: 'asset_photo', name: 'asset_photo'},
                    {data: 'slots', name: 'slots'},
                    {data: 'status', name: 'status'},
                    {data: 'action', name: 'action', orderable: false, searchable: false},
                ]
            });

            $('#packagetype').change(function(){
                table.draw(true);
            });
            $('#assettype').change(function(){
                table.draw(true);
            });
            $('#locations_id').change(function(){
                table.draw(true);
            });
            $('#owned_by').change(function(){
                table.draw(true);
            });
            $('#status').change(function(){
                table.draw(true);
            });
            $('#slot').change(function(){
                table.draw(true);
            });

            $('#locations_id').select2({
            width: '100%',
            ajax: {
                url: '{{ route('select-2-get-locations') }}',
                data: function (params) {
                    var query = {
                        search: params.term,
                        assettype:$('#assettype').val(),
                        package_type:$('#packagetype').val()
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

        });
        
    </script>
@endpush

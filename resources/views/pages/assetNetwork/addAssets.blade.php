@extends('layouts.admin')
@section('content')
{{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--}}
    @php
        if(old('name')){
            $name = old('name');
            $status = old('status');
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $status = $data->status;
        }
        else{
            $name = null;
            $status = null;
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Assets Network</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Assets Network
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="card">
                @if(\Illuminate\Support\Facades\Session::has('msg'))
                    <div
                        class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                        <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                    </div>
                @endif
                    <div class="card-body">
                        <div class="row">
                            <h4 class="card-title">{{ $add }} Assets</h4>
                            <div style="display: flex; justify-content: flex-end">
                                <button type="button" id="modal-btn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                    Add Asset
                                </button>
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <form class="form-horizontal" method="post" action="{{ $action }}">
                                        @csrf
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Add Asset</h5>
                                                </div>
                                                <div class="modal-body">
                                                    <select type="text" name="assets" class="form-control" required>
                                                        <option selected disabled>Select asset</option>
                                                        @foreach($assets as $asset)
                                                            <option value="{{ $asset->id }}">{{ $asset->ref_no }} - {{ $asset->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Ref No</th>
                                <th scope="col">Name</th>
                                <th scope="col">Remove</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($network->assets as $asset)
                                <tr>
                                    <th scope="row">{{ $asset->id }}</th>
                                    <td>{{ $asset->ref_no }}</td>
                                    <td>{{ $asset->name }}</td>
                                    <td><a title="Remove this asset"
                                           href="{{ route('admin-assets-network-remove-asset',['id' => $id, 'asset_id' => $asset->id]) }}"
                                           class="btn btn-danger"><i class="fa fa-minus"></i></a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        {{--                        <div class="form-group row">--}}
                        {{--                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Select--}}
                        {{--                                Asset</label>--}}
                        {{--                            <div class="col-sm-6">--}}
                        {{--                                <select type="text" name="assets[]" class="form-control">--}}
                        {{--                                    @foreach($assets as $asset)--}}
                        {{--                                        <option value="{{ $asset->id }}">{{ $asset->ref_no }}--}}
                        {{--                                            - {{ $asset->name }}</option>--}}
                        {{--                                    @endforeach--}}
                        {{--                                </select>--}}
                        {{--                                @if ($errors->has('status'))--}}
                        {{--                                    <span class="text-danger">{{ $errors->first('status') }}</span>--}}
                        {{--                                @endif--}}
                        {{--                            </div>--}}
                        {{--                        </div>--}}
                    </div>

                    {{--                    <div class="border-top">--}}
                    {{--                        <div class="card-body">--}}
                    {{--                            <button type="submit" class="btn btn-primary">--}}
                    {{--                                Submit--}}
                    {{--                            </button>--}}
                    {{--                        </div>--}}
                    {{--                    </div>--}}
{{--                </form>--}}
            </div>
        </div>

    </div>
    <!-- Modal -->

@endsection

@push('custom-scripts')
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>

        $(function () {
            console.log('Ready...')
            $('[name="status"]').select2({
                width: '100%'
            });

            $('#modal-btn').on('click',function(){
                $('#exampleModalCenter').modal('show')
            })
            $('[data-dismiss="modal"]').on('click',function(){
                $('#exampleModalCenter').modal('hide')
            })
        });
        @if($status)
        $('[name="status"]').val('{!!$status!!}').trigger('change');
        @endif
    </script>
@endpush

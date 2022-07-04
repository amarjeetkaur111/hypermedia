@extends('layouts.admin')
@section('content')
    @php
        if(old('name')){
            $name = old('name');
            $email = old('email');
            $location = old('location');
            $number = old('number');
            $type = old('type');
            $status = old('status');
            $client_handler = old('client_handler');
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $email = $data->email;
            $location = $data->location;
            $number = $data->number;
            $type = $data->type;
            $status = $data->status;
            $client_handler = $data->handler ?? null;
        }
        else{
            $name = null;
            $email = null;
            $location = null;
            $number = null;
            $type = null;
            $status = null;
            $client_handler = null;
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Clients</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Clients
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="card">
                <form class="form-horizontal" method="post" action="{{ $action }}">
                    @csrf
                    <div class="card-body">
                        <h4 class="card-title">{{ $add }}</h4>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" value="{{$name}}"
                                       placeholder="Name Here">
                                @if ($errors->has('name'))
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Type</label>
                            <div class="col-sm-9">
                                <select name="type" id="type" class="form-control">
                                    <option value="Agency">Agency</option>
                                    <option value="Direct">Direct</option>
                                    <option value="Other">Other</option>
                                </select>
                                @if ($errors->has('type'))
                                    <span class="text-danger">{{ $errors->first('type') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="lname" class="col-sm-3 text-end control-label col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="email" value="{{$email}}"
                                       placeholder="Email Here">
                                @if ($errors->has('email'))
                                    <span class="text-danger">{{ $errors->first('email') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Number</label>
                            <div class="col-sm-9">
                                <input type="tel" class="form-control" name="number" value="{{$number}}"
                                       placeholder="Name Here">
                                @if ($errors->has('number'))
                                    <span class="text-danger">{{ $errors->first('number') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Location</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="location" value="{{$location}}"
                                       placeholder="Name Here">
                                @if ($errors->has('location'))
                                    <span class="text-danger">{{ $errors->first('location') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Handler</label>
                            <div class="col-sm-9">
                                <select type="text" name="client_handler" id="client_handler" class="form-control">
                                    @if($client_handler)
                                        <option value="{{ $client_handler->id }}">{{ $client_handler->name }}</option>
                                    @endif
                                </select>
                                @if ($errors->has('client_handler'))
                                    <span class="text-danger">{{ $errors->first('client_handler') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email1" class="col-sm-3 text-end control-label col-form-label">Status</label>
                            <div class="col-sm-9">
                                <select type="text" name="status" id="status" class="form-control">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                                @if ($errors->has('status'))
                                    <span class="text-danger">{{ $errors->first('status') }}</span>
                                @endif
                            </div>
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
    </div>
@endsection

@push('custom-scripts')

    <script>

        $(function () {
            $('#status').select2({
                width: '100%'
            });
            $('#type').select2({
                width: '100%'
            });
            $('#client_handler').select2({
                width: '100%',
                ajax: {
                    url: '{{ route('select-2-get-users') }}',
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
            console.log('Ready...')
        });
        @if($type)
        $('#type').val('{!!$type!!}').trigger('change');
        @endif
        @if($status)
        $('#status').val('{!!$status!!}').trigger('change');
        @endif

    </script>
@endpush

@extends('layouts.admin')
@section('content')
    @php
        if(old('name')){
            $name = old('name');
            $supervisor = null;
            $members = null;
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $supervisor = $data->supervisor ?? null;
            $members = [];
            foreach($data->members as $value){
                $members[] = '<option value='.$value->id.' selected="selected">'.$value->name.'</option>';
            }
            $members = implode(' ',$members);
        }
        else{
            $name = null;
            $supervisor = null;
            $members = null;
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Teams</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Teams
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
                        <div class="form-group row ">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Supervisor</label>
                            <div class="col-sm-9">
                                <select name="supervisor" class="form-control" id="supervisor" required>
                                    <option>Select Supervisor</option>
                                    @if($supervisor)
                                        <option value="{{ $supervisor->id }}"
                                                selected>{{ $supervisor->name }}</option>
                                    @endif
                                </select>
                                @if ($errors->has('client_name'))
                                    <span class="text-danger">{{ $errors->first('client_name') }}</span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label for="fname" class="col-sm-3 text-end control-label col-form-label">Team Members</label>
                            <div class="col-sm-9">
                                <select name="team_members[]" class="form-control" id="team_members" required multiple>
                                    {!! $members !!}
                                </select>
                                @if ($errors->has('client_name'))
                                    <span class="text-danger">{{ $errors->first('client_name') }}</span>
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

            $('#supervisor').select2({
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

            $('#team_members').select2({
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
    </script>
@endpush

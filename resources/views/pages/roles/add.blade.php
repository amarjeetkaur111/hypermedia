@extends('layouts.admin')
@section('content')
    @php
        if(old('name')){
        $name = old('name');
        $role_permissions = [];
        }
        else if(isset($data) && $data){
            $name = $data->name;
            $role_permissions = $data->permissions->pluck('id');
        }
        else{
            $name = null;
            $role_permissions = [];
        }
    @endphp
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Users</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin-index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Roles
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
                            <label for="email1"
                                   class="col-sm-3 text-end control-label col-form-label">Permissions</label>
                            <div class="col-sm-9">
                                <select name="permissions[]" id="permissions" multiple>
                                    @foreach ($permissions as $p)
                                        <option value="{{$p->id}}">{{$p->name}}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('permissions'))
                                    <span class="text-danger">{{ $errors->first('permissions') }}</span>
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

            $('#permissions').select2({
                width: '100%'
            });
            console.log('Ready...')
        });
        @if($role_permissions)
        $('#permissions').val({!!$role_permissions!!}).trigger('change');
        @endif
    </script>
@endpush

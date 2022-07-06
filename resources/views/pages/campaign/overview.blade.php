@extends('layouts.admin')
@section('content')

<div class="page-wrapper">
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Campaign</h4>
                <div class="ms-auto text-end">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">Contract Number</li>
                            <li class="breadcrumb-item" aria-current="page">
                                {{$data->contract_number}}
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div><br />
    <div class="card">
        <div class="card-body">
            <div class="row mt-1">
                <div class="col-md-3"><b>Name</b> </div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->name}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Agency</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->agency}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Client</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->client->name}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Brand</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->brand}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Market</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->market}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Contract Name</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->contract_name}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Description</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->description}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Start Date</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->start_date}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Start Time</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->start_time}}</i></p>
                </div>
            </div>
            <!-- <div class="input-group mt-1">
                <span class="input-group-text">Name</span>
                <input type="text" aria-label="Name" class="form-control" value="{{$data->name}}" disabled>
            </div>
            <div class="input-group mt-1">
                <span class="input-group-text">Agency</span>
                <input type="text" aria-label="Name" class="form-control" value="{{$data->agency}}" disabled>
            </div>
            <div class="input-group mt-1">
                <span class="input-group-text">Agency</span>
                <input type="text" aria-label="Name" class="form-control" value="{{$data->agency}}" disabled>
            </div> -->
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="page-title">Buckets</h4>
            @foreach($data->buckets as $bucket)
            <div class="row mt-1">
                <div class="col-md-3"><b>Asset Type</b> </div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$bucket->asset_type}}</i></p>
                </div>
            </div>
           @endforeach
        </div>
    </div>
</div>

@endsection
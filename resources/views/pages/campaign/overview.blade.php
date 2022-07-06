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
                    <p class="card-text"><i>{{Carbon\Carbon::parse($data->start_date)->format('d F Y')}}</i></p>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col-md-3"><b>Start Time</b></div>
                <div class="col-md-8">
                    <p class="card-text"><i>{{$data->start_time}}</i></p>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="page-title">Buckets</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="font-weight: bold;">#</th>
                        <th scope="col" style="font-weight: bold;">Start Date</th>
                        <th scope="col" style="font-weight: bold;">End Date</th>
                        <th scope="col" style="font-weight: bold;">Asset Type</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($data->buckets as $bucket)

                    <tr>
                        <th scope="row">{{$bucket->id}}</th>
                        <td>{{Carbon\Carbon::parse($bucket->start_date)->format('d F Y')}}</td>
                        <td>{{Carbon\Carbon::parse($bucket->end_date)->format('d F Y')}}</td>
                        <td>Asset Type</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>


        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="page-title">Campaign Status</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="font-weight: bold;">#</th>
                        <th scope="col" style="font-weight: bold;">Status</th>
                        <th scope="col" style="font-weight: bold;">Status Change At</th>
                        <th scope="col" style="font-weight: bold;">Status Change By</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($data->campaignStatus as $campaign_status)

                    <tr>
                        <th scope="row">{{$campaign_status->id}}</th>
                        <td>{{$campaign_status->status}}</td>
                        <td>{{$bucket->created_at->format('M d Y')}}</td>
                        <td>{{$data->client->name}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>


        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="page-title">Campaign Assign</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="font-weight: bold;">#</th>
                        <th scope="col" style="font-weight: bold;">Name</th>
                        <!-- <th scope="col">Campaign Assign At</th> -->
                        <!-- <th scope="col">Campaign Assign By</th> -->
                    </tr>
                </thead>
                <tbody>
                    @foreach($data->assignee as $assignee)
                    
                    <tr>
                        <th scope="row">{{$assignee->id}}</th>
                        <td>{{$assignee->name}}</td>
                        <!-- <td>{{$bucket->created_at->format('M d Y')}}</td>
                        <td>{{$data->client->name}}</td> -->
                    </tr>
                    
                    @endforeach
                </tbody>
            </table>


        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <h4 class="page-title">Campaign Locations</h4>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="font-weight: bold;">#</th>
                        <th scope="col" style="font-weight: bold;">Name</th>
                        <!-- <th scope="col">Campaign Assign At</th> -->
                        <!-- <th scope="col">Campaign Assign By</th> -->
                    </tr>
                </thead>
                <tbody>
                @foreach($data->buckets as $bucket)
                
                    
                    <tr>
                        <th scope="row">{{$bucket->locations->id}}</th>
                        <td>{{$bucket->locations->name}}</td>
                        <!-- <td>{{$bucket->created_at->format('M d Y')}}</td>
                        <td>{{$data->client->name}}</td> -->
                    </tr>
                    
                    @endforeach
                </tbody>
            </table>


        </div>
    </div>
</div>

@endsection
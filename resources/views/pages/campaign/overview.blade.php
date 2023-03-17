@extends('layouts.admin')
@section('content')
<link href="{{ asset('assets/css/overview.css') }}" rel="stylesheet" />

<div class="page-wrapper">

    <!-- <div class="tab">
        <button class="tablinks" data-id="campaign_listing">Campaign Listing</button>
        <button class="tablinks" data-id="campaign_calander">Calander</button>
    </div><br /> -->

    
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <div class="page-title"><b>Campaign Name :</b> <i>{{$data->name}}</i></div>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">Campaign</li>
                                <li class="breadcrumb-item" aria-current="page">
                                    Overview
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div><br />
        <div class="card">
            <div class="card-body">
                @if(\Illuminate\Support\Facades\Session::has('msg'))
                <div class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                    <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                </div>
                @endif
                <div class="row mt-2">
                    <div class="col-md-3"><b>Contract Number</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->contract_number}}</i></p>
                    </div>
                    <div class="col-md-3"><b>Agency</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->agency}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>Client</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->client->name}}</i></p>
                    </div>
                    <div class="col-md-3"><b>Market</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->market}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>Contract Name</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->contract_name}}</i></p>
                    </div>
                    <div class="col-md-3"><b>Description</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->description}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>Campaign Type</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->campaign_type}}</i></p>
                    </div>
                    <div class="col-md-3"><b>Start Date</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{Carbon\Carbon::parse($data->start_date)->format('d F Y')}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>Start Time</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->start_time}}</i></p>
                    </div>
                    <div class="col-md-3"><b>End Date</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{Carbon\Carbon::parse($data->end_date)->format('d F Y')}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>End Time</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->end_time}}</i></p>
                    </div>
                    <div class="col-md-3"><b>Payment status</b> </div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->payment_status}}</i></p>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><b>Booking Order</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><i>{{$data->booking_order}}</i></p>
                    </div>
                    @if($data->booking_order_file)
                    <div class="col-md-3"><b>Booking File</b></div>
                    <div class="col-md-3">
                        <p class="card-text"><a href="{{route('download-file',['table' => Crypt::encrypt('campaign'),'field'=>'booking_order_file', 'id'=>$data->id])}}"><button type="button" class="btn btn-primary">Download</button></a></p>
                    </div>

                    @endif
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
                            <th scope="col" style="font-weight: bold;">Name</th>
                            <th scope="col" style="font-weight: bold;">Asset</th>
                            <th scope="col" style="font-weight: bold;">Asset Type</th>
                            <th scope="col" style="font-weight: bold;">Location</th>
                            <th scope="col" style="font-weight: bold;">Start Date</th>
                            <th scope="col" style="font-weight: bold;">End Date</th>
                            <th scope="col" style="font-weight: bold;">Updated On</th>

                        </tr>
                    </thead>
                    <tbody>
                        @php
                        $i = 1;
                        @endphp
                        @foreach($data->buckets as $bucket)
                        @php
                            $list = explode (", ", $bucket->asset); 
                            $assetData = \App\Models\Assets::whereIn('id',$list)->get(); 
                        @endphp
                        <tr>
                            <th scope="row">@php echo $i @endphp</th>
                            <td>{{$assetData[0]->name ?? ''}}</td>
                            <td>@foreach($assetData as $as){{$as->ref_no}}<br>@endforeach</td>
                            <td>{{$bucket->asset_type}}</td>
                            <td>{{$bucket->locations->name}}</td>
                            <td>{{Carbon\Carbon::parse($bucket->start_date)->format('d M Y')}}</td>
                            <td>{{Carbon\Carbon::parse($bucket->end_date)->format('d M Y')}}</td>
                            <td>{{Carbon\Carbon::parse($bucket->updated_at)->format('d M Y')}}</td>
                        </tr>
                        @php
                        $i++;
                        @endphp
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
                        @php
                        $j = 1;
                        @endphp
                        @foreach($data->campaignStatus as $campaign_status)

                        <tr>
                            <th scope="row">@php echo $j @endphp</th>
                            <td>{{$campaign_status->status}}</td>
                            <td>{{$campaign_status->created_at->format('M d Y')}}</td>
                            <td>{{$data->client->name}}</td>
                        </tr>
                        @php
                        $j++;
                        @endphp
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
                            <th scope="col" style="font-weight: bold;">Assign To</th>

                            <!-- <th scope="col">Campaign Assign By</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @php
                        $k = 1;
                        @endphp
                        @foreach($data->assignee as $assignee)

                        <tr>
                            <th scope="row">@php echo $k @endphp</th>
                            <td>{{$assignee->name}}</td>


                        </tr>
                        @php
                        $k++;
                        @endphp
                        @endforeach
                    </tbody>
                </table>


            </div>
        </div>


        <div class="card">
            <div class="card-body">
                <h4 class="page-title">Photos</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" style="font-weight: bold;">#</th>
                            <th scope="col" style="font-weight: bold;">Description</th>
                            <th scope="col">Photo</th>
                            <th scope="col">View</th>
                            <th scope="col">Download</th>
                            <!-- <th scope="col">Campaign Assign By</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data->photos as $photo)


                        <tr>
                            <td scope="row">{{$photo->id}}</td>
                            <td scope="row">{{$photo->description}}</td>
                            <td scope="row"><img src="{{$photo->photo_path}}" alt="" width="100" height="50"></td>
                            <td><i class="fa fa-eye photos_btn" data-img="{{$photo->photo_path}}"></i></td>
                            <td><a href="{{route('download-file',['table' => Crypt::encrypt('campaign_monitoring'),'field'=>'photo_path', 'id'=>$photo->id])}}"><button type="button" class="btn btn-primary">Download</button></a></td>

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
                <h4 class="page-title">Permits</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" style="font-weight: bold;">#</th>
                            <th scope="col" style="font-weight: bold;">Description</th>
                            <th scope="col">View</th>
                            <!-- <th scope="col">Campaign Assign By</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data->permits as $permit)


                        <tr>
                            <td scope="row">{{$permit->id}}</td>
                            <td scope="row">{{$permit->description}}</td>

                            <td><a href="{{route('download-file',['table' => Crypt::encrypt('campaign_permits'),'field'=>'permit_file', 'id'=>$permit->id])}}"><button type="button" class="btn btn-primary">Download</button></a></td>
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

@push('custom-scripts')
<script>
    $body = $('body');
    $body.on('click', '.photos_btn', function(e) {
        e.preventDefault();
        $href = $(this).attr('data-img');
        jc_avail_photo = $.confirm({
            animateFromElement: true,
            title: 'Photo',
            content: '<img src="' + $href + '" >',
            columnClass: 'large',
            buttons: {
                Close: function() {
                    return;
                },
            },
        });
    })

    $body.on('click', '#campaign_listing');
</script>

<script>
    $body.on('click', '.tablinks', function(evt) {
        var divId = $(this).attr('data-id');
        //    alert(divId)
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace("active", "");
        }
        document.getElementById(divId).style.display = "block";
        evt.currentTarget.className += " active";
    });
</script>
@endpush
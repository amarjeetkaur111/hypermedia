
<style>
    .header-caption {
        border-top: 4px double #000;
        border-bottom: 3px double #000;
        text-align: center;
        padding-top: 0.5em;
        padding-bottom: 0.5em;
    }
    
    .date{font-size:12px;}
    .page {
        overflow: hidden;
        page-break-after: always;
    }
    .table{
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
        vertical-align: top;
        border-color: #dee2e6;
        caption-side: bottom;
        border-collapse: collapse;
    }
    .page .table tbody, td, tfoot, th, thead, tr {
        border-color: inherit;
        border-style: solid;
        border-width: 1;
        
    }
    tr td{
        font-size:12px;      
        padding:8px;    

    }
    thead tr th{
        font-size:14px;   
        padding:8px;    
    }
</style>
<div class="page">
    <div class="header-caption">
        <h1 class="text-center">Campaigns </h1>
        <p class="date">{{date('d M Y',strtotime($startdate))}}  -  {{date('d M Y',strtotime($enddate))}}</p>
    </div>    
    <table class="table table-bordered">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Agency</th>
            <th scope="col">Client</th>
            <th scope="col">Department</th>
            <th scope="col">Booking Order</th>
            <th scope="col">Contract No</th>
            <th scope="col">Status</th>
            <th scope="col">StartDate</th>
            <th scope="col">EndDate</th>
            </tr>
        </thead>
        <tbody>
            @foreach($camps as $k => $data)
            <tr>
            <td scope="row">{{$k+1}}</td>
            <td>{{$data->name ?? '-'}}</td>
            <td>{{$data->agency ?? '-'}}</td>
            <td>{{$data->client->name ?? '-'}}</td>
            <td>{{$data->department->name ?? '-'}}</td>
            <td>{{$data->booking_order ?? '-'}}</td>
            <td>{{$data->contract_number ?? '-'}}</td>
            <td>{{$data->status}}</td>
            <td>{{date('d-M-Y',strtotime($data->start_date))}}</td>
            <td>{{date('d-M-Y',strtotime($data->end_date))}}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

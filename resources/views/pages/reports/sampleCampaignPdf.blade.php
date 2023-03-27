
<style>
   *{
 font-family: Arial, Helvetica, Verdana, Geneva, Tahoma, sans-serif;
}
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
    .table {
  width: 100%;
  margin-bottom: 1rem;
  color: #212529;
  vertical-align: top;
  border-color: #DEE2E6;
}
.table > :not(caption) > * > * {
  padding: 0.5rem 0.5rem;
  background-color: #F8F9FA;
  border-bottom-width: 1px;
  border-bottom-color:dee2e6;
}
.table > tbody {
  vertical-align: inherit;
}
.table > thead {
  vertical-align: bottom;
}
.table > thead th{
    background-color: #212529;
    color: #DEE2E6;
}
    tr td{
        font-size:10px;
        padding:8px;
    }
    thead tr th{
        font-size:14px;
        padding:10px;
    }
    .row {
        display:inline-grid;
        column-gap: 10px;
        row-gap: 10px;
        grid-template-columns: auto auto auto auto;
    }
    .col {
        border: 1px solid rgba(0, 0, 0, 0.3);
        padding:5px;
        text-align: center;
        height: 250px;
    }
    .img-fluid {
        max-width: 100%;
        height: auto;
    }
    .col  img.img-fluid {
       margin-top: 50%;
       margin-left: 50%;
       transform: translate(-50%, -60%);
    }
    .data_col{
        font-size:14px;
    }
</style>
@foreach($camp[0]['buckets'] as $k => $bucket)
</div class="page">
    <div class="header-caption">
        <h1 class="text-center">{{$camp[0]['name']}}</h1>
        <h3 class="date">{{$bucket['locations']['name']}}</h3>
    </div>    
    <table style="width: 90%; color: #212529; font-size:18px; border: 1px solid  rgba(0, 0, 0, 0.1); margin-bottom: 15px; margin-left:3rem;border-spacing: 1px;">
        <tbody>
            <tr>
                <td  style="width: 50%;vertical-align: top;">
                    <table style="width: 100%; border-spacing: 1px;">
                        <tbody>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">#</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$k+1}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">Agency</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$camp[0]['agency'] ?? '-'}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle;background-color: #212529; color: #DEE2E6;text-align: center;">Client</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$camp[0]['client']['name'] ?? '-'}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">Department</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$camp[0]['department']['name'] ?? '-'}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle;background-color: #212529; color: #DEE2E6;text-align: center;">Status</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$camp[0]['status']}}</td>
                            <tr>
                        </tbody>
                    </table>
                </td>
                <td  style="width: 50%;vertical-align: top;">
                    <table style="width: 100%; border-spacing: 1px;">
                        <tbody>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">Start Date</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{date('d-M-Y',strtotime($camp[0]['start_date']))}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle;background-color: #212529; color: #DEE2E6;text-align: center;">End Date</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{date('d-M-Y',strtotime($camp[0]['end_date']))}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">Location</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col">{{$bucket['locations']['name']}}</td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle;background-color: #212529; color: #DEE2E6;text-align: center;">Asset</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col"></td>
                            <tr>
                            <tr>
                                <td  style="width: 20%;vertical-align: middle; background-color: #212529; color: #DEE2E6;text-align: center;">Asset Type</td>
                                <td  style="width: 80%;vertical-align: middle;" class="data_col"></td>
                            <tr>
                        </tbody>
                    </table>
                </td>
        </tbody>
    </table>
    <table>
        @if(isset($bucket['proofpictures']))
            @if(!empty($bucket['proofpictures']))
                <tr>
                @php $c = 0; @endphp
                @foreach($bucket['proofpictures']['pictures'] as $pic)  
                    <td style="width:25%"><img src="{{$pic['image']}}" class="img-fluid"></td>                    
                    @php  $c++; @endphp
                    @if($c >= 4)
                        </tr>
                        <tr>
                    @php  $c = 0; @endphp
                    @endif                        
                @endforeach           
            @endif
        @elseif($ppp == 1)
            <p style="text-align:center">No Proof Pictures Found!</p>
        @endif
    </table>
</div>
</div>

@endforeach

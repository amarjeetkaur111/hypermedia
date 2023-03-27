
<style>
   *{
 font-family: Arial, Helvetica, Verdana, Geneva, Tahoma, sans-serif;
}
    .header-caption {
        text-align: center;
        padding-top: 0.2em;
        padding-bottom: 0.3em; 
    }
    .campName{
        font-size:26px;
        margin: 0px;
        padding: 0.15em;
        color: #2aa7ff;
    }
    .date{
        font-size:14px;        
        margin: 0px;
        padding-bottom:0px;
        color: #79899d;
        font-weight: normal;
    }
    .locationName{
        font-size:20px;
        margin: 0px;
        padding: 0.2em;
        color: #617083;
    }
    .assetName{
        font-size:12px;        
        margin: 0px;
        padding:0.3em;
        background-color: #3e4956;
        color: #ffffff;
        font-weight: bold;
    }
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
        font-size:14px;
        padding:5px;
    }
    thead tr th{
        font-size:14px;
        padding:5px;
    }
    .row {
        display:inline-grid;
        column-gap: 5px;
        row-gap: 5px;
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
    <div class="header-caption" style="background-color: #F2F5F8;">
        <h1 class="text-center campName">{{$camp[0]['name']}}</h1>
        <h3 class="date" style=" margin-bottom: 0.3em;">{{date('d-M-Y',strtotime($camp[0]['start_date']))}}  -  {{date('d-M-Y',strtotime($camp[0]['end_date']))}} </h3>
    </div>
    <div class="header-caption" style=" margin:1em 0px;">
        <table style="width: 100%; border-spacing: 0px;" border="0">
            <tbody>
                <tr>
                    <td  style="width: 10%;vertical-align: middle; text-align: right; font-weight: bold; border-bottom: 2px solid rgb(168, 130, 182); ">Agency : </td>
                    <td  style="width: 22%;vertical-align: middle; border-bottom: 2px solid rgb(168, 130, 182); " class="data_col">{{$camp[0]['agency'] ?? '-'}}</td>

                    <td  style="width: 10%;vertical-align: middle; text-align: right; font-weight: bold; border-bottom: 2px solid rgb(168, 197, 76);">Client : </td>
                    <td  style="width: 22%;vertical-align: middle; border-bottom: 2px solid rgb(168, 197, 76);" class="data_col">{{$camp[0]['client']['name'] ?? '-'}}</td>

                    <td  style="width: 14%;vertical-align: middle;  text-align: right; font-weight: bold; border-bottom: 2px solid rgb(21, 200, 93);">Department : </td>
                    <td  style="vertical-align: middle; border-bottom: 2px solid rgb(21, 200, 93);" class="data_col">{{$camp[0]['department']['name'] ?? '-'}}</td>
                <tr>
            </tbody>
        </table>                   
                  
    </div>   
    
    <div class="header-caption" style="border-bottom: 0px;border: 2px solid #F2F5F8; margin-bottom: 1.5em;">
        <h4 class="text-center locationName">{{$bucket['locations']['name']}}</h4>
        <h5 class="text-center assetName" style=" margin-bottom:0.5rem;" >Asset -  {{$camp[0]['agency'] ?? '-'}} </h5>

        <table style="width: 100%; border-spacing: 0px;" border="0">
            <tbody>
                <tr>
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img1.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img2.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img3.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img4.jpg') }}" class="img-fluid"></td> 
                </tr>
                <tr>
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img5.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img6.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img1.jpg') }}" class="img-fluid"></td> 
                    <td style="width: 25%;"><img src="{{ asset('assets/images/big/img2.jpg') }}" class="img-fluid"></td> 
                </tr>
            </tbody>
        </table>
    </div>

</div>
</div>

@endforeach

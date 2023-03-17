<style>
    .card table td{padding:0px;text-align:center;}
    .td-css{font-size:1rem;font-weight:800}
</style>
<div style="display: flex; justify-content:end; align-items:center; gap:1rem;">

    <div style="display: flex; flex-direction:column;justify-content:center; align-items:center;">
        <h5 class="text-center" style="margin:0px; width:100%;">Installed</h5>
        <p class="text-center" style="margin:0px; width:100%;">{{$proofcount}}</p>
    </div>
    <div style="display: flex; flex-direction:column;justify-content:center; align-items:center;padding-right:5px;">
        <h5 class="text-center" style="margin:0px; width:100%;">Rejected</h5>
        <p class="text-center" style="margin:0px; width:100%;">{{$rejectcount}}</p>
    </div>
</div>
    @forelse($data as $d)
    <div class="card" style="margin-right:1rem;">
        <div class="card-body">
            <h4 class="card-title">{{ $d->locations->name }}</h4>
        </div>
        <table class="table table-bordered">
        <tbody>
        @foreach($d->asset_data as $s =>$asset)        
        <tr>
            <td width="10%">{{ $s+1 }}</td>
            <td>{{ ucfirst($asset->type) }}</td>
            <td class="td-css">{{ $asset->name }}</td>
            <td>{{ $asset->ref_no }}</td>
            <td>@if(!empty($asset->proof))
                    @if($asset->proof->status == 1)
                        <i class="fa fa-check" style="color:green;font-weight:900;" data-toggle="tooltip" title="Done"></i>
                    @elseif($asset->proof->status == 0)
                        <i class="fa fa-times" style="color:orange;font-weight:900;font-size:1.4rem;" title="Rejected"></i>
                    @endif
                @else   
                <i class="fa fa-circle" style="font-size:5px;color:grey" title="Pending"></i>
                @endif</td>
        </tr>
        @endforeach
    </div>
    </tbody>
</table>
    @empty
        <tr>
            <td></td>
            <td></td>
            <td>No Assets</td>
            <td></td>
        </tr>
    @endforelse


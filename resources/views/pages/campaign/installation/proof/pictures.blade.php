<table class="table table-bordered text-center">
    <thead>
    <tr>
        <td width="80%">Pictures</td>
        <td width="10%">Download</td>
    </tr>
    </thead>
    <tbody>
    @forelse($data->pictures as $d)
        <tr>
            <td><img src="{{ $d->image  }}" width="300" ></td>
            <td><a href="{{ route('download-file',['table' => \Illuminate\Support\Facades\Crypt::encrypt(' proof_pictures'),'field' => 'image','id' => $d->id]) }}" class="btn btn-sm btn-primary"><i class="fa fa-download"></i></a></td>
        </tr>
    @empty
        <tr>
            <td></td>
            <td>No Photos uploaded</td>
            <td></td>
        </tr>
    @endforelse
    </tbody>
</table>

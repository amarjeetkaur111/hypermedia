
<table class="table table-bordered">
    <thead>
    <tr>
        <td  width="20%">ID</td>
        <td  width="50%">Description</td>
{{--        <td  width="30%">Permit</td>--}}
        <td  width="30%">Download</td>
    </tr>
    </thead>
    <tbody>
    @forelse($data->permits as $d)
        <tr>
            <td>{{ $d->id }}</td>
            <td>{{ $d->description }}</td>
{{--            <td><img src="{{ asset('uploads').'/'. $d->permit_file  }}" alt="..." class="img-thumbnail" style="max-width: 100px"></td>--}}
            <td><a href="{{ route('download-file',['table' => \Illuminate\Support\Facades\Crypt::encrypt('campaign_permits'),'field' => 'permit_file','id' => $d->id]) }}" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i></a></td>
        </tr>
    @empty
        <tr>
            <td></td>
            <td>No Permits uploaded</td>
{{--            <td></td>--}}
            <td></td>
        </tr>
    @endforelse
    </tbody>
</table>

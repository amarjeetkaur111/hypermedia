<table class="table table-bordered">
    <thead>
    <tr>
        <td width="10%">ID</td>
        <td width="30%">Description</td>
        <td width="50%">Photo</td>
        <td width="10%">Download</td>
    </tr>
    </thead>
    <tbody>
    @forelse($data->photos as $d)
        <tr>
            <td>{{ $d->id }}</td>
            <td>{{ $d->description }}</td>
            <td><img src="{{ $d->photo_path  }}" alt="..." class="img-thumbnail" style="max-width: 100px"></td>
            <td><a href="{{ route('download-file',['table' => \Illuminate\Support\Facades\Crypt::encrypt('campaign_monitoring'),'field' => 'photo_path','id' => $d->id]) }}" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i></a></td>
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

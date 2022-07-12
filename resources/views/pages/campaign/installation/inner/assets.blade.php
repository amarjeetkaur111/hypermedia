<table class="table table-bordered">
    <thead>
    <tr>
        <td  width="10%">ID</td>
        <td  width="30%">Ref No</td>
        <td  width="40%">Name</td>
        <td  width="20%">Type</td>
    </tr>
    </thead>
    <tbody>
    @forelse($data as $d)
        <tr>
            <td>{{ $d->assets->id }}</td>
            <td>{{ $d->assets->ref_no }}</td>
            <td>{{ $d->assets->name }}</td>
            <td>{{ $d->assets->type }}</td>
        </tr>
    @empty
        <tr>
            <td></td>
            <td></td>
            <td>No Assets</td>
            <td></td>
        </tr>
    @endforelse
    </tbody>
</table>

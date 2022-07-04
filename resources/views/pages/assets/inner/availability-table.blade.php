<table class="table table-bordered">
    <thead>
    <tr>
        <td>Ref</td>
        <td>Name</td>
        <td>Type</td>
        <td>Status</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>{{ $asset->name }}</td>
        <td>{{ $asset->ref_no }}</td>
        <td>{{ $asset->type }}</td>
        <td>{{ $asset->assetStatus ? $asset->assetStatus->status : 'Available' }}</td>
    </tr>
    </tbody>
</table>

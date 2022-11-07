<table class="table table-bordered">
    <thead>
    <tr>
        <td>No</td>
        <td>Name</td>
        <td>Ref</td>
        <td>Assigned Campaign</td>
        <td>Booked Dates</td>
        <td>Status</td>
    </tr>
    </thead>
    <tbody>
    @foreach($asset as $k => $asset)
        <tr>
            <td>{{ $k+1 }}</td>
            <td>{{ $asset['name']}}</td>
            <td>{{ $asset['ref_no'] }}</td>
            <td>{{ $asset['asset_status'] ? $asset['asset_status']['campaign']['name']: 'NA' }}</td>
            <td>{{ $asset['asset_status'] ? date('d-M-Y',strtotime($asset['asset_status']['from_date'])).' - '.date('d-M-Y',strtotime($asset['asset_status']['to_date'])): 'NA' }}</td>
            <td>{{ $asset['asset_status'] ? $asset['asset_status']['status'] : 'Available' }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
<script>
    $(document).ready(function () {
        $('.table').DataTable();
    });
</script>
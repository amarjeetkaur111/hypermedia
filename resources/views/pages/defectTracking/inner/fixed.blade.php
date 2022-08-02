<form id="defect-fixed" method="post" action="{{ $action }}">
    @csrf
        <h4>Is {{$defect->asset->ref_no}}-{{$defect->asset->name}} Working Now?</h4>
</form>

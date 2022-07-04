<div>
    <div class="row" style="width: 90%">
        <div class="col-md-3">
        <label class="control-label">Asset</label>
        </div>
        <div class="col-md-9">
        <select class="form-control" id="asset-select">
            <option selected disabled>Select Asset</option>
            @foreach($asset as $a)
                <option value="{{ $a->id }}">{{ $a->ref_no.' - '.$a->name }}</option>
            @endforeach
        </select>
        </div>
    </div>
</div>
<div class="table-class" style="display: flex; justify-content: center; align-items: center; margin-top: 20px">
    <span>Select An Asset</span>
</div>

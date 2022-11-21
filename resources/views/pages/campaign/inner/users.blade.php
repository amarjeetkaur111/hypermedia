<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        color: #898080;
    }
    .select2-dropdown {z-index: 100000000 !important;}
    .select2-selection--multiple {
    overflow: hidden !important;
    height: auto !important;
}
</style>
<form id="from-assign" method="post" action="{{ $action }}">
    @csrf
    <input type="hidden" name="from" id="from" value="">
    <div class="row" style="width:100%">
        <div class="form-group col-md-6">  
            <label for="users" class="text-end control-label col-form-label">Teams</label>  
            <select name="teams[]" class="form-control" id="teams" required multiple>
                @foreach($teams as $team)
                <?php 
                    $selected = '';
                    foreach($assignedteams as $assigned){
                    if($team->id == $assigned->team_id) $selected = 'selected';
                }?>
                    <option value="{{$team->id}}" {{ $selected }}>{{ $team->name }}</option>
                @endforeach
            </select>  
        </div>
        <div class="form-group col-md-6">  
            <label for="users" class="text-end control-label col-form-label">Users</label>  
            <select name="users[]" class="form-control" id="users" required multiple>
                    @foreach($users as $user)
                    <?php 
                        $selected = '';
                        foreach($campaign as $assigned){
                        if($user->id == $assigned->user_id) $selected = 'selected';
                    }?>
                        <option value="{{$user->id}}" {{ $selected }}>{{ $user->name }}</option>
                    @endforeach
            </select>  
        </div>
    </div>
    <script>
        $('#teams').select2({
        width: '100%',
        ajax: {
            url: '{{ route('select-2-get-teams') }}',
            data: function (params) {
                var query = {
                    search: params.term,
                    type: 'public'
                }
                return query;
            },
            processResults: function (data) {
                // Transforms the top-level key of the response object from 'items' to 'results'
                $('#users').val('').trigger('change')
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                    })
                }
            }
        }
    });
    $('#users').select2({
        width: '100%',
        ajax: {
            url: '{{ route('select-2-get-teamUsers') }}',
            data: function (params) {
                var query = {
                    search: params.term,
                    team: $('#teams').val(),
                    type: 'public'
                }
                return query;
            },
            processResults: function (data) {
                // Transforms the top-level key of the response object from 'items' to 'results'
                console.log(data);
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.name,
                            id: item.id
                        }
                    })
                }
            }
        }
    });

    </script>           
</form>

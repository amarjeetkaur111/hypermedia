<form id="from-assign" method="post" action="{{ $action }}">
    @csrf
    <select name="users[]" class="form-control" id="users" required multiple>
            @foreach($users as $user)
            <?php 
                $selected = '';
                foreach($campaign->assignee as $assigned){
                if($user->id == $assigned->id) $selected = 'selected';
             }?>
                <option value="{{$user->id}}" {{ $selected }}>{{ $user->name }}</option>
            @endforeach
    </select>  
    <script>
    $('#users').select2({
        width: '100%',
        ajax: {
            url: '{{ route('select-2-get-users') }}',
            data: function (params) {
                var query = {
                    search: params.term,
                    type: 'public'
                }
                return query;
            },
            processResults: function (data) {
                // Transforms the top-level key of the response object from 'items' to 'results'
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

<form id="from-assign" method="post" action="{{ $action }}">
    @csrf
    <select name="user" id="user" class="form-control">
       @foreach($users as $user)
           <option value="{{$user->id}}" {{ $campaign->assignee->count() && $user->id == $campaign->assignee->first()->id ? 'selected="selected"' : '' }}>{{ $user->name }}</option>
        @endforeach
    </select>
</form>

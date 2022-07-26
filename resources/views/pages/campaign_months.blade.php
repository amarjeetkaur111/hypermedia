<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        width: 30%;
    }
    th {
        border: 1px solid white;
        text-align: left;
        padding: 8px;
        width: 10%;
    }

    table thead tr th{
        background-color: #58595B !important;
        color: white !important;
    }

    .active-cell{
        background: palegreen;
        color: black;
    }
    .install-cell{
        background: lightskyblue;
        color: black;
    }
    .dismantle-cell{
        background: peachpuff;
        color: black;
    }
    .maintenance-cell{
        background: yellow;
        color: black;
    }
    .clash-cell{
        background: red;
        color: white;
    }
    .size{
        font-size:10px;
        font-weight:700;
        color:#F3811F;
    }

</style>


<h2>Campaign Schedule for {{$year}}</h2>
<div class="row">
    <div class="col-md-4" style="padding-right: 0;">
        <table>
            <thead>
                <tr>
                    <th>Campaign</th>
                    <th>Departments</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr><td colspan="2" class="m-auto text-justify size">Week Days</td></tr>
                @foreach($data as $key)
                    <tr>
                        <td>{{$key->name}}</td>
                        <td>{{$key->department ?$key->department->name : 'N/A'}}</td>
                        <td>
                            <a href="{{route('admin-campaign-overview', $key->id)}}" class="btn_margin edit btn btn-primary btn-sm" title="Overview"><i class="fas fa-eye"></i></a>
                            <a href="{{route('admin-campaign-installation-types-index', $key->id)}}" class="btn_margin edit btn btn-primary btn-sm" title="installation"><i class="fa fa-wrench"></i></a>
                        </td>
                    </tr>
                @endforeach
            </tbody>

        </table>
    </div>
    <div class="col-md-8" style="overflow-x: auto; padding-left: 0;">
        <table>
            <thead>
                <tr>
                    @foreach($newarray as $key => $value)
                        <th colspan="{{ count($value) }}">{{ config('months.'.$key) }}</th>
                    @endforeach
                </tr>
                <tr>
                    @foreach($newarray as $key1 => $value1)
                        @foreach($value1 as  $value2)
                            <td class="size">{{$value2['Weekday']}}</td>
                        @endforeach
                    @endforeach
                </tr>
            </thead>
            <tbody>
            @foreach($data as $keyer)
                <tr>
                    @foreach($newarray as $key1 => $value1)
                        @foreach($value1 as  $value2)
                            @php $class = ''; $tooltip='';@endphp
                            @if(isset($keyer->date_range[$year][$key1]) && in_array($value2['Date'],$keyer->date_range[$year][$key1]))
                                @php $class = 'active-cell';$tooltip='Live';@endphp
                            @else
                                @foreach($keyer->activity as $act)                                   
                                    @if(isset($act['type']) &&  $act['type'] == 'Installation' && isset($act['dates'][$year][$key1]) && in_array($value2['Date'],$act['dates'][$year][$key1]))
                                        @php $class = 'install-cell'; $tooltip='Installation'; @endphp
                                    @elseif(isset($act['type']) &&  $act['type'] == 'Maintenance' && isset($act['dates'][$year][$key1]) && in_array($value2['Date'],$act['dates'][$year][$key1]))
                                        @php $class = 'maintenance-cell'; $tooltip='Maintenance'; @endphp
                                    @elseif(isset($act['type']) &&  $act['type'] == 'Dismantle' && isset($act['dates'][$year][$key1]) && in_array($value2['Date'],$act['dates'][$year][$key1]))
                                        @php $class = 'dismantle-cell'; $tooltip='Dismantle';@endphp    
                                    @endif
                                    
                                @endforeach
                            @endif
                            <td class="{{$class}}" title="{{$tooltip}}">{{$value2['Date']}}</td>
                        @endforeach
                    @endforeach
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>

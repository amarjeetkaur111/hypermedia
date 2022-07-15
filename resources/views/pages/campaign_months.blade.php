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
        width: 10%;
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

</style>


<h2>Campaign Schedule for {{$year}}</h2>
<div class="row">
    <div class="col-md-3" style="padding-right: 0;">
        <table>
            <thead>
                <tr>
                    <th>Campaign</th>
                    <th>Departments</th>
                </tr>
            </thead>
            <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{$key->name}}</td>
                        <td>{{$key->department ?$key->department->name : 'N/A'}}</td>
                    </tr>
                @endforeach
            </tbody>

        </table>
    </div>
    <div class="col-md-9" style="overflow-x: auto; padding-left: 0;">
        <table>
            <thead>
                <tr>
                    @foreach($month_array as $key => $value)
                        <th colspan="{{ end($value) }}">{{ config('months.'.$key) }}</th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
            @foreach($data as $key)
                <tr>
                    @foreach($month_array as $value1)
                        @foreach($value1 as  $value2)
                            <td>{{$value2}}</td>
                        @endforeach
                    @endforeach
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>

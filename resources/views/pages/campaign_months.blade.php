
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  width: 10%;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>


<h2>HTML Table</h2>

<table>
  <tr>
    <th>Campaign</th>
    <th>Departments</th>
    <th>Calendar</th>
  </tr>
  <tr>
    @foreach($data as $key)
    <td>{{$key->name}}</td>
    @endforeach
    <!-- <td>Francisco Chang</td>
    <td>Mexico</td> -->
  </tr>
  <!-- <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Austria</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Canada</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>Italy</td>
  </tr> -->
</table>




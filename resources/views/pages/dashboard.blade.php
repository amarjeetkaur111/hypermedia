@extends('layouts.admin')
@section('content')

    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 d-flex no-block align-items-center">
                    <h4 class="page-title">Dashboard</h4>
                    <div class="ms-auto text-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <!-- <li class="breadcrumb-item active" aria-current="page">
                                    Library
                                </li> -->
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-fluid">

            <div class="row">
                <!-- Column -->
                <div class="col">
                    <div class="card card-hover">
                        <div class="box bg-cyan text-center">
                            <h1 class="font-light text-white">
                                <!-- <i class="mdi mdi-view-dashboard"></i> -->
                                {{$data['totalCampaigns']}}
                            </h1>
                            <h6 class="text-white">Total Campaigns</h6>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <div class="col">
                    <div class="card card-hover">
                        <div class="box bg-success text-center">
                            <h1 class="font-light text-white">
                                <!-- <i class="mdi mdi-chart-areaspline"></i> -->
                                {{$data['currentYearTotalCampaign']}}
                            </h1>
                            <h6 class="text-white">{{$data['currentYear']}} Campaigns</h6>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <div class="col">
                    <div class="card card-hover">
                        <div class="box bg-warning text-center">
                            <h1 class="font-light text-white">
                                {{$data['activeCampaigns']}}
                            </h1>
                            <h6 class="text-white">Active Campaigns</h6>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <div class="col">
                    <div class="card card-hover">
                        <div class="box bg-danger text-center">
                            <h1 class="font-light text-white">
                                {{$data['todayAssetsCount']}}
                            </h1>
                            <h6 class="text-white">Assets In Use Today</h6>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <div class="col">
                    <div class="card card-hover">
                        <div class="box bg-info text-center">
                            <h1 class="font-light text-white">
                              {{$data['clients']}}
                            </h1>
                            <h6 class="text-white">Total Clients</h6>
                        </div>
                    </div>
                </div>
                <!-- Column -->
            </div>

            <!-- Chart Section Container Starts here -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <h5 class="card-header bg-white cardChart-header d-flex py-2">
                        Campaign Timeline Hystory
                        <span class="d-inline-block ms-auto font-12" style="font-weight: normal;width:150px">
                            <select id="timelineRange" class="form-select font-12" style="font-weight: normal;">
                                <option value="digital">Last 3 Months</option>
                                <option value="digital">Last 6 Months</option>
                                <option value="Static">Last Year</option>
                            </select>
                        </span>
                        </h5>
                        <div class="card-body">
                            <div id="CampaignTimeLineChart" style="width: 100%; height:400px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <h5 class="card-header bg-white cardChart-header d-flex py-2">
                        Last 12 Months Campaign Status
                        <a class="btn btn-icon-chevron ms-auto" data-bs-toggle="collapse" data-bs-target="#c1"><i class="mdi mdi-chevron-down"></i></a>
                        </h5>
                        <div class="card-body collapse show " id="c1">
                            <div id="CampaignStatusChart" style="width: 100%; height:300px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="card">
                        <h5 class="card-header bg-white cardChart-header d-flex py-2">
                        Asset Owners
                        </h5>
                        <div class="card-body">
                            <div id="CampaignOwnersChart" style="width: 100%; height:350px;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card">
                        <h5 class="card-header bg-white cardChart-header d-flex py-2">
                        Client-Campaign Count 
                        </h5>
                        <div class="card-body">
                            <div id="CampaignMarketChart" style="width: 100%; height:350px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <h5 class="card-header bg-white cardChart-header d-flex py-2">
                        Campaign Type Status
                        <a class="btn btn-icon-chevron ms-auto" data-bs-toggle="collapse" data-bs-target="#c4"><i class="mdi mdi-chevron-down"></i></a>
                        </h5>
                        <div class="card-body collapse show " id="c4">
                            <div id="CampaignTypeChart" style="width: 100%; height:300px;"></div>
                        </div>
                    </div>
                </div>
            </div>




        </div>
    </div>
@endsection

@push('custom-scripts')
<script src="{{ asset('assets/libs/echarts-5.4.1/dist/echarts.min.js') }}"></script>
<script src="{{ asset('assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
<script src="{{ asset('assets/libs/moment/moment.min.js') }}"></script>
<script>
  $('#timelineRange').select2({ width: '100%', minimumResultsForSearch: Infinity,  placeholder: "Select Range" });
</script>
<script>
  var options = {
          series: [
          {
            data: [
              {
                x: 'Carrefour Phase 1',
                y: [ new Date('2019-01-27').getTime(), new Date('2019-03-04').getTime() ],
              },
              {
                x: 'Disney She Hulk',
                y: [ new Date('2019-01-04').getTime(), new Date('2019-03-08').getTime() ],
              },
              {
                x: 'Amana Launch and Sustain',
                y: [ new Date('2019-01-07').getTime(), new Date('2019-03-10').getTime() ],
              },
              {
                x: 'Hampton & Double Tree',
                y: [ new Date('2019-01-08').getTime(), new Date('2019-03-12').getTime() ],
              },
              {
                x: 'Homes R Us',
                y: [ new Date('2019-02-12').getTime(), new Date('2019-04-17').getTime() ],
              },
              {
                x: 'L Oreal Paris',
                y: [ new Date('2019-02-27').getTime(), new Date('2019-05-04').getTime() ],
              },
              {
                x: 'Samsung Yearly Deal MOE',
                y: [ new Date('2019-03-04').getTime(), new Date('2019-04-08').getTime() ],
              },
              {
                x: 'Aldar Education',
                y: [ new Date('2019-01-07').getTime(), new Date('2019-04-10').getTime() ],
              },
              {
                x: 'Red Tag',
                y: [ new Date('2019-02-08').getTime(), new Date('2019-03-12').getTime() ],
              },
              {
                x: 'Danube Home	C',
                y: [ new Date('2019-01-12').getTime(), new Date('2019-04-17').getTime() ],
              }
            ]
          }
        ],
          chart: {
          height: 400,
          type: 'rangeBar',
          redrawOnParentResize: true,
          toolbar: {
            show: false,
          },
          zoom: {
          enabled: false,
          }
        },
        plotOptions: {
          bar: {
            horizontal: true,
          }
        },
        xaxis: {
          type: 'datetime',
          tickPlacement: 'on',
        },
        yaxis: {
          show: true
        },
        grid: {
          row: {
            colors: ['#f3f4f5', '#fff'],
            opacity: 1
          }
        }
        };

        var CampaignTimeLineChart = new ApexCharts(document.querySelector("#CampaignTimeLineChart"), options);
        CampaignTimeLineChart.render();
</script>
<script>
  var departments = <?php echo json_encode($data['departments']); ?>;
  var last12Months = <?php echo json_encode($data['last12Months']); ?>;
  var last12MonthsCampaigns = <?php echo json_encode($data['last12MonthsCampaigns']); ?>;

  var dom = document.getElementById('CampaignStatusChart');

      var CampaignStatusChart = echarts.init(dom, null, {
        renderer: 'svg',
        useDirtyRect: false
      });
      
  let CampaignStatusResult = 0;

  var CampaigStatusOption;
      CampaigStatusOption = {
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'shadow',
        label:{
          formatter: function (params){
            for ( let i = 0; i < params.seriesData.length; i++){
              CampaignStatusResult += params.seriesData[i].value
            } 
            let resultFinal = params.value + " -------- total: " + CampaignStatusResult
            CampaignStatusResult = 0;
            return resultFinal;
          }
        }
      }
    },
    grid: {
      left: '0%',
      right: '0%',
      bottom: '0%',
      containLabel: true
    },
    legend: {
      data: departments,
    },
    xAxis: [
      {
        type: 'category',
        data: last12Months,
        axisLabel: { interval: 0 },
        axisTick: {
          alignWithLabel: true
        }
      }
    ],
    yAxis: [
      {
        type: 'value',
        name: 'Count',
        min: 0,
      }
    ],
    series:last12MonthsCampaigns.map(a => { return { name: a['department'], type:'bar', stack:'Ad',data: a['data']  } })
    
    // [
    //   {
    //     name: 'Outdoor',
    //     type: 'bar',
    //     stack: 'Ad',
    //     data: [120, 132, 101, 134, 90, 230, 210, 182, 191, 234, 290, 330]
    //   },
    //   {
    //     name: 'Metro',
    //     type: 'bar',
    //     stack: 'Ad',
    //     data: [220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290]
    //   },
    //   {
    //     name: 'InMall',
    //     type: 'bar',
    //     stack: 'Ad',
    //     data: [150, 232, 201, 154, 190, 330, 410, 150, 232, 201, 154, 190]
    //   },
    //   {
    //     name: 'InStore',
    //     type: 'bar',
    //     stack: 'Ad',
    //     data: [220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290]
    //   },
    // ]
  };

      if (CampaigStatusOption && typeof CampaigStatusOption === 'object') {
        CampaignStatusChart.setOption(CampaigStatusOption);
      }
      $(window).on("resize", function () {
        setTimeout(CampaignStatusChart.resize , 10);
      });
      $(window).on("load", CampaignStatusChart.resize);
      $('.sidebartoggler').on("click", function () {
        setTimeout(CampaignStatusChart.resize , 10);
      });
      // window.addEventListener('resize',  CampaignStatusChart.resize);
  </script>
  <script>
  var dom = document.getElementById('CampaignOwnersChart');
  var assetsCount = <?php echo json_encode($data['assetsCount']); ?>;

  var CampaignOwnersChart = echarts.init(dom, null, {
    renderer: 'svg',
    useDirtyRect: false
  });
  var CampaignOwnersOption;
  CampaignOwnersOption = {
    tooltip: {
      trigger: 'item',
      formatter: '{b} : {c} - ({d}%)'
    },
    grid: {
      left: '0%',
      right: '0%',
      bottom: '0%',
      containLabel: true
    },
    series: [
      {
        name: 'Owner',
        type: 'pie',
        radius: [20, 150],
        center: ['50%', '50%'],
        roseType: 'area',
        itemStyle: {
          borderRadius: 5
        },
        data: assetsCount.map(a => { return { value: a['total'], name: a['owned_by']  } })
        
        // [
        //   { value: 40, name: 'Hypermedia' },
        //   { value: 38, name: 'Mall' },
        //   { value: 32, name: 'MAF' },
        //   { value: 30, name: 'Metro' },
        //   { value: 28, name: 'Lulu' },
        //   { value: 26, name: 'Carrefour' },
        //   { value: 22, name: 'Abu Dhabi Union Co-op' },
        //   { value: 18, name: 'Sharjah Union Co-op' }
        // ]
      }
    ]
  };

  if (CampaignOwnersOption && typeof CampaignOwnersOption === 'object') {
      CampaignOwnersChart.setOption(CampaignOwnersOption);
  }
  $(window).on("resize", function () {
    setTimeout(CampaignOwnersChart.resize , 10);
  });
  $(window).on("load", CampaignOwnersChart.resize);
  $('.sidebartoggler').on("click", function () {
    setTimeout(CampaignOwnersChart.resize , 10);
  });
  // window.addEventListener('resize', CampaignOwnersChart.resize);
  </script>
  <script>
  var dom = document.getElementById('CampaignMarketChart');
  var campaignClientCount = <?php echo json_encode($data['campaignClientCount']); ?>;

  var CampaignMarketChart = echarts.init(dom, null, {
    renderer: 'svg',
    useDirtyRect: false
  });

  // var ROOT_PATH = 'https://echarts.apache.org/examples';
  // const weatherIcons = {
  //   Sunny: ROOT_PATH + '/data/asset/img/weather/sunny_128.png',
  //   Cloudy: ROOT_PATH + '/data/asset/img/weather/cloudy_128.png',
  //   Showers: ROOT_PATH + '/data/asset/img/weather/showers_128.png'
  // };


  var CampaignMarketOption;
  CampaignMarketOption = {
    tooltip: {
      trigger: 'item'
    },
    grid: {
      left: '0%',
      right: '0%',
      bottom: '0%',
      containLabel: true
    },
    legend: {
      bottom: 10,
      left: 'center',
      data: ['UAE', 'Saudi Arabia', 'Qatar', 'Oman', 'Kuwait', 'Bahrin']
    },
    series: [
      {
        type: 'pie',
        radius: '70%',
        center: ['50%', '40%'],
        selectedMode: 'single',
        data:  campaignClientCount ? campaignClientCount.map(a => { return { value: a['total'], name: a['client']['name']  } }) : null
        
        // [
        //   { value: 1048, name: 'UAE' },
        //   { value: 735, name: 'Saudi Arabia' },
        //   { value: 580, name: 'Qatar' },
        //   { value: 484, name: 'Oman' },
        //   { value: 300, name: 'Kuwait' },
        //   { value: 235, name: 'Bahrin' }
        // ]
        ,
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  };

  if (CampaignMarketOption && typeof CampaignMarketOption === 'object') {
      CampaignMarketChart.setOption(CampaignMarketOption);
  }
  $(window).on("resize", function () {
    setTimeout(CampaignMarketChart.resize , 10);
  });
  $(window).on("load", CampaignMarketChart.resize);
  $('.sidebartoggler').on("click", function () {
    setTimeout(CampaignMarketChart.resize , 10);
  });
  // window.addEventListener('resize', CampaignMarketChart.resize);
  </script>
  <script>
  var dom = document.getElementById('CampaignTypeChart');
  var last5Years = <?php echo json_encode($data['last5Years']); ?>;
  var last5YearsCampaigns = <?php echo json_encode($data['last5YearsCampaigns']); ?>;

      var CampaignTypeChart = echarts.init(dom, null, {
        renderer: 'svg',
        useDirtyRect: false
      });

  var CampaignTypeOption;
      CampaignTypeOption = {
    tooltip: {
      trigger: 'axis'
    },
    grid: {
      left: '3%',
      right: '3%',
      bottom: '0%',
      containLabel: true
    },
    legend: {
      data: ['Static', 'Digital', 'Promo Space','Not Selected']
    },
    xAxis: [
      {
        type: 'category',
        boundaryGap: false,
        data: last5Years,
        axisLabel: { interval: 0 },
        axisTick: {
          alignWithLabel: true
        }
      }
    ],
    yAxis: [
      {
        type: 'value',
        name: 'Count',
        min: 0,
      }
    ],
    series: last5YearsCampaigns ? last5YearsCampaigns.map(a => { return { name:a['type'],
        type: 'line', markPoint: {
          data: [
            { type: 'max', name: 'Max' },
            { type: 'min', name: 'Min' }
          ]
        }, 
        data: a['data']
        } }) : null
    
    // [
    //   {
    //     name: 'Static',
    //     type: 'line',
    //     markPoint: {
    //       data: [
    //         { type: 'max', name: 'Max' },
    //         { type: 'min', name: 'Min' }
    //       ]
    //     },
    //     data: [ 90, 210, 182, 90, 191, 34, 290, 330]
    //   },
    //   {
    //     name: 'Digital',
    //     type: 'line',
    //     markPoint: {
    //       data: [
    //         { type: 'max', name: 'Max' },
    //         { type: 'min', name: 'Min' }
    //       ]
    //     },
    //     data: [220, 92, 191, 334, 290, 330, 390, 220]
    //   },
    //   {
    //     name: 'Promo Space',
    //     type: 'line',
    //     markPoint: {
    //       data: [
    //         { type: 'max', name: 'Max' },
    //         { type: 'min', name: 'Min' }
    //       ]
    //     },
    //     data: [190, 330, 410, 50, 232, 201, 54, 190]
    //   },
    // ]
  };

      if (CampaignTypeOption && typeof CampaignTypeOption === 'object') {
          CampaignTypeChart.setOption(CampaignTypeOption);
      }
      $(window).on("resize", function () {
        setTimeout(CampaignTypeChart.resize , 10);
      });
      $(window).on("load", CampaignTypeChart.resize);
      $('.sidebartoggler').on("click", function () {
        setTimeout(CampaignTypeChart.resize , 10);
      });
      // window.addEventListener('resize', CampaignTypeChart.resize);
  </script>


  @endpush
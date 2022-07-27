<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="robots" content="noindex,nofollow"/>
<title>Hypermedia AOS</title>
<meta name="csrf-token" content="{{ csrf_token() }}">
<!-- Favicon icon -->
<link
    rel="icon"
    type="image/png"
    sizes="16x16"
    href="{{ asset('assets/images/favicon.png') }}"
/>
<!-- Custom CSS -->
<link href="{{ asset('assets/libs/flot/css/float-chart.css') }}" rel="stylesheet"/>
<!-- Custom CSS -->
<link href="{{ asset('dist/css/style.min.css') }}" rel="stylesheet"/>
<link rel="stylesheet" href="{{ asset('assets/extra-libs/DataTables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css') }}" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
    ::-webkit-scrollbar {
        width: 10px;
    }

    /* Track */
    ::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
        background: #888;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
</style>
</head>

<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div
    id="main-wrapper"
    data-layout="vertical"
    data-navbarbg="skin5"
    data-sidebartype="full"
    data-sidebar-position="absolute"
    data-header-position="absolute"
    data-boxed-layout="full"
>
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-header" data-logobg="skin5">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    <!-- Logo icon -->
                    <b class="logo-icon ps-2">
                        <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                        <!-- Dark Logo icon -->
                        <img
                            src="{{ asset('assets/images/logo-icon.png') }}"
                            alt="homepage"
                            class="light-logo"
                            width="25"
                        />
                    </b>
                    <!--End Logo icon -->
                    <!-- Logo text -->
                    <span class="logo-text ms-2">
                <!-- dark Logo text -->
                <img
                    src="{{ asset('assets/images/logo-text.png') }}"
                    alt="homepage"
                    class="light-logo" style="background: white; padding: 10px"
                />
              </span>
                    <!-- Logo icon -->
                    <!-- <b class="logo-icon"> -->
                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                    <!-- Dark Logo icon -->
                    <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

                    <!-- </b> -->
                    <!--End Logo icon -->
                </a>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Toggle which is visible on mobile only -->
                <!-- ============================================================== -->
                <a
                    class="nav-toggler waves-effect waves-light d-block d-md-none"
                    href="javascript:void(0)"
                ><i class="ti-menu ti-close"></i
                    ></a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <div
                class="navbar-collapse collapse"
                id="navbarSupportedContent"
                data-navbarbg="skin5"
            >
                <!-- ============================================================== -->
                <!-- toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav float-start me-auto">
                    <li class="nav-item d-none d-lg-block">
                        <a
                            class="nav-link sidebartoggler waves-effect waves-light"
                            href="javascript:void(0)"
                            data-sidebartype="mini-sidebar"
                        ><i class="mdi mdi-menu font-24"></i
                            ></a>
                    </li>
                    <!-- ============================================================== -->
                    <!-- create new -->
                    <!-- ============================================================== -->
                    <li class="nav-item dropdown">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                  <span class="d-none d-md-block"
                  >Shortcuts <i class="fa fa-angle-down"></i
                      ></span>
                            <span class="d-block d-md-none"
                            ><i class="fa fa-plus"></i
                                ></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="{{ route('admin-campaign-add') }}"> Add Campaign</a></li>
                            <li><a class="dropdown-item availability-helper" href="#">Availability Helper</a></li>
                            <li>
                                <hr class="dropdown-divider"/>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </li>
                    <!-- ============================================================== -->
                    <!-- Search -->
                    <!-- ============================================================== -->
{{--                    <li class="nav-item search-box">--}}
{{--                        <a--}}
{{--                            class="nav-link waves-effect waves-dark"--}}
{{--                            href="javascript:void(0)"--}}
{{--                        ><i class="mdi mdi-magnify fs-4"></i--}}
{{--                            ></a>--}}
{{--                        <form class="app-search position-absolute">--}}
{{--                            <input--}}
{{--                                type="text"--}}
{{--                                class="form-control"--}}
{{--                                placeholder="Search &amp; enter"--}}
{{--                            />--}}
{{--                            <a class="srh-btn"><i class="mdi mdi-window-close"></i></a>--}}
{{--                        </form>--}}
{{--                    </li>--}}
                </ul>
                <!-- ============================================================== -->
                <!-- Right side toggle and nav items -->
                <!-- ============================================================== -->
                <ul class="navbar-nav float-end">
                    <!-- ============================================================== -->
                    <!-- Comment -->
                    <!-- ============================================================== -->
{{--                    <li class="nav-item dropdown">--}}
{{--                        <a--}}
{{--                            class="nav-link dropdown-toggle"--}}
{{--                            href="#"--}}
{{--                            id="navbarDropdown"--}}
{{--                            role="button"--}}
{{--                            data-bs-toggle="dropdown"--}}
{{--                            aria-expanded="false"--}}
{{--                        >--}}
{{--                            <i class="mdi mdi-bell font-24"></i>--}}
{{--                        </a>--}}
{{--                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--}}
{{--                            <li><a class="dropdown-item" href="#">Action</a></li>--}}
{{--                            <li><a class="dropdown-item" href="#">Another action</a></li>--}}
{{--                            <li>--}}
{{--                                <hr class="dropdown-divider"/>--}}
{{--                            </li>--}}
{{--                            <li>--}}
{{--                                <a class="dropdown-item" href="#">Something else here</a>--}}
{{--                            </li>--}}
{{--                        </ul>--}}
{{--                    </li>--}}
                    <!-- ============================================================== -->
                    <!-- End Comment -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <li class="nav-item dropdown">
                        <a class=" nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic " href="#"
                            id="navbarDropdown"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false" >
                            <img
                                src="{{ asset('assets/images/users/1.jpg') }}"
                                alt="user"
                                class="rounded-circle"
                                width="31"
                            />
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end user-dd animated"
                            aria-labelledby="navbarDropdown" >
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{ route('logout') }}"
                            ><i class="fa fa-power-off me-1 ms-1"></i> Logout</a
                            >
                            <div class="dropdown-divider"></div>

                        </ul>
                    </li>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                </ul>
            </div>
        </nav>
    </header>

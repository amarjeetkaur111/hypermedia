<!DOCTYPE html>
<html dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="robots" content="noindex,nofollow"/>
    <title>HM AOS Login</title>
    <!-- Favicon icon -->
    <link
        rel="icon"
        type="image/png"
        sizes="16x16"
        href="{{ asset('assets/images/favicon.png') }}"
    />
    <!-- Custom CSS -->
    <link href="{{ asset('dist/css/style.min.css') }}" rel="stylesheet"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="main-wrapper">
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
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Login box.scss -->
    <!-- ============================================================== -->
    <div
        class="
          auth-wrapper
          d-flex
          no-block
          justify-content-center
          align-items-center
          bg-dark
        " style="height: 100vh;"
    >
        <div class="auth-box bg-dark  border-secondary">
            <div id="loginform" style=" border: 5px solid #f3811f;    background: white;
    padding: 20px;
    border-radius: 10px;">
                <div class="text-center pt-3 pb-3">
                    <span class="db"><img src="{{ asset('assets/Hypermedia logo-02 (1).svg') }}" alt="logo"/></span>
                </div>
                @if(\Illuminate\Support\Facades\Session::has('msg'))
                    <div
                        class="alert alert-{{ \Illuminate\Support\Facades\Session::has('class') ? \Illuminate\Support\Facades\Session::get('class') : 'default' }}">
                        <strong>{{ \Illuminate\Support\Facades\Session::get('msg') }}</strong>
                    </div>
            @endif
            <!-- Form -->
                <form
                    class="form-horizontal mt-3"
                    id="loginform"
                    action="{{ route('login') }}" method="post"
                >
                    @csrf
                    <div class="row pb-4">
                        <div class="col-12">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                      <span
                          class="input-group-text  text-white h-100"
                          id="basic-addon1" style="background: linear-gradient(#f3811f, #ffc50b); "
                      ><i class="mdi mdi-account fs-4"></i
                          ></span>
                                </div>
                                <input
                                    type="email"
                                    class="form-control form-control-lg"
                                    placeholder="Email"
                                    aria-label="Email"
                                    aria-describedby="basic-addon1"
                                    required=""
                                    name="email"
                                />
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                      <span
                          class="input-group-text text-white h-100"
                          id="basic-addon2" style="background: linear-gradient(#f3811f, #ffc50b); "
                      ><i class="mdi mdi-lock fs-4"></i
                          ></span>
                                </div>
                                <input
                                    type="password"
                                    class="form-control form-control-lg"
                                    placeholder="Password"
                                    aria-label="Password"
                                    aria-describedby="basic-addon1"
                                    required=""
                                    name="password"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="row border-top border-secondary">
                        <div class="col-12">
                            <div class="form-group">
                                <div class="pt-3">
                                    {{--                                    <button--}}
                                    {{--                                        class="btn btn-info"--}}
                                    {{--                                        id="to-recover"--}}
                                    {{--                                        type="button"--}}
                                    {{--                                    >--}}
                                    {{--                                        <i class="mdi mdi-lock fs-4 me-1"></i> Lost password?--}}
                                    {{--                                    </button>--}}
                                    <button
                                        class="btn  float-end text-white"
                                        style="background-color: #0099b0;    border-color: #004f6d;"
                                        type="submit"
                                    >
                                        Login
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Login box.scss -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper scss in scafholding.scss -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper scss in scafholding.scss -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Right Sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Right Sidebar -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- All Required js -->
<!-- ============================================================== -->
<script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
<!-- ============================================================== -->
<!-- This page plugin js -->
<!-- ============================================================== -->
<script>
    $(".preloader").fadeOut();
    // ==============================================================
    // Login and Recover Password
    // ==============================================================
    $("#to-recover").on("click", function () {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });
    $("#to-login").click(function () {
        $("#recoverform").hide();
        $("#loginform").fadeIn();
    });
</script>
</body>
</html>

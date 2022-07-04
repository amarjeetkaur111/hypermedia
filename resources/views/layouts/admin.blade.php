<!doctype html>
<html class="fixed">

<head>
    @include('includes.admin.header')
    <div class="inner-wrapper">
        @include('includes.admin.sidebar')
        @yield('content')
    </div>
    @include('includes.admin.right-sidebar')
    @include('includes.admin.footer')
	</body>
    @stack('custom-scripts')
</html>
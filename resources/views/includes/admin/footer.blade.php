{{--<footer class="footer text-center">--}}
{{--    All Rights Reserved by Hypermedia. Designed and Developed by--}}
{{--    <a href="https://www.rayqube.com">Rayqube</a>.--}}
{{--</footer>--}}
<!-- ============================================================== -->
<!-- End footer -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js') }}"></script>
<script src="{{ asset('assets/extra-libs/sparkline/sparkline.js') }}"></script>
<!--Wave Effects -->
<script src="{{ asset('dist/js/waves.js') }}"></script>
<!--Menu sidebar -->
<script src="{{ asset('dist/js/sidebarmenu.js') }}"></script>
<!--Custom JavaScript -->
<script src="{{ asset('dist/js/custom.min.js') }}"></script>
<!--This page JavaScript -->
<script src="{{ asset('assets/extra-libs/DataTables/datatables.min.js') }}"></script>
<!-- Charts js Files -->
<script src={{ asset("assets/libs/flot/excanvas.js") }}></script>
<script src={{ asset("assets/libs/flot/jquery.flot.js") }}></script>
<script src={{ asset("assets/libs/flot/jquery.flot.pie.js") }}></script>
<script src={{ asset("assets/libs/flot/jquery.flot.time.js") }}></script>
<script src={{ asset("assets/libs/flot/jquery.flot.stack.js") }}></script>
<script src={{ asset("assets/libs/flot/jquery.flot.crosshair.js") }}></script>
<script src={{ asset("assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js") }}></script>
<script src={{ asset("dist/js/pages/chart/chart-page-init.js") }}></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    })
var jc_avail;
    $(function(){
        $('.availability-helper').on('click',function(e){
            e.preventDefault();
            jc_avail = $.confirm({
                animateFromElement: true,
                title: 'Availability Header',
                content: 'url:{{ route('admin-assets-availability-helper') }}',
                columnClass: 'medium',
                onContentReady: function(){
                    $content = this.$content;
                    $content.find('#asset-select').on('change',function(){
                        $.ajax({
                            url: '{{ route('admin-assets-availability-helper-post') }}/'+$(this).val(),
                            method: 'post',
                            beforeSend: function() {
                                jc_avail.showLoading(false)
                            },
                            success:function(response){
                                $content.find('.table-class').html(response)
                            },error:function(xhr){
                                console.log(xhr)
                            },complete(){
                                jc_avail.hideLoading(true)
                            }
                        })
                    })
                },
                buttons: {
                    Close: function () {
                        return;
                    },
                },
            });
        });


    })
</script>

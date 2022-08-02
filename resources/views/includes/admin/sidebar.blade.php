@php
    $user = Auth::user();
@endphp
<aside class="left-sidebar" data-sidebarbg="skin5" style="overflow-y:auto; padding-top: 40px;">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="pt-4">
                <li class="sidebar-item">
                    <a
                        class="sidebar-link waves-effect waves-dark sidebar-link"
                        href="{{ route('admin-index') }}"
                        aria-expanded="false"
                    ><i class="mdi mdi-view-dashboard"></i
                        ><span class="hide-menu">Dashboard</span></a
                    >
                </li>
                @if($user->can('admin-user-manage'))
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="mdi mdi-face"></i
                        ><span class="hide-menu">User management </span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a href="{{ route('admin-users-index') }}" class="sidebar-link"
                            ><i class="mdi mdi-emoticon"></i
                                ><span class="hide-menu"> Users </span></a
                            >
                        </li>
                        <li class="sidebar-item">
                            <a href="{{ route('admin-roles-index') }}" class="sidebar-link"
                            ><i class="mdi mdi-emoticon-cool"></i
                                ><span class="hide-menu"> Roles </span></a
                            >
                        </li>
                        <li class="sidebar-item">
                            <a href="{{ route('admin-permissions-index') }}" class="sidebar-link"
                            ><i class="mdi mdi-emoticon-cool"></i
                                ><span class="hide-menu"> Permissions </span></a
                            >
                        </li>
                    </ul>
                </li>
                @endif
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="mdi mdi-airplay"></i
                        ><span class="hide-menu">Campaign</span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-campaign-index') }}" ><i class="fas fa-diagnoses"></i><span class="hide-menu">Campaign Listing</span></a>
                        </li>
                        @if($user->can('admin-asset-list'))
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-assets-index') }}" ><i class="fas fa-microchip"></i><span class="hide-menu">Assets</span></a>
                        </li>
                        @endif
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-assets-network-index') }}" ><i class="fas fa-parachute-box"></i><span class="hide-menu">Assets Network</span></a>
                        </li>
                    </ul>
                </li>
{{--                <li class="sidebar-item">--}}
{{--                    <a--}}
{{--                        class="sidebar-link waves-effect waves-dark sidebar-link"--}}
{{--                        href="{{ route('admin-assets-index') }}"--}}
{{--                        aria-expanded="false"--}}
{{--                    ><i class="fas fas fa-microchip"></i--}}
{{--                        ><span class="hide-menu">Assets</span></a--}}
{{--                    >--}}
{{--                </li>--}}
{{--                <li class="sidebar-item">--}}
{{--                    <a--}}
{{--                        class="sidebar-link waves-effect waves-dark sidebar-link"--}}
{{--                        href="{{ route('admin-assets-network-index') }}"--}}
{{--                        aria-expanded="false"--}}
{{--                    ><i class="fas fa-parachute-box"></i--}}
{{--                        ><span class="hide-menu">Assets Network</span></a>--}}
{{--                </li>--}}
{{--                </li>--}}
{{--                <li class="sidebar-item">--}}
{{--                    <a--}}
{{--                        class="sidebar-link waves-effect waves-dark sidebar-link"--}}
{{--                        href="{{ route('admin-campaign-index') }}"--}}
{{--                        aria-expanded="false"--}}
{{--                    ><i class="fas fas fa-diagnoses"></i--}}
{{--                        ><span class="hide-menu">Campaign Listing</span></a--}}
{{--                    >--}}
{{--                </li>--}}
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="fas fa-cog"></i
                        ><span class="hide-menu">Production</span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-campaign-installation-index') }}" ><i class="mdi mdi-brightness-7"></i><span class="hide-menu">Campaign Installation</span></a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="mdi mdi-camera-party-mode"></i
                        ><span class="hide-menu">Campaign Photos</span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-campaign-monitoring-index') }}" ><i class="mdi mdi-laptop"></i><span class="hide-menu">Campaign Proof Pictures</span></a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-defect-tracking-index') }}" ><i class="mdi mdi-camera-off"></i><span class="hide-menu">Defect Tracking</span></a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="fas fa-file-pdf"></i
                        ><span class="hide-menu">Reports</span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="#" ><i class="mdi mdi-relative-scale"></i><span class="hide-menu">Clients</span></a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a
                        class="sidebar-link has-arrow waves-effect waves-dark"
                        href="javascript:void(0)"
                        aria-expanded="false"
                    ><i class="fas fa-cogs"></i
                        ><span class="hide-menu">Master</span></a
                    >
                    <ul aria-expanded="false" class="collapse first-level">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-clients-index') }}" ><i class="mdi mdi-relative-scale"></i><span class="hide-menu">Clients</span></a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{ route('admin-locations-index') }}"><i class="fas fa-map-marker-alt"></i><span class="hide-menu">Locations</span></a>
                        </li>
                        <li class="sidebar-item">
                            <a href="{{ route('admin-contractor-index') }}" class="sidebar-link" ><i class="fas fa-dolly-flatbed"></i><span class="hide-menu"> Contractor </span></a>
                        </li>
                        <li class="sidebar-item">
                            <a href="{{ route('admin-departments-index') }}" class="sidebar-link" ><i class="fas fa-bars"></i><span class="hide-menu"> Departments </span></a>
                        </li>
                        <li class="sidebar-item">
                            <a href="{{ route('admin-teams-index') }}" class="sidebar-link" ><i class="fas fa-users"></i><span class="hide-menu"> Teams </span></a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a
                        class="sidebar-link waves-effect waves-dark sidebar-link availability-helper"
                        href="#"
                        aria-expanded="false"
                    ><i class="mdi mdi-calendar-multiple"></i
                        ><span class="hide-menu">Availability Helper</span></a
                    >
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>

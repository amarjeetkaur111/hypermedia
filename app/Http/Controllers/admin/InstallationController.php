<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\CampaignBucket;
use App\Models\Campaigns;
use Carbon\Carbon;
use Illuminate\Http\Request;
use DataTables;

class InstallationController extends Controller
{
    public function checkDate($start, $end)
    {
        if (now()->startOfDay()->lt($start)) {
            return '<label class="label label-primary">Pending</label>';
        } else if (now()->endOfDay()->gt($end)) {
            return '<label class="label label-danger">Done</label>';
        }
        return '<label class="label label-success">Current</label>';
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Campaigns::with('buckets.locations')->select('*');
            return DataTables::eloquent($data)
                ->editColumn('timer', function ($row) {
                    $start_date = Carbon::parse($row->start_date);
                    $end_date = Carbon::parse($row->end_date);
                    return $this->checkDate($start_date, $end_date);
                })
                ->editColumn('type', function ($row) {
                    return $row->status;
                })
                ->addColumn('start_date', function ($row) {
                    $start = Carbon::parse($row->start_date)->format('d/m/Y');
                    $end = Carbon::parse($row->end_date)->format('d/m/Y');
                    return $start . ' to ' . $end;
                })
                ->addColumn('locations', function ($row) {
                    $location = '<ol>';
                    foreach ($row->buckets as $b) {
                        if ($b->locations) {
                            $location .= '<li>' . $b->locations->name . '</li>';
                        }
                    }
                    $location .= '</ol>';
                    $html = '<button data-list-loc="' . $location . '" class="btn btn-primary btn-sm location-btn" >Locations</button>';
                    return $html;
                })
                ->addColumn('photos', function ($row) {
                    return '<button class="btn btn-sm btn-primary photos_btn" dt-data-id="' . route('admin-campaign-campaign-photos', ['id' => $row->id]) . '">Photos</button>';
                })
                ->addColumn('permits', function ($row) {
                    return '<button class="btn btn-sm btn-primary permits_btn" dt-add-href="' . route('admin-campaign-campaign-permits-add', ['id' => $row->id]) . '" dt-data-id="' . route('admin-campaign-campaign-permits', ['id' => $row->id]) . '">Permits</button>';
                })
                ->addColumn('assets', function ($row) {
                    return '<button class="btn btn-sm btn-primary asset_btn" dt-data-id="' . route('admin-campaign-installation-assets', ['id' => $row->id]) . '">Assets</button>';
                })
                ->addColumn('action', function ($row) {
                    return '';
                })
                ->rawColumns(['action', 'locations', 'photos', 'permits', 'timer', 'assets'])
                ->make(true);
        }
        return view('pages.campaign.installation.index');
    }

    public function getCampaignAssets($id)
    {
        $data = CampaignBucket::with('assets')->where('campaign_id', $id)->get();
        return view('pages.campaign.installation.inner.assets', compact('data'))->render();
    }
}

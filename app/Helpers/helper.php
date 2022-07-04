<?php
function getFormattedTime($seconds)
{
    $seconds = (int)$seconds;
    $days = floor($seconds / 86400);
    $hours = floor(($seconds - ($days * 86400)) / 3600);
    $minutes = floor(($seconds / 60) % 60);
    return str_pad($days, 2, '0', STR_PAD_LEFT) . ' ' . str_pad($hours, 2, '0', STR_PAD_LEFT) . ':' . str_pad($minutes, 2, '0', STR_PAD_LEFT);
}

function getFormattedTimeHuman($seconds)
{
    $seconds = (int)$seconds;
    $days = floor($seconds / 86400);
    $hours = floor(($seconds - ($days * 86400)) / 3600);
    $minutes = floor(($seconds / 60) % 60);
    $return = '';
    if($days){
        $return .= $days . ' days, ';
    }
    if($hours){
        $return .=   $hours . ' hours, ';
    }
    return $return. $minutes . ' minutes';
}

function getAssetAndNetwork($select = [])
{
    $assets = \App\Models\Assets::select('id', 'name', 'ref_no')->get();
    $networks = \App\Models\AssetNetwork::select('id', 'name')->get();
    $options = '<option selected disabled>Select Asset</option>';
    if ($networks->count()) {
        $options .= '<optgroup label="Networks">';
        foreach ($networks as $n) {
            if (count($select) && $select[0] == 'network') {
                $options .= '<option value="network:' . $n->id . '" '.($n->id == $select[1] ? 'selected="selected"' : '') . ' >' . $n->name . '</option>';
            } else {
                $options .= '<option value="network:' . $n->id . '">' . $n->name . '</option>';
            }
        }
        $options .= '</optgroup>';
    }
    if ($assets->count()) {
        $options .= '<optgroup label="Assets">';
        foreach ($assets as $a) {
            if (count($select) && $select[0] == 'asset') {
                $options .= '<option value="asset:' . $a->id . '" '.($a->id == $select[1] ? 'selected="selected"' : '') . ' >' . $a->name . '</option>';
            } else {
                $options .= '<option value="asset:' . $a->id . '">' . $a->ref_no . ' : ' . $a->name . '</option>';
            }
        }
        $options .= '</optgroup>';
    }
    return $options;
}


function changeAssetStatus($id,$status = 'Booked'){
    \App\Models\AssetStatus::where('asset_id',$id)->delete();
    $asset = new \App\Models\AssetStatus;
    $asset->asset_id = $id;
    $asset->status = $status;
    return $asset->save();
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class LastfmController extends Controller
{
    public $api_key = '62d9e7b089af2d553f121a7ef849bc98';
    public $url = 'https://ws.audioscrobbler.com/2.0/';

    public function albumSearch(Request $request) {
        $response = Http::get($this->url, [
            'method' => 'album.search',
            'album' => $request->album,
            'api_key' => $this->api_key,
            'format' => 'json'
        ]);

        return response()->json([
            'album' => $response->json('results.albummatches.album')
        ]);
    }

    public function albumGetInfo(Request $request) {
        $response = Http::get($this->url, [
            'method' => 'album.getinfo',
            'api_key' => $this->api_key,
            'artist' => $request->artist,
            'album' => $request->album,
            'format' => 'json'
        ]);

        return response()->json([
            'album' => $response->json()
        ]);
    }
}

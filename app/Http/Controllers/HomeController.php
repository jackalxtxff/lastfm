<?php

namespace App\Http\Controllers;

use App\Models\Album;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $paginate = 4;
        $user = Auth::user();

        if ($request->ajax()) {
            $albums = Album::where('user_id', $user->id)
                ->paginate($paginate);

            return response()->json([
                'albums' => $albums,
                'view' => view('albums-list', [
                    'albums' => $albums
                ])->render()
            ]);
        }

        $albums = Album::where('user_id', $user->id)
            ->paginate($paginate);

        return view('index', [
            'user' => $user,
            'albums' => $albums
        ]);
    }
}

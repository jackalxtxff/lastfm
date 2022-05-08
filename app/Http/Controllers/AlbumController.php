<?php

namespace App\Http\Controllers;

use App\Models\Album;
use App\Models\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class AlbumController extends Controller
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('addingForm');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($request->ajax())
        {
            if ($request->image_text == 'true') {
                $errors = Validator::make($request->all(), [
                    'album' => [
                        'required', 'string'
                    ],
                    'artist' => [
                        'required', 'string'
                    ],
                    'description' => [
                    ],
                    'image' => [
                        'required', 'string'
                    ]
                ]);
            } else {
                $errors = Validator::make($request->all(), [
                    'album' => [
                        'required', 'string'
                    ],
                    'artist' => [
                        'required', 'string'
                    ],
                    'description' => [
                    ],
                    'image' => [
                        'required', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'
                    ]
                ]);
            }


            if ($errors->fails()) {
                return response()->json([
                    'artist' => $request->image_text,
                    'errors' => $errors->errors(),
                    'message' => 'Указанные данные недействительны.'
                ], 422);
            }

            if ($request->image_text == 'true') {
                $album = Album::create([
                    'user_id' => Auth::id(),
                    'album' => $request->album,
                    'artist' => $request->artist,
                    'description' => $request->description,
                    'image' => $request->image
                ]);
            } else {
                $local_path = $request->file('image')->store('public/users/'.Auth::id());
                $path = Storage::url($local_path);

                $album = Album::create([
                    'user_id' => Auth::id(),
                    'album' => $request->album,
                    'artist' => $request->artist,
                    'description' => $request->description,
                    'image' => $path
                ]);
            }

            $log = Log::create([
                'album_id' => $album->id,
                'album' => $album->album,
                'artist' => $album->artist,
                'description' => $album->description,
                'image' => $album->image
            ]);


            return response()->json([
                'status' => 'success',
                'message' => 'Альбом добавлен',
                'route' => route('home')
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function show(Album $album)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function edit(Album $album)
    {
        return view('addingForm', [
            'album' => $album
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Album $album)
    {
        if ($request->ajax())
        {
            if ($request->image_text == 'true') {
                $errors = Validator::make($request->all(), [
                    'album' => [
                        'required', 'string'
                    ],
                    'artist' => [
                        'required', 'string'
                    ],
                    'description' => [
                    ],
                    'image' => [
                        'required', 'string'
                    ]
                ]);
            } else {
                $errors = Validator::make($request->all(), [
                    'album' => [
                        'required', 'string'
                    ],
                    'artist' => [
                        'required', 'string'
                    ],
                    'description' => [
                    ],
                    'image' => [
                        'required', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'
                    ]
                ]);
            }

            if ($errors->fails()) {
                return response()->json([
                    'artist' => $request->artist,
                    'errors' => $errors->errors(),
                    'message' => 'Указанные данные недействительны.'
                ], 422);
            }

            if ($request->image_text == 'true') {
                $album->update([
                    'album' => $request->album,
                    'artist' => $request->artist,
                    'description' => $request->description,
                    'image' => $request->image
                ]);
            } else {
                $local_path = $request->file('image')->store('public/users/'.Auth::id());
                $path = Storage::url($local_path);

                $album->update([
                    'album' => $request->album,
                    'artist' => $request->artist,
                    'description' => $request->description,
                    'image' => $path
                ]);
            }

            $log = Log::create([
                'album_id' => $album->id,
                'album' => $album->album,
                'artist' => $album->artist,
                'description' => $album->description,
                'image' => $album->image
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Альбом добавлен',
                'route' => route('home')
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function destroy(Album $album)
    {
        $paginate = 4;

        if ($album->delete()) {
            $albums = Album::where('user_id', Auth::id())
                ->paginate($paginate);
            return response()->json([
                'status' => 'success',
                'message' => 'Альбом удален!',
                'view' => view('albums-list', [
                    'albums' => $albums
                ])->render()
            ]);
        }
        else {
            return response()->json([
                'status' => 'error',
                'message' => 'Ошибка при удалении альбома'
            ], 404);
        }
    }
}

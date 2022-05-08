@extends('layouts.app')

@section('content')

    <div class="album-list">
        @include('albums-list')
    </div>

{{--            <div class="card mb-3 bg-light">--}}
{{--                <div class="d-flex flex-row">--}}
{{--                    <div>--}}
{{--                        <img src="https://lastfm.freetls.fastly.net/i/u/174s/6e92fe0cff920f671ee5eb4e2f0f4e59.jpg"--}}
{{--                             height="150" class="rounded-start" alt="...">--}}
{{--                    </div>--}}
{{--                    <div>--}}
{{--                        <div class="card-body">--}}
{{--                            <h5 class="card-title">Правило</h5>--}}
{{--                            <p class="card-text">PHARAOH</p>--}}
{{--                            <p class="card-text"><small class="text-muted">Изменить</small></p>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}

@endsection

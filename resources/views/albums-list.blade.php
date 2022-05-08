@foreach($albums as $album)
    <div class="card mb-3 bg-light">
        <div class="d-flex flex-row">
            <div>
                <img src="{{ $album->image }}"
                     height="174" width="174" class="rounded-start" alt="...">
            </div>
            <div>
                <div class="card-body">
                    <h5 class="card-title">{{ $album->album }}</h5>
                    <p class="card-text">{{ $album->artist }}</p>
                    <p class="card-text"><small class="text-muted"><a class="text-muted text-decoration-none me-2" href="{{route('albums.edit', $album->id)}}">Изменить</a><a
                                data-href="{{route('albums.destroy', $album->id)}}" class="text-muted text-decoration-none album-destroy" data-method="DELETE">Удалить</a></small></p>
                </div>
            </div>
        </div>
    </div>
@endforeach

@if(count($albums)<1)
    <p class="mb-0 text-muted text-center">Пусто</p>
@endif

<div class="d-flex justify-content-center">
    {!! $albums->links() !!}
</div>

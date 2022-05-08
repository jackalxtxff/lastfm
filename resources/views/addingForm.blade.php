@extends('layouts.app')

@section('content')

    <div class="rounded bg-light p-3 border">
        <form class="row g-3">
            <div class="col-12">
                <label for="album" class="form-label">Наименование альбома</label>
                <input type="text" class="form-control" id="album" name="album"
                       data-uri="{{route('albumSearch')}}"
                       value="{{request()->routeIs('albums.edit') ? $album->album : ''}}" data-method="GET" required>
                <div class="invalid-feedback" for="album">
                    Looks good!
                </div>
            </div>
            <div class="col-12">
                <div class="artist-group d-block">
                    <label for="artist" class="form-label">Исполнитель</label>
                    <input type="text" class="form-control" id="artist" name="artist"
                           value="{{request()->routeIs('albums.edit') ? $album->artist : ''}}">
                    <div class="invalid-feedback" for="artist">
                        Looks good!
                    </div>
                </div>
                <div class="artist-list-group d-none">
                    <label for="artist-list" class="form-label">Исполнитель</label>
                    <select class="form-select form-control" aria-label="Default select example" id="artist-list"
                            name="artist" data-uri="{{route('albumGetInfo')}}" data-method="GET">
                        <option value="" selected>Введите наименование альбома</option>
                    </select>
                    <div class="invalid-feedback" for="artist">
                        Looks good!
                    </div>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="artist-checkbox"
                           name="artist-checkbox">
                    <label class="form-check-label" for="artist-checkbox">
                        Выбрать из списка
                    </label>
                </div>
            </div>
            <div class="col-12">
                <label for="description" class="form-label">Описание</label>
                <textarea type="text" class="form-control" id="description" name="description"
                          aria-describedby="validationServer03Feedback"
                          row="3">{{request()->routeIs('albums.edit') ? $album->description : ''}}</textarea>
                <div class="invalid-feedback" for="description">
                    Looks good!
                </div>
            </div>
            <div class="col-12">
                <label class="form-label">Обложка</label>
                <div class="d-flex align-items-end">
                    <div class="img-group border rounded bg-white me-3" style="height: 174px; width: 174px">
                        <img class="{{request()->routeIs('albums.edit') ? 'd-block' : 'd-none'}} rounded"
                             src="{{request()->routeIs('albums.edit') ? $album->image : ''}}" height="174" width="174" alt="">
                    </div>
                    <div class="input-group" style="width: auto">
                        <input type="file" class="form-control" name="image" id="inputGroupFile02" accept="image/gif, image/jpeg, image/png">
                        <label class="input-group-text" for="inputGroupFile02">Upload</label>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit"
                        id="{{request()->routeIs('albums.edit') ? 'album-update' : 'album-add'}}"
                        data-uri="{{request()->routeIs('albums.edit') ? route('albums.update', $album->id) : route('albums.store')}}"
                        data-method="{{request()->routeIs('albums.edit') ? 'PUT' : 'POST'}}">Submit form
                </button>
            </div>
        </form>
    </div>
@endsection

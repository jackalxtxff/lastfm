import { csrfToken } from "./app";

$('#album').focusout(function () {
    let uri = $(this).data('uri');
    let method = $(this).data('method');
    let value = $(this).val();
    // uri = uri + `/${value}`;

    $.ajax({
        url: `${uri}`,
        type: method,
        data: {
            album: value
        },
        success: (data) => {
            console.log(data);
            $('#artist-list').find('option').remove();
            $('#artist-checkbox').attr('checked', 'checked');
            $('.artist-group').removeClass('d-block').addClass('d-none');
            $('.artist-list-group').removeClass('d-none').addClass('d-block');

            let countAlbums = 0, index = 0;
            $.each(data.album, function(el) {
                if (this.name === value) {
                    if (this.image[1]['#text'] !== '') {
                        $('#artist-list').append($("<option />").val(this.artist).text(this.artist));
                        if (index === 0) {
                            albumGetInfo($('#artist-list'));
                            $('img').attr('src', this.image[2]['#text']).removeClass('d-none');
                            index++;
                        }
                        countAlbums++;
                    }
                }
            });
            if (countAlbums === 0) {
                $('#artist-list').append($("<option />").val('').text('Введите наименование альбома'));
            }
        },
        error: (data) => {
            console.log(data);
        }
    });
});

$('#artist-list').change(function () {
    albumGetInfo($(this));
})

function albumGetInfo (el) {
    let uri = $(el).data('uri');
    let method = $(el).data('method');
    let artist = $(el).val();
    let album = $('#album').val();

    $.ajax({
        url: `${uri}`,
        type: method,
        data: {
            album: album,
            artist: artist
        },
        success: (data) => {
            console.log(data);
            $('img').attr('src', data.album.album.image[2]['#text']).removeClass('d-none');
            $('#description').val(typeof data.album.album.wiki === 'undefined' ? '' : data.album.album.wiki['summary']);
        },
        error: (data) => {
            console.log(data);
        }
    });
}

$('#artist-checkbox').change(function () {
    if ($(this).is(':checked')) {
        $('.artist-group').removeClass('d-block').addClass('d-none');
        $('.artist-list-group').removeClass('d-none').addClass('d-block');
    }
    else {
        $('.artist-list-group').removeClass('d-block').addClass('d-none');
        $('.artist-group').removeClass('d-none').addClass('d-block');
    }
})

$('#album-add').click(function (e) {
    e.preventDefault()
    let uri = $(this).data('uri');
    let method = $(this).data('method');
    let formData = new FormData();
    formData.append('album', $('#album').val());
    formData.append('artist', $('#artist-checkbox').is(':checked') ? $('#artist-list').val() : $('#artist').val());
    formData.append('description', $('#description').val());
    formData.append('image', $('input[name="image"]').val() === '' && $('img').attr('src') !== '' ? $('img').attr('src') : $('input[name="image"]')[0].files[0]);
    formData.append('image_text', $('input[name="image"]').val() === '' && $('img').attr('src') !== '' ? true : false)
    formData.append('_method', method);

    // let sendData = {
    //     album: $('#album').val(),
    //     artist: $('#artist-checkbox').is(':checked') ? $('#artist-list').val() : $('#artist').val(),
    //     description: $('#description').val(),
    //     image: $('img').attr('src')
    // };

    $.ajax({
        url: `${uri}`,
        type: method,
        data: formData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': csrfToken
        },
        success: (data) => {
            console.log(data);
            setTimeout(()=>{
                window.location.replace(data.route);
            }, 1000)
        },
        error: (data) => {
            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').removeClass('d-block');
            let response = data.responseJSON;
            console.log(response);
            $.each(response.errors, function (key, value) {
                $(`.form-control[name="${key}"]`).addClass('is-invalid');
                $(`.invalid-feedback[for="${key}"]`).text(value).addClass('d-block');
            });
        }
    });
});

$('#album-update').click(function (e) {
    e.preventDefault()
    let uri = $(this).data('uri');
    let method = $(this).data('method');
    let formData = new FormData();
    formData.append('album', $('#album').val());
    formData.append('artist', $('#artist-checkbox').is(':checked') ? $('#artist-list').val() : $('#artist').val());
    formData.append('description', $('#description').val());
    formData.append('image', $('input[name="image"]').val() === '' && $('img').attr('src') !== '' ? $('img').attr('src') : $('input[name="image"]')[0].files[0]);
    formData.append('image_text', $('input[name="image"]').val() === '' && $('img').attr('src') !== '' ? true : false)
    formData.append('_method', 'PUT');

    // let sendData = {
    //     album: $('#album').val(),
    //     artist: $('#artist-checkbox').is(':checked') ? $('#artist-list').val() : $('#artist').val(),
    //     description: $('#description').val(),
    //     image: $('img').attr('src')
    // };

    $.ajax({
        url: `${uri}`,
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': csrfToken
        },
        success: (data) => {
            console.log(data);
            setTimeout(()=>{
                window.location.replace(data.route);
            }, 1000)
        },
        error: (data) => {
            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').removeClass('d-block');
            let response = data.responseJSON;
            console.log(response);
            $.each(response.errors, function (key, value) {
                $(`.form-control[name="${key}"]`).addClass('is-invalid');
                $(`.invalid-feedback[for="${key}"]`).text(value).addClass('d-block');
            });
        }
    });
});

$('.album-list').on('click', '.album-destroy', function (e) {
    e.preventDefault()
    let uri = $(this).data('href');
    let method = $(this).data('method');

    $.ajax({
        url: `${uri}`,
        type: method,
        headers: {
            'X-CSRF-TOKEN': csrfToken
        },
        success: (data) => {
            console.log(data);
            $('.album-list').html(data.view);
        },
        error: (data) => {
            console.log(data);
        }
    });
});

$('input[name="image"]').change(function () {
    let file = this.files[0];
    let ext = "не определилось";
    let parts = file.name.split('.');
    if (parts.length > 1) ext = parts.pop();
    let types = ['jpeg', 'png', 'jpg', 'gif'];
    if (types.includes(ext)) {
        if (this.files && this.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $('img').attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    }
    else {
        $('input[name="image"]').val(null);
    }
    $('img').removeClass('d-none');
});

// $('.album-list').on('click', ' .pagination a', function(e) {
//     e.preventDefault();
//     $('.pagination li').removeClass('active');
//     $(this).parent('li').addClass('active');
//     let page = $(this).attr('href').split('page=')[1];
//     ajaxLoad(page);
// });
//
// function




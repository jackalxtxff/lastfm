<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    protected $table = 'logs';
    protected $guarded = false;

    public function album() {
        return $this->belongsTo(Album::class, 'album_id', 'id');
    }
}

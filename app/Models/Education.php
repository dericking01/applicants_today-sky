<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Education extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'educations';
    protected $fillable = ['applicant_id', 'institution', 'degree', 'year'];

    public function applicant()
    {
        return $this->belongsTo(Applicant::class);
    }
}

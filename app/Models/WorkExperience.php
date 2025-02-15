<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class WorkExperience extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['applicant_id', 'company', 'role', 'duration'];

    public function applicant()
    {
        return $this->belongsTo(Applicant::class);
    }
}

<?php

use App\Http\Controllers\ApplicantController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect()->route('applicants');
});

Route::get('applicants', [ApplicantController::class, 'show'])->name('applicants');
Route::put('update/applicant/{id}', [ApplicantController::class, 'update'])->name('applicant.update');


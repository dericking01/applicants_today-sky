<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use Illuminate\Http\Request;

class ApplicantController extends Controller
{
    public function show()
    {
        // Fetch all applicants with their educations, work experiences, and skills
        $applicants = Applicant::with(['educations', 'workExperiences', 'skills'])
                                ->latest()
                                ->get();
        // dd($applicants);
        return view('applicants', compact('applicants'));
    }
}

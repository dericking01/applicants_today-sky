<?php

namespace App\Http\Controllers;

use App\Models\Applicant;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

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

    public function update(Request $request, $id)
    {
        $applicant = Applicant::findOrFail($id);

        // Validation rules
        $request->validate([
            'full_name' => 'required|string|max:255',
            'email' => [
                'required',
                'email',
                Rule::unique('applicants')->ignore($applicant->id),
            ],
            'phone_number' => [
                'required',
                'string',
                Rule::unique('applicants')->ignore($applicant->id),
            ],
        ]);

        try {
            $applicant->full_name = $request->full_name;
            $applicant->phone_number = $request->phone_number;
            $applicant->email = $request->email;
            $applicant->save();

            return redirect()->route('applicants')->with('success', 'Applicant information updated successfully.');
        } catch (\Exception $e) {
            return redirect()->route('applicants')->with('error', 'Failed to update applicant information.');
        }
    }
}

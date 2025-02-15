@extends('layouts.app')

@section('content')
<div class="container my-5">
    <h1 class="text-center mb-4">Applicants List</h1>
    <div id="applicantsList" class="row">
        @foreach ($applicants as $applicant)
            <div class="col-md-6 col-lg-4 mb-4 applicant-card">
                <div class="card h-100">
                    <div class="card-body">
                        <!-- Applicant Name -->
                        <h5 class="card-title applicant-name">{{ $applicant->full_name }}</h5>
                        <!-- Contact Info -->
                        <p class="card-text">
                            <i class="fas fa-envelope"></i> {{ $applicant->email }}<br>
                            <i class="fas fa-phone"></i> {{ $applicant->phone_number }}
                        </p>

                        <!-- Education Section -->
                        <h6 class="section-title">Education</h6>
                        <ul class="list-group list-group-flush">
                            @foreach ($applicant->educations as $education)
                                <li class="list-group-item">
                                    <i class="fas fa-graduation-cap"></i>
                                    {{ $education->degree }} at {{ $education->institution }} ({{ $education->year }})
                                </li>
                            @endforeach
                        </ul>

                        <!-- Work Experience Section -->
                        <h6 class="section-title">Work Experience</h6>
                        <ul class="list-group list-group-flush">
                            @foreach ($applicant->workExperiences as $experience)
                                <li class="list-group-item">
                                    <i class="fas fa-briefcase"></i>
                                    {{ $experience->role }} at {{ $experience->company }} ({{ $experience->duration }})
                                </li>
                            @endforeach
                        </ul>

                        <!-- Skills Section -->
                        <h6 class="section-title">Skills</h6>
                        <div class="d-flex flex-wrap">
                            @foreach ($applicant->skills as $skill)
                                <span class="badge">{{ $skill->skill }}</span>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection



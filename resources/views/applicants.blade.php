@extends('layouts.app')

@section('content')
<div class="container my-5">
    <h1 class="text-center mb-4">Applicants List</h1>

    <!-- Toast Messages -->
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

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

                        <!-- Update Button -->
                        <div class="text-center mt-3">
                            <button class="update-btn" data-bs-toggle="modal" data-bs-target="#editModal{{ $applicant->id }}" data-applicant-id="{{ $applicant->id }}">
                                <i class="fas fa-edit"></i> Update Info
                            </button>
                        </div>
                    </div>
                </div>
            </div>

                <!-- Edit Modal -->
            <div class="modal fade" id="editModal{{ $applicant->id }}" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Update Applicant Info</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="{{ route('applicant.update', ['id' => $applicant->id]) }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')

                                <input type="hidden" id="applicantId" name="applicant_id">

                                <!-- Full Name -->
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="full_name" value="{{ $applicant->full_name }}" required>
                                </div>

                                <!-- Email -->
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="{{ $applicant->email }}" required>
                                </div>

                                <!-- Phone Number -->
                                <div class="mb-3">
                                    <label for="phoneNumber" class="form-label">Phone Number</label>
                                    <input type="text" class="form-control" id="phoneNumber" name="phone_number" value="{{ $applicant->phone_number }}" required>
                                </div>

                                <!-- Education Section -->
                                <h6 class="section-title">Education</h6>
                                <div id="educationFields">
                                    @foreach ($applicant->educations as $education)
                                    <div class="mb-3 p-3 border rounded bg-light">
                                        <input type="text" class="form-control mb-1" value="Institution: {{ $education->institution }}" readonly>
                                        <input type="text" class="form-control mb-1" value="Degree: {{ $education->degree }}" readonly>
                                        <input type="text" class="form-control mb-1" value="Year: {{ $education->year }}" readonly>
                                    </div>
                                    @endforeach
                                </div>

                                <!-- Work Experience Section -->
                                <h6 class="section-title">Work Experience</h6>
                                <div id="workExperiencesFields">
                                    @foreach ($applicant->workExperiences as $workExperience)
                                    <div class="mb-3 p-3 border rounded bg-light">
                                        <input type="text" class="form-control mb-1" value="company: {{ $workExperience->company }}" readonly>
                                        <input type="text" class="form-control mb-1" value="role: {{ $workExperience->role }}" readonly>
                                        <input type="text" class="form-control mb-1" value="duration: {{ $workExperience->duration }}" readonly>
                                    </div>
                                    @endforeach
                                </div>

                                <!-- Skills Section -->
                                <h6 class="section-title">Skills</h6>
                                <div id="skillsFields" class="d-flex flex-wrap gap-2">
                                    @foreach ($applicant->skills as $skill)
                                        <span class="badge bg-success">{{ $skill->skill }}</span>
                                    @endforeach
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-info">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        @endforeach
    </div>
</div>


@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Auto hide alerts after 5 seconds
        setTimeout(function () {
            let alert = document.querySelector('.alert');
            if (alert) {
                alert.classList.remove('show');
                alert.classList.add('fade');
                setTimeout(() => alert.remove(), 200);
            }
        }, 5000);
    });
</script>
@endpush



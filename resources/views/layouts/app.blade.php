<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Applicants List</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome for Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }
            .navbar {
                background-color: #0d6efd;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .navbar-brand {
                color: white !important;
                font-weight: bold;
                font-size: 1.5rem;
            }
            .navbar-brand:hover {
                color: #f8f9fa !important;
            }
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s, box-shadow 0.2s;
                background-color: white;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 12px rgba(0, 0, 0, 0.15);
            }
            .applicant-name {
                color: #0d6efd;
                font-weight: bold;
                font-size: 1.5rem;
            }
            .section-title {
                color: #6c757d;
                font-size: 1.1rem;
                font-weight: 600;
                margin-top: 1rem;
                border-bottom: 2px solid #0d6efd;
                padding-bottom: 0.5rem;
                display: inline-block;
            }
            .list-group-item {
                border: none;
                padding: 0.5rem 1rem;
                background-color: transparent;
            }
            .badge {
                background-color: #0d6efd;
                color: white;
                padding: 0.5rem 0.75rem;
                border-radius: 20px;
                font-size: 0.9rem;
                margin: 0.25rem;
            }
            .footer {
                background-color: #0d6efd;
                color: white;
                padding: 1rem 0;
                margin-top: 2rem;
                text-align: center;
            }
            .footer a {
                color: white;
                text-decoration: none;
            }
            .footer a:hover {
                text-decoration: underline;
            }
            .search-box {
                max-width: 300px;
                margin-left: auto;
            }
            .no-results {
                display: none;
                text-align: center;
                color: #6c757d;
                font-size: 1.2rem;
                margin-top: 2rem;
            }
        </style>
    </head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-users"></i> Applicant Tracker
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
                <!-- Search Bar -->
                <form class="d-flex search-box">
                    <input id="searchInput" class="form-control me-2" type="search" placeholder="Search applicants..." aria-label="Search">
                </form>
            </div>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="content">
        @yield('content')
    </div>

    <!-- No Results Message -->
    <div id="noResults" class="no-results">
        <i class="fas fa-search fa-2x mb-3"></i>
        <p>No applicants found matching your search.</p>
    </div>
</div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p class="mb-0">&copy; 2023 Applicant Tracker. All rights reserved. | <a href="#">Privacy Policy</a></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Search Functionality -->
    <script>
        document.getElementById('searchInput').addEventListener('input', function () {
            const searchQuery = this.value.toLowerCase();
            const applicantCards = document.querySelectorAll('.applicant-card');
            let visibleCards = 0;

            applicantCards.forEach(card => {
                const name = card.querySelector('.applicant-name').textContent.toLowerCase();
                const email = card.querySelector('.card-text').textContent.toLowerCase();
                const skills = card.querySelectorAll('.badge');
                let skillMatch = false;

                skills.forEach(skill => {
                    if (skill.textContent.toLowerCase().includes(searchQuery)) {
                        skillMatch = true;
                    }
                });

                if (name.includes(searchQuery) || email.includes(searchQuery) || skillMatch) {
                    card.style.display = 'block';
                    visibleCards++;
                } else {
                    card.style.display = 'none';
                }
            });

            // Show/hide no results message
            const noResults = document.getElementById('noResults');
            if (visibleCards === 0) {
                noResults.style.display = 'block';
            } else {
                noResults.style.display = 'none';
            }
        });
    </script>
    @stack('scripts')
</body>
</html>

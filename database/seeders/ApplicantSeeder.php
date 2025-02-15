<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Applicant;
use App\Models\Education;
use App\Models\WorkExperience;
use App\Models\Skill;
use Faker\Factory as Faker;

class ApplicantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1, 5) as $index) {
            $applicant = Applicant::create([
                'full_name' => $faker->name,
                'email' => $faker->unique()->safeEmail,
                'phone_number' => $faker->phoneNumber,
            ]);

            // Add multiple education entries
            foreach (range(1, 2) as $i) {
                Education::create([
                    'applicant_id' => $applicant->id,
                    'institution' => $faker->company . ' University',
                    'degree' => $faker->randomElement(['BSc Computer Science', 'BBA', 'MSc AI', 'MBA']),
                    'year' => $faker->year,
                ]);
            }

            // Add multiple work experience entries
            foreach (range(1, 2) as $i) {
                WorkExperience::create([
                    'applicant_id' => $applicant->id,
                    'company' => $faker->company,
                    'role' => $faker->jobTitle,
                    'duration' => $faker->numberBetween(2015, 2024) . '-' . $faker->numberBetween(2025, 2030),
                ]);
            }

            // Add multiple skills
            foreach ($faker->randomElements(['Laravel', 'Vue.js', 'Docker', 'Python', 'AWS', 'SQL', 'React', 'Flutter'], 4) as $skill) {
                Skill::create([
                    'applicant_id' => $applicant->id,
                    'skill' => $skill,
                ]);
            }
        }
    }
}

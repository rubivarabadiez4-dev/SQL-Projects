/*
Question: What are the top-paying data engineer jobs?
- Identify the top 10 highest-paying Data Engineer roles that are available remotely.
- Focuses on job postings with specified salaries
- Purpose: To determine and focus to apply the highest paying Data Engineer roles opportunities that are available online.
*/

SELECT
    jpc.job_id,
    jpc.job_title,
    cd.name as company_name,
    jpc.job_schedule_type,
    jpc.job_location,
    jpc.salary_year_avg,
    jpc.job_posted_date
FROM
    job_postings_fact as jpc
LEFT JOIN
    company_dim as cd on cd.company_id = jpc.company_id
WHERE
    salary_year_avg is not null AND
    job_title_short = 'Data Engineer' AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
limit 10;

/*
[
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "company_name": "Engtal",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "company_name": "Durlston Partners",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-07-17"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "company_name": "Twitch",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "company_name": "AI Startup",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "company_name": "Signify Technology",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "company_name": "Movable Ink",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "company_name": "Handshake",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-01-08"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "company_name": "Meta",
    "job_schedule_type": "Full-time",
    "job_location": "Anywhere",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-12"
  }
]
*/
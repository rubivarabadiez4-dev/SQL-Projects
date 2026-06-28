/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs?
- Include the specific skills required for these roles
- Purpose: To determine the jobs available with skills needed to learn and develop to land a top salary jobs 
*/

with top_jobs as
(
    SELECT
        jpc.job_id,
        jpc.job_title,
        cd.name as company_name,
        jpc.salary_year_avg
    FROM
        job_postings_fact as jpc
    LEFT JOIN
        company_dim as cd on cd.company_id = jpc.company_id
    WHERE
        salary_year_avg is not null AND
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere'
    limit 10
)

SELECT
    tj.*,
    skills
FROM
    top_jobs as tj
INNER JOIN
    skills_job_dim as sjd on sjd.job_id = tj.job_id
INNER JOIN
    skills_dim as sd on sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC;

/*
[
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "azure"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "assembly"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "java"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "scala"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "python"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "sql"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "kafka"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "airflow"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "spark"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "gcp"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "redshift"
  },
  {
    "job_id": 7593,
    "job_title": "Staff Data Engineer (Greater NYC Area, NY or Remote)",
    "company_name": "Integral Ad Science",
    "salary_year_avg": "192500.0",
    "skills": "aws"
  },
  {
    "job_id": 810479,
    "job_title": "Staff Data Engineer - Marketing Analytics - 100% Remote",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "190000.0",
    "skills": "python"
  },
  {
    "job_id": 810479,
    "job_title": "Staff Data Engineer - Marketing Analytics - 100% Remote",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "190000.0",
    "skills": "sql"
  },
  {
    "job_id": 289748,
    "job_title": "Hands-On Head of Data Engineering (Energy)",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "177500.0",
    "skills": "python"
  },
  {
    "job_id": 289748,
    "job_title": "Hands-On Head of Data Engineering (Energy)",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "177500.0",
    "skills": "scala"
  },
  {
    "job_id": 289748,
    "job_title": "Hands-On Head of Data Engineering (Energy)",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "177500.0",
    "skills": "azure"
  },
  {
    "job_id": 289748,
    "job_title": "Hands-On Head of Data Engineering (Energy)",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "177500.0",
    "skills": "aws"
  },
  {
    "job_id": 289748,
    "job_title": "Hands-On Head of Data Engineering (Energy)",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "177500.0",
    "skills": "airflow"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "node.js"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "ruby"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "spark"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "aws"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "databricks"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "ruby"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "javascript"
  },
  {
    "job_id": 7208,
    "job_title": "Lead Data Engineer",
    "company_name": "Storm3",
    "salary_year_avg": "175000.0",
    "skills": "python"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "sql"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "python"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "nosql"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "scala"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "java"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "shell"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "mongo"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "mysql"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "cassandra"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "azure"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "aws"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "redshift"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "spark"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 255232,
    "job_title": "Principal Associate, Data Engineer(Remote)",
    "company_name": "Capital One",
    "salary_year_avg": "166500.0",
    "skills": "kafka"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "sql"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "mysql"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "sql server"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "oracle"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "aws"
  },
  {
    "job_id": 369633,
    "job_title": "Data Engineer (Remote Option)",
    "company_name": "Balsam Brands",
    "salary_year_avg": "136500.0",
    "skills": "azure"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "pandas"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "excel"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "power bi"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "git"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "jenkins"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "terraform"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "ansible"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "python"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "sql"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "azure"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "databricks"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "powershell"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "aws"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "redshift"
  },
  {
    "job_id": 662408,
    "job_title": "Data Engineer",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "136000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "nosql"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "aws"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "redshift"
  },
  {
    "job_id": 2381,
    "job_title": "Data Engineer-AWS Pipeline Developer (Python)",
    "company_name": "CBTS",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "scala"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "kafka"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "spark"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "gcp"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "redshift"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "aws"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "azure"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 348109,
    "job_title": "Data Engineer (Entry Level)",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "mysql"
  },
  {
    "job_id": 2695,
    "job_title": "Data Engineer ll (Latin America - Remote Role)",
    "company_name": "Qventus, Inc",
    "salary_year_avg": "55000.0",
    "skills": "java"
  },
  {
    "job_id": 2695,
    "job_title": "Data Engineer ll (Latin America - Remote Role)",
    "company_name": "Qventus, Inc",
    "salary_year_avg": "55000.0",
    "skills": "python"
  },
  {
    "job_id": 2695,
    "job_title": "Data Engineer ll (Latin America - Remote Role)",
    "company_name": "Qventus, Inc",
    "salary_year_avg": "55000.0",
    "skills": "flow"
  }
]
*/
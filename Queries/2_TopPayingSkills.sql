/*
 
 ENG
 
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying job demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries.
 
 RU
 
 Вопрос: Какие навыки требуются для самых высокооплачиваемых вакансий аналитика данных?
 - Возьмите 10 самых высокооплачиваемых вакансий аналитика данных из первого запроса.
 - Укажите конкретные навыки, необходимые для этих должностей.
 - Зачем это нужно? Это позволяет детально увидеть, какие навыки востребованы на высокооплачиваемых позициях,
 и помогает соискателям понять, какие компетенции следует развивать для получения максимальной зарплаты.
 
 */
WITH top_paying_jobs AS (
    SELECT postings.job_id,
        postings.job_title,
        postings.job_location,
        postings.job_schedule_type,
        postings.salary_year_avg,
        company.name
    FROM job_postings_fact AS postings
        LEFT JOIN company_dim AS company ON postings.company_id = company.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT COUNT(top_paying_jobs.job_id) as skill_count,
    skills.skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim AS job_skills ON top_paying_jobs.job_id = job_skills.job_id
    INNER JOIN skills_dim AS skills ON skills.skill_id = job_skills.skill_id
GROUP BY skills.skills
ORDER BY skill_count DESC;
/*
 
 ENG
 
 In Luke Barousse’s actual course,
 the query yields a somewhat chaotic table where each job posting is repeated—each time with a different value in the "skills" column;
 while he filtered the data using ChatGPT,
 I structured it so that you can immediately see all the in-demand skills for those 10 high-paying jobs.
 
 RU
 
 В самом курсе Luke Barousse,
 запрос выдаёт лишь немного хаотичную таблицу, где каждый пост о работе повторяется,
 но с различным значением в таблице skills, он отфильтровал её через ChatGPT,
 я же сделал, так, чтобы можно было сразу увидеть все востребованные навыки для тех самых 10 высокооплачиваемых работ.
 
 *****************************************************************************************
 
 ENG
 
 Core Data & Querying Languages
 
 SQL is the single most in-demand skill, required by 100% of the job postings (8 out of 8 roles), with an average associated salary of $207,320.
 Python follows closely as the primary programming language, appearing in 87.5% of postings (7 out of 8 roles) with an average salary of $205,937.
 R is requested in 50% of the postings (4 out of 8 roles), averaging $215,313.
 Go appears in 25% of postings (2 out of 8 roles), with an average salary of $195,500.
 
 Data Visualization & Spreadsheets
 
 Tableau leads data visualization tools, featured in 75% of postings (6 out of 8 roles) with an average salary of $214,260.
 Excel and Pandas are both required in 37.5% of postings (3 out of 8 roles each), with an average salary of $215,610.
 Power BI is listed in 25% of postings (2 out of 8 roles), averaging $222,569.
 PowerPoint appears in 12.5% of listings (1 out of 8 roles) at $255,830.
 
 Cloud, Data Warehousing & Big Data
 
 Snowflake is the top cloud data warehouse skill, listed in 37.5% of postings (3 out of 8 roles) with an average salary of $193,436.
 AWS and Azure are both present in 25% of postings (2 out of 8 roles each), both averaging $222,569.
 Oracle appears in 25% of roles (2 out of 8 roles), averaging $203,155.
 PySpark, Databricks, and Hadoop each appear in 12.5% of postings (1 out of 8 roles each).
 
 Developer & Collaboration Tools
 
 Atlassian tools, including Jira and Confluence, are required in 25% of postings (2 out of 8 roles each), with an average salary of $189,155.
 Version control platforms, including GitLab and Bitbucket, appear in 25% of postings (2 out of 8 roles each), while Git is present in 12.5% (1 out of 8 roles).
 Jenkins CI/CD automation is required in 12.5% of postings (1 out of 8 roles).
 
 RU
 
 Основные технологии работы с данными и языки запросов
 
 SQL - самый востребованный навык: он требуется в 100% вакансий (8 из 8 позиций), а средняя зарплата составляет $207 320.
 Следом идет Python как основной язык программирования; он упоминается в 87,5% вакансий (7 из 8 позиций) со средней зарплатой $205 937.
 R требуется в 50% вакансий (4 из 8 позиций), средняя зарплата - $215 313.
 Go встречается в 25% вакансий (2 из 8 позиций), средняя зарплата - $195 500.
 
 Визуализация данных и электронные таблицы
 
 Среди инструментов визуализации данных лидирует Tableau: он упоминается в 75% вакансий (6 из 8 позиций), средняя зарплата - $214 260.
 Excel и Pandas требуются в 37,5% вакансий (по 3 из 8 позиций каждый), средняя зарплата - $215 610.
 Power BI указан в 25% вакансий (2 из 8 позиций), средняя зарплата - $222 569.
 PowerPoint встречается в 12,5% вакансий (1 из 8 позиций), зарплата - $255 830.
 
 Облачные технологии, хранилища данных и Big Data
 
 Snowflake - ведущий навык в области облачных хранилищ данных; он указан в 37,5% вакансий (3 из 8 позиций), средняя зарплата - $193 436.
 AWS и Azure присутствуют в 25% вакансий (по 2 из 8 позиций каждый), средняя зарплата для обоих - $222 569.
 Oracle встречается в 25% вакансий (2 из 8 позиций), средняя зарплата - $203 155.
 PySpark, Databricks и Hadoop встречаются в 12,5% вакансий (по 1 из 8 позиций каждый). Инструменты для разработки и совместной работы
 
 Инструменты Atlassian, включая Jira и Confluence, требуются в 25% вакансий (по 2 из 8 позиций); средняя зарплата составляет 189 155 долларов. 
 Платформы для контроля версий, в том числе GitLab и Bitbucket, упоминаются в 25% вакансий (по 2 из 8 позиций), тогда как Git встречается в 12,5% (1 из 8 позиций). 
 Навыки работы с системой автоматизации CI/CD Jenkins требуются в 12,5% вакансий (1 из 8 позиций).
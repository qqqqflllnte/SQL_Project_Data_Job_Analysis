/*
 
 ENG
 
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 hughest-paying Data Analyst roles that are available remotely.
 - Focuses on job posings with specified salaries (remove nulls).
 - Why? Highlight the top-paying opportunities for Data Analysts.
 
 RU
 
 Вопрос: Какие вакансии для аналитиков данных самые высокооплачиваемые?
 - Определите 10 самых высокооплачиваемых вакансий аналитика данных, доступных для удаленной работы.
 - Учитывайте только те вакансии, в которых указан уровень заработной платы (исключите записи с отсутствующими данными).
 - Цель: выделить наиболее выгодные предложения для аналитиков данных.
 
 */
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
LIMIT 10;
/*
 
 ENG
 
 But what if the user wants to know exactly which company is offering this vacancy?
 In that case, I need to use a LEFT JOIN.
 
 RU
 
 Что если пользователю стало интересно, а какая именно компания предлагает эту вакансию?
 Тогда мне нужно использовать LEFT JOIN.
 
 *****************************************************************************************
 
 ENG
 
 I use `postings.` and `company.` before the column name for clarity.
 With large or complex queries, this "style" helps avoid confusion.
 
 RU
 
 Использую postings. и company. перед названием столбца для понятности.
 При больших запросах или сложных запросах, такой "почерк" помогает не запутаться.
/*
 
 ENG
 
 Question: What are the most in-demand skills for my role? Find top 5 the most in-demand skills.
 
 RU
 
 Какие навыки наиболее востребованы для моей должности? Найдите 5 самых востребованных навыков.
 
 */
WITH total_skill_count AS (
    SELECT skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
        INNER JOIN job_postings_fact AS jobs ON jobs.job_id = skills_job_dim.job_id
    WHERE jobs.job_work_from_home = TRUE
        AND jobs.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)
SELECT skills.skill_id,
    skills.skills,
    skill_count
FROM total_skill_count
    INNER JOIN skills_dim AS skills ON skills.skill_id = total_skill_count.skill_id
ORDER BY skill_count DESC
LIMIT 5
    /*
     
     ENG
     
     - Database & Querying Dominance: SQL is the clear leader with 7,291 occurrences, significantly outperforming all other skills.
     It serves as the core foundation for data extraction, manipulation, and querying.
     - Spreadsheets as a Core Baseline: Excel holds the second spot (4,611), proving that traditional spreadsheet skills remain crucial for quick calculations, lightweight data processing, and ad-hoc analysis.
     - Programming & Automation: Python comes in third (4,330), highlighting the necessity of scripting for data manipulation, advanced statistics, automated workflows, and integration with data stacks.
     - Data Visualization & BI Tools: Tableau (3,745) and Power BI (2,609) round out the top 5. Combined, demand for Business Intelligence and visual dashboarding tools represents a huge portion of the required skill set for translating raw data into business insights.
     
     RU
     
     - Лидерство в области баз данных и запросов: SQL - безусловный лидер (7 291 упоминание), значительно опережающий все остальные навыки.
     Он служит фундаментом для извлечения и обработки данных, а также для выполнения запросов.
     - Электронные таблицы как базовый инструмент: Excel занимает второе место (4 611 упоминаний), подтверждая, что навыки работы с электронными таблицами остаются критически важными для быстрых расчетов, несложной обработки данных и оперативного анализа.
     - Программирование и автоматизация: Python находится на третьем месте (4 330 упоминаний), что подчеркивает необходимость написания скриптов для манипулирования данными, углубленного статистического анализа, автоматизации рабочих процессов и интеграции с технологическими стеками для работы с данными.
     - Визуализация данных и инструменты BI: Tableau (3 745) и Power BI (2 609) замыкают пятерку лидеров. В совокупности спрос на инструменты бизнес-аналитики (BI) и визуализации данных (создание дашбордов) составляет значительную часть перечня навыков, необходимых для преобразования «сырых» данных в ценные для бизнеса выводы.
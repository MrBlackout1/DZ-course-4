SELECT p.id, 
       SUM(w.SALARY) * (EXTRACT(YEAR FROM AGE(FINISH_DATE, START_DATE)) * 12 + EXTRACT(MONTH FROM AGE(FINISH_DATE, START_DATE))) AS PRICE
FROM project p
JOIN project_worker pw ON p.id = pw.PROJECT_ID
JOIN worker w ON pw.WORKER_ID = w.id
GROUP BY p.id
ORDER BY PRICE DESC;


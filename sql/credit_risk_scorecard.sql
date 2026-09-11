-- Consumer Loan Risk — Scorecard Prototype
-- PostgreSQL
CREATE TABLE loans (
  debt_to_income NUMERIC, annual_income NUMERIC, loan_amount NUMERIC,
  interest_rate NUMERIC, grade TEXT, homeownership TEXT, verified_income TEXT,
  loan_purpose TEXT, term INT, loan_status TEXT
);

-- Define the observed bad outcome used in this prototype
SELECT CASE WHEN debt_to_income < 10 THEN '<10%'
            WHEN debt_to_income < 20 THEN '10-20%'
            WHEN debt_to_income < 30 THEN '20-30%'
            WHEN debt_to_income < 40 THEN '30-40%'
            ELSE '>40%' END AS dti_band,
       COUNT(*) AS applications,
       ROUND(100.0 * AVG((loan_status IN ('Charged Off','Default'))::int), 2) AS charged_off_rate_pct
FROM loans
GROUP BY 1
ORDER BY MIN(debt_to_income);

-- Risk mix by grade
SELECT grade, COUNT(*) AS applications,
       ROUND(100.0 * AVG((loan_status IN ('Charged Off','Default'))::int), 2) AS charged_off_rate_pct
FROM loans GROUP BY grade ORDER BY grade;

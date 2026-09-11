# Consumer Loan Risk — Scorecard Prototype

A transparent credit-risk screening prototype built with SQL and Python. It uses a 10,000-row public Lending Club-derived teaching extract from OpenIntro.

## Business question

**Which borrower characteristics are useful for risk triage, and how should a lender use a score without turning it into an opaque automatic rejection rule?**

## Finding

Debt-to-income, interest rate, loan grade and income verification are useful screening variables to inspect together. However, this extract contains only a small number of charged-off records, so the analysis is intentionally presented as a **scorecard prototype** rather than a production underwriting policy.

## Method

- Audited missing values and mixed numeric/categorical fields
- Created DTI bands for an interpretable segmentation view
- Defined the observed bad outcome as `loan_status IN ('Charged Off', 'Default')`
- Trained a class-weighted logistic regression with imputation, scaling and one-hot encoding
- Evaluated ROC-AUC and recall on a stratified holdout set

## Repository contents

- `sql/credit_risk_scorecard.sql`
- `notebooks/credit_risk_scorecard.ipynb`
- `dashboard_screenshots/scorecard_overview.png`
- `dashboard_screenshots/policy_simulation.png`
- `data/README.md`
- `data/loans_full_schema.csv` — local reproducibility extract

## Dataset

OpenIntro `loans_full_schema` Lending Club-derived extract

https://github.com/OpenIntroStat/openintro

Direct RDA file

https://raw.githubusercontent.com/OpenIntroStat/openintro/main/data/loans_full_schema.rda

## Important limitation

This repository does not claim a production scorecard, a native Power BI `.pbix` file, or a validated approval cut-off. Those require a larger historical default sample, temporal validation, calibration and governance review.

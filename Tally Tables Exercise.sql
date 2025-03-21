/*
 * Tally Tables Exercise

 * The temporary table, #PatientAdmission, has values for dates between the 1st and 8th January inclusive
 * But not all dates are present
 */


DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
DECLARE @NumberOfDays INT = DATEDIFF(DAY, @StartDate, @EndDate) + 1;


DROP TABLE IF EXISTS #PatientAdmission;
CREATE TABLE #PatientAdmission (AdmittedDate DATE, NumAdmissions INT);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-01', 5)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-02', 6)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-03', 4)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-05', 2)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-08', 2)

SELECT 
TALLYDATE.TALLYDates
,NumAdmissions
From [#PatientAdmission]

left outer join 

(
SELECT 
	DATEADD(DAY, N-1, @StartDate) AS Date = [TALLYDates]
    
FROM 
	Tally) TALLYDATE ON #PatientAdmission.AdmittedDate = TALLYDATE.Date

/*
 * Exercise: create a resultset that has a row for all dates in that period 
 * of 8 days with NumAdmissions set to 0 for missing dates. 
 You may wish to use the SQL statements below to set the start and end dates
 */

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);

-- write your answer here

/*
 * Exercise: list the dates that have no patient admissions
*/

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);

-- write your answer here

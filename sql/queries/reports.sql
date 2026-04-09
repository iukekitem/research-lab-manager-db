/* =========================================================
   Research Lab Manager
   Reporting & Analysis Queries
   ========================================================= */


/* ---------------------------------------------------------
   View all lab members
   --------------------------------------------------------- */
SELECT FirstName, LastName, JoinDate
FROM dbo.LabMembers;


/* ---------------------------------------------------------
   View active research projects
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status
FROM dbo.ResearchProjects
WHERE Status = 'Active';


/* ---------------------------------------------------------
   Lab members ordered by join date (tenure)
   --------------------------------------------------------- */
SELECT FirstName, LastName, JoinDate
FROM dbo.LabMembers
ORDER BY JoinDate ASC;


/* ---------------------------------------------------------
   Most recent research projects
   --------------------------------------------------------- */
SELECT TOP (3) ProjectID, Title, StartDate
FROM dbo.ResearchProjects
ORDER BY StartDate DESC;


/* ---------------------------------------------------------
   Long or recently started active projects
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status, StartDate
FROM dbo.ResearchProjects
WHERE Status = 'Active'
  AND StartDate >= '2023-01-01'
   OR PlannedDuration > 12;


/* ---------------------------------------------------------
   Projects within a planned duration range
   --------------------------------------------------------- */
SELECT ProjectID, Title, StartDate, PlannedDuration
FROM dbo.ResearchProjects
WHERE PlannedDuration BETWEEN 6 AND 18;


/* ---------------------------------------------------------
   Projects filtered by multiple status values
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status
FROM dbo.ResearchProjects
WHERE Status IN ('Active', 'Pending', 'Review');


/* ---------------------------------------------------------
   Lab members ordered alphabetically
   --------------------------------------------------------- */
SELECT FirstName, LastName, JoinDate
FROM dbo.LabMembers
ORDER BY LastName ASC, FirstName ASC;


/* ---------------------------------------------------------
   Projects not cancelled and started after 2023
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status, StartDate
FROM dbo.ResearchProjects
WHERE NOT (Status = 'Cancelled')
  AND StartDate >= '2023-01-01';


/* ---------------------------------------------------------
   Template: TOP with ties
   --------------------------------------------------------- */
-- Example only
SELECT TOP (n) WITH TIES column1, column2
FROM table_name
ORDER BY column1 DESC;


/* ---------------------------------------------------------
   Status report on active projects
   --------------------------------------------------------- */
SELECT TOP (10) ProjectID, Title, Status, StartDate, PlannedDuration
FROM dbo.ResearchProjects
WHERE Status = 'Active'
ORDER BY StartDate DESC;


/* ---------------------------------------------------------
   Most tenured lab members
   --------------------------------------------------------- */
SELECT TOP (5) MemberID, FirstName, LastName, JoinDate
FROM dbo.LabMembers
ORDER BY JoinDate ASC;


/* ---------------------------------------------------------
   Projects at risk (no leader assigned)
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status, PlannedDuration
FROM dbo.ResearchProjects
WHERE MemberID IS NULL
  AND Status NOT IN ('Completed', 'Cancelled')
ORDER BY PlannedDuration DESC;


/* ---------------------------------------------------------
   High-duration projects still active or pending
   --------------------------------------------------------- */
SELECT TOP (10) ProjectID, Title, Status, StartDate, PlannedDuration
FROM dbo.ResearchProjects
WHERE PlannedDuration > 18
  AND Status IN ('Active', 'Pending')
ORDER BY PlannedDuration DESC, StartDate ASC;


/* ---------------------------------------------------------
   Project pipeline analysis
   --------------------------------------------------------- */
SELECT TOP (100) ProjectID, Title, Status, StartDate, PlannedDuration
FROM dbo.ResearchProjects
WHERE Status IN ('Active', 'Pending', 'Review')
ORDER BY Status ASC, StartDate DESC;


/* ---------------------------------------------------------
   Project pipeline with custom priority ordering
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status, StartDate
FROM dbo.ResearchProjects
WHERE Status IN ('Active', 'Pending', 'Review')
ORDER BY
    CASE Status
        WHEN 'Active' THEN 1
        WHEN 'Review' THEN 2
        WHEN 'Pending' THEN 3
    END,
    StartDate DESC;


/* ---------------------------------------------------------
   Collaboration patterns (collaborators only)
   --------------------------------------------------------- */
SELECT MemberID, FirstName, LastName, JoinDate
FROM dbo.LabMembers
WHERE MemberID IN (
    SELECT DISTINCT MemberID
    FROM dbo.Collaborators
)
ORDER BY FirstName ASC;


/* ---------------------------------------------------------
   Targeted member lookup (simulated collaborators)
   --------------------------------------------------------- */
SELECT MemberID, FirstName, LastName, JoinDate
FROM dbo.LabMembers
WHERE MemberID IN (1, 2, 4)
ORDER BY LastName ASC;


/* ---------------------------------------------------------
   Members who joined after a specific date
   --------------------------------------------------------- */
SELECT MemberID, FirstName, LastName, JoinDate
FROM dbo.LabMembers
WHERE MemberID IN (1, 2, 3)
  AND JoinDate >= '2020-01-01'
ORDER BY JoinDate DESC;


/* ---------------------------------------------------------
   Completed projects portfolio analysis
   --------------------------------------------------------- */
SELECT TOP (20) ProjectID, Title, EndDate, PlannedDuration
FROM dbo.ResearchProjects
WHERE Status = 'Completed'
  AND EndDate IS NOT NULL
ORDER BY EndDate DESC;


/* ---------------------------------------------------------
   Completed projects in the last 12 months
   --------------------------------------------------------- */
SELECT TOP (10) ProjectID, Title, EndDate
FROM dbo.ResearchProjects
WHERE Status = 'Completed'
  AND EndDate >= DATEADD(YEAR, -1, GETDATE())
ORDER BY EndDate DESC;


/* ---------------------------------------------------------
   Delayed projects
   --------------------------------------------------------- */
SELECT ProjectID, Title, Status, StartDate
FROM dbo.ResearchProjects
WHERE EndDate IS NULL
  AND Status NOT IN ('Active', 'Pending')
ORDER BY StartDate ASC;


/* ---------------------------------------------------------
   All projects ordered by completion status
   --------------------------------------------------------- */
SELECT TOP (50) ProjectID, Title, Status, EndDate
FROM dbo.ResearchProjects
ORDER BY
    CASE
        WHEN Status = 'Completed' THEN 0
        ELSE 1
    END,
    EndDate DESC;
``

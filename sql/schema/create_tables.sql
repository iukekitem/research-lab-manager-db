/* =====================================================
   Research Lab Manager Database
   Table Creation Script
   ===================================================== */

/* ------------------------------
   Core Entity Tables
   ------------------------------ */

CREATE TABLE LabMembers (
    MemberID        INT PRIMARY KEY,
    FirstName       VARCHAR(50) NOT NULL,
    MiddleName      VARCHAR(50),
    LastName        VARCHAR(50) NOT NULL,
    JoinDate        DATE NOT NULL
);

CREATE TABLE Student (
    MemberID        INT PRIMARY KEY,
    AcademicLevel   VARCHAR(20),
    StudentNumber   VARCHAR(20) UNIQUE NOT NULL,
    Major           VARCHAR(50),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID)
        ON DELETE CASCADE
);

CREATE TABLE Faculty (
    MemberID    INT PRIMARY KEY,
    Department  VARCHAR(100),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID)
        ON DELETE CASCADE
);

CREATE TABLE Collaborators (
    MemberID            INT PRIMARY KEY,
    InstAffiliation     VARCHAR(100),
    Curriculum          VARCHAR(255),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID)
        ON DELETE CASCADE
);

/* ------------------------------
   Research and Funding
   ------------------------------ */

CREATE TABLE ResearchProjects (
    ProjectID        INT PRIMARY KEY,
    Title            VARCHAR(200) NOT NULL,
    StartDate        DATE,
    EndDate          DATE,
    PlannedDuration  INT,
    MemberID         INT,     -- Project Leader (Faculty)
    Status           VARCHAR(20),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID)
);

CREATE TABLE Grants (
    GrantID             INT PRIMARY KEY,
    ProjectID           INT,
    FundingAgency       VARCHAR(100),
    Budget              DECIMAL(15,2),
    StartDate           DATE,
    ExpectedDuration    INT,
    FOREIGN KEY (ProjectID)
        REFERENCES ResearchProjects(ProjectID)
        ON DELETE CASCADE
);

/* ------------------------------
   Equipment and Devices
   ------------------------------ */

CREATE TABLE Equipment (
    EquipID     INT PRIMARY KEY,
    Name        VARCHAR(100) NOT NULL,
    Type        VARCHAR(50),
    Manual      VARCHAR(255)
);

CREATE TABLE Devices (
    DeviceNumber    INT PRIMARY KEY,
    PurchaseDate    DATE,
    Status          VARCHAR(20),
    EquipID         INT,
    FOREIGN KEY (EquipID)
        REFERENCES Equipment(EquipID)
        ON DELETE SET NULL
);

/* ------------------------------
   Relationship Tables
   ------------------------------ */

CREATE TABLE WorksOn (
    WorkID        INT PRIMARY KEY,
    MemberID      INT,
    ProjectID     INT,
    Role          VARCHAR(50),
    WeeklyHours   INT,
    UNIQUE (MemberID, ProjectID),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID),
    FOREIGN KEY (ProjectID)
        REFERENCES ResearchProjects(ProjectID)
);

CREATE TABLE Mentorship (
    MentorID          INT PRIMARY KEY,
    MentorMemberID    INT,
    MenteeMemberID    INT,
    StartDate         DATE,
    EndDate           DATE,
    FOREIGN KEY (MentorMemberID)
        REFERENCES LabMembers(MemberID),
    FOREIGN KEY (MenteeMemberID)
        REFERENCES LabMembers(MemberID)
);

CREATE TABLE Uses (
    UsageID       INT PRIMARY KEY,
    MemberID      INT,
    DeviceNumber  INT,
    StartDate     DATE,
    EndDate       DATE,
    Purpose       VARCHAR(255),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID),
    FOREIGN KEY (DeviceNumber)
        REFERENCES Devices(DeviceNumber)
);

CREATE TABLE Publications (
    PublicID    INT PRIMARY KEY,
    Title       VARCHAR(255) NOT NULL,
    DOI         VARCHAR(100) UNIQUE,
    Venue       VARCHAR(100),
    Month       INT,
    Year        INT
);

CREATE TABLE Author (
    AuthorID    INT PRIMARY KEY,
    MemberID    INT,
    PublicID    INT,
    UNIQUE (MemberID, PublicID),
    FOREIGN KEY (MemberID)
        REFERENCES LabMembers(MemberID),
    FOREIGN KEY (PublicID)
        REFERENCES Publications(PublicID)
);

-- 1. LabMembers (The Foundation)
INSERT INTO LabMembers (MemberID, FirstName, MiddleName, LastName, JoinDate) VALUES
(1, 'Alice', 'Marie', 'Smith', '2020-01-10'),
(2, 'Bob', 'James', 'Johnson', '2021-03-15'),
(3, 'Charlie', 'Kent', 'Davis', '2019-11-20'),
(4, 'Diana', 'Lynn', 'Prince', '2022-02-01'),
(5, 'Edward', 'Neil', 'Norton', '2018-05-12'),
(6, 'Fiona', 'Grace', 'Gallagher', '2023-01-10'),
(7, 'George', 'Harrison', 'Miller', '2020-09-05'),
(8, 'Hannah', 'Isabel', 'Abbott', '2021-12-01'),
(9, 'Ian', 'Joseph', 'Wright', '2022-06-15'),
(10, 'Julia', 'Rose', 'Roberts', '2019-04-22'),
(11, 'Kevin', 'Scott', 'Bacon', '2023-03-01'),
(12, 'Laura', 'Tess', 'Palmer', '2022-08-30'),
(13, 'Michael', 'Scott', 'Gary', '2020-02-01'),
(14, 'Nancy', 'Drew', 'Hudson', '2021-01-15'),
(15, 'Oscar', 'Isaac', 'Hernandez', '2022-11-11');

-- 2. Subclasses (Faculty, Student, Collaborators)
INSERT INTO Faculty (MemberID, Department) VALUES 
(1, 'Computer Science'), (3, 'Robotics'), (5, 'Data Science'), (7, 'Bio-Engineering'), (13, 'AI Ethics');

INSERT INTO Student (MemberID, AcademicLevel, StudentNumber, Major) VALUES
(2, 'Graduate', 'L10000001', 'Computer Science'),
(4, 'Undergraduate', 'L10000002', 'Data Science'),
(6, 'Graduate', 'L10000003', 'Robotics'),
(8, 'Undergraduate', 'L10000004', 'Computer Science'),
(9, 'Graduate', 'L10000005', 'Data Science'),
(11, 'Graduate', 'L10000006', 'Robotics'),
(14, 'Undergraduate', 'L10000007', 'Bio-Engineering');

INSERT INTO Collaborators (MemberID, InstAffiliation, Curriculum) VALUES
(10, 'MIT', 'External AI Advisor'), (12, 'Stanford', 'Ethics Researcher'), (15, 'CERN', 'Physics Data Specialist');

-- 3. Research Projects
INSERT INTO ResearchProjects (ProjectID, Title, StartDate, EndDate, PlannedDuration, MemberID, Status) VALUES
(101, 'Quantum Neural Nets', '2020-02-01', '2023-12-31', 46, 1, 'Completed'),
(102, 'Urban Traffic AI', '2021-04-01', '2023-04-01', 24, 3, 'Completed'),
(103, 'Humanoid Ethics', '2022-01-15', '2025-01-15', 36, 13, 'Active'),
(104, 'Deep Sea Sensors', '2019-11-01', '2021-11-01', 24, 5, 'Completed'),
(105, 'Bio-Informatics V2', '2022-06-01', NULL, 36, 7, 'Active'),
(106, 'Climate Data Modeling', '2023-01-01', '2024-12-31', 24, 5, 'Active'),
(107, 'Smart Grid Security', '2021-08-15', '2022-08-15', 12, 1, 'Completed'),
(108, 'Blockchain Voting', '2022-05-01', '2023-05-01', 12, 1, 'Completed'),
(109, 'Autonomous Drones', '2023-09-01', NULL, 24, 3, 'Active'),
(110, 'HCI in VR', '2022-10-10', '2024-10-10', 24, 13, 'Active');

-- 4. Grants (Multiple grants per project for the Top 5 report)
INSERT INTO Grants (GrantID, ProjectID, FundingAgency, Budget, StartDate, ExpectedDuration) VALUES
(1, 101, 'NSF', 500000.00, '2020-02-01', 36),
(2, 101, 'NASA', 250000.00, '2021-02-01', 12),
(3, 102, 'DoT', 300000.00, '2021-04-01', 24),
(4, 103, 'NIH', 150000.00, '2022-01-15', 24),
(5, 105, 'NSF', 400000.00, '2022-06-01', 36),
(6, 109, 'DARPA', 900000.00, '2023-09-01', 24),
(7, 104, 'NOAA', 200000.00, '2019-11-01', 24),
(8, 108, 'Private Corp', 50000.00, '2022-05-01', 12),
(9, 106, 'EPA', 600000.00, '2023-01-01', 24),
(10, 103, 'Google', 100000.00, '2023-01-15', 12);

-- 5. Equipment
INSERT INTO Equipment (EquipID, Manual, Name, Type) VALUES
(1, 'man_vr.pdf', 'Oculus Rift S', 'VR Headset'),
(2, 'man_gpu.pdf', 'NVIDIA A100', 'GPU Server'),
(3, 'man_robot.pdf', 'Spot Robot', 'Robotics'),
(4, 'man_drone.pdf', 'DJI Mavic 3', 'Drone'),
(5, 'man_sensor.pdf', 'Arduous Kit', 'Microcontroller'),
(6, 'man_3d.pdf', 'Prusa i3', '3D Printer'),
(7, 'man_cam.pdf', 'Intel RealSense', 'Camera'),
(8, 'man_scope.pdf', 'Digital Microscope', 'Imaging'),
(9, 'man_rack.pdf', 'Dell Server Rack', 'Server'),
(10, 'man_lidar.pdf', 'Velodyne Lidar', 'Sensor');

-- 6. Devices (Specific units)
INSERT INTO Devices (DeviceNumber, PurchaseDate, Status, EquipID) VALUES
(1001, '2020-05-01', 'Active', 1), (1002, '2020-05-01', 'Broken', 1),
(2001, '2021-01-15', 'Active', 2), (2002, '2022-01-15', 'Maintenance', 2),
(3001, '2019-12-01', 'Active', 3), (4001, '2023-10-10', 'Active', 4),
(5001, '2022-03-20', 'Active', 5), (6001, '2022-04-15', 'Active', 6),
(7001, '2021-06-01', 'Active', 7), (10001, '2020-01-01', 'Active', 10);

-- 7. WorksOn
INSERT INTO WorksOn (WorkID, MemberID, ProjectID, Role, WeeklyHours) VALUES
(1, 1, 101, 'Lead', 20), (2, 2, 101, 'Researcher', 15),
(3, 3, 102, 'Lead', 10), (4, 4, 102, 'Analyst', 12),
(5, 5, 104, 'Lead', 10), (6, 6, 109, 'Pilot', 20),
(7, 13, 103, 'Advisor', 5), (8, 11, 109, 'Assistant', 15),
(9, 14, 105, 'Student Lab', 10), (10, 8, 107, 'Developer', 8);

-- 8. Mentorship
INSERT INTO Mentorship (MentorID, MentorMemberID, MenteeMemberID, StartDate, EndDate) VALUES
(1, 1, 2, '2021-03-15', NULL), (2, 1, 8, '2022-01-01', NULL),
(3, 3, 6, '2023-01-10', NULL), (4, 5, 4, '2022-02-01', '2023-02-01'),
(5, 5, 9, '2022-06-15', NULL), (6, 13, 11, '2023-03-01', NULL),
(7, 7, 14, '2021-01-15', NULL), (8, 1, 4, '2023-02-01', NULL),
(9, 3, 11, '2023-05-01', NULL), (10, 13, 12, '2022-09-01', NULL);

-- 9. Uses
INSERT INTO Uses (ID, MemberID, DeviceNumber, StartDate, EndDate, Purpose) VALUES
(1, 2, 1001, '2023-11-01', '2023-11-05', 'VR Research'),
(2, 6, 3001, '2024-01-10', NULL, 'Robot Navigation'),
(3, 4, 2001, '2024-02-01', NULL, 'Deep Learning Train'),
(4, 11, 4001, '2024-03-01', NULL, 'Drone Testing'),
(5, 14, 8001, '2023-12-01', '2023-12-10', 'Cell Imaging'),
(6, 8, 5001, '2024-02-15', NULL, 'Circuit Build'),
(7, 9, 2001, '2023-10-01', '2023-10-20', 'Analysis'),
(8, 2, 10001, '2024-03-15', NULL, 'Lidar Mapping'),
(9, 6, 7001, '2024-01-01', '2024-01-15', 'Vision Test'),
(10, 11, 3001, '2024-03-20', NULL, 'Mobility Run');

-- 10. Publications
INSERT INTO Publications (PublicID, Title, DOI, Venue, Month, Year) VALUES
(501, 'Quantum Efficiency', '10.101/qai', 'Nature', 3, 2023),
(502, 'Ethics of AI Robots', '10.202/eai', 'IEEE Ethics', 5, 2022),
(503, 'Traffic Prediction', '10.303/urb', 'Urban Tech', 11, 2022),
(504, 'Deep Sea Acoustic', '10.404/sea', 'Ocean Journal', 1, 2021),
(505, 'Bio-Informatics V2', '10.505/bio', 'Science', 8, 2024),
(506, 'Climate Trends', '10.606/clm', 'Climatic Change', 12, 2023),
(507, 'Secure Smart Grids', '10.707/sec', 'Cyber Journal', 6, 2022),
(508, 'Blockchain Voting', '10.808/blk', 'ACM', 2, 2023),
(509, 'Drone Swarm Nav', '10.909/drn', 'Robotics Int', 4, 2024),
(510, 'HCI in Metaverse', '10.010/hci', 'CHI Conference', 10, 2023);

-- 11. Author (Mentees of Alice and Charlie are dominant here for the report)
INSERT INTO Author (AuthorID, MemberID, PublicID) VALUES
(1, 2, 501), -- Student Bob (Alice's mentee)
(2, 2, 502), -- Student Bob (Alice's mentee)
(3, 8, 503), -- Student Hannah (Alice's mentee)
(4, 8, 501), -- Student Hannah (Alice's mentee)
(5, 4, 504), -- Student Diana
(6, 6, 509), -- Student Fiona (Charlie's mentee)
(7, 6, 510), -- Student Fiona (Charlie's mentee)
(8, 11, 509), -- Student Kevin
(9, 14, 505), -- Student Nancy
(10, 9, 506); -- Student Ian

-- Fix the conflicting row by pointing it to a valid DeviceNumber (7001)
UPDATE Uses 
SET DeviceNumber = 7001 
WHERE ID = 5;

-- Trying a different approach to update data: Instead of typing '8001', this tells SQL: "Find any device that is currently Active"
INSERT INTO Uses (ID, MemberID, DeviceNumber, StartDate, Purpose)
VALUES (11, 14, (SELECT TOP 1 DeviceNumber FROM Devices WHERE Status = 'Active'), GETDATE(), 'Testing');

-- Ensure the table is clean before re-inserting
DELETE FROM Uses;

INSERT INTO Uses (ID, MemberID, DeviceNumber, StartDate, EndDate, Purpose) VALUES
(1, 2, 1001, '2023-11-01', '2023-11-05', 'VR Research'),
(2, 6, 3001, '2024-01-10', NULL, 'Robot Navigation'),
(3, 4, 2001, '2024-02-01', NULL, 'Deep Learning Train'),
(4, 11, 4001, '2024-03-01', NULL, 'Drone Testing'),
(5, 14, 7001, '2023-12-01', '2023-12-10', 'Cell Imaging'), -- Fixed: Used 7001 instead of 8001
(6, 8, 5001, '2024-02-15', NULL, 'Circuit Build'),
(7, 9, 2001, '2023-10-01', '2023-10-20', 'Analysis'),
(8, 2, 10001, '2024-03-15', NULL, 'Lidar Mapping'),
(9, 6, 7001, '2024-01-01', '2024-01-15', 'Vision Test'),
(10, 11, 3001, '2024-03-20', NULL, 'Mobility Run');

-- Inserting more Lab Members

INSERT INTO LabMembers (MemberID, FirstName, MiddleName, LastName, JoinDate) VALUES
(16, 'Peter', 'B', 'Parker', '2023-05-01'),
(17, 'Bruce', 'W', 'Wayne', '2022-11-12'),
(18, 'Clark', 'K', 'Kent', '2021-01-20'),
(19, 'Tony', 'S', 'Stark', '2020-08-15'),
(20, 'Natasha', 'R', 'Romanoff', '2023-02-10'),
(21, 'Wanda', 'M', 'Maximoff', '2022-09-05'),
(22, 'Steve', 'G', 'Rogers', '2019-06-14'),
(23, 'Barry', 'A', 'Allen', '2024-01-01'),
(24, 'Arthur', 'C', 'Curry', '2023-07-22'),
(25, 'Victor', 'S', 'Stone', '2022-04-18'),
(26, 'Selina', 'K', 'Kyle', '2021-10-30'),
(27, 'Harvey', 'D', 'Dent', '2020-12-05'),
(28, 'Barbara', 'G', 'Gordon', '2023-08-11'),
(29, 'James', 'W', 'Gordon', '2018-03-25'),
(30, 'Alfred', 'T', 'Pennyworth', '2017-09-10');

-- Since I added more members now I am Inserting more into the subclasses

-- Adding 7 more Collaborators (Total: 10)
INSERT INTO Collaborators (MemberID, InstAffiliation, Curriculum) VALUES
(16, 'Empire State University', 'Biotechnology Expert'),
(17, 'Wayne Enterprises', 'Tech Systems Specialist'),
(18, 'Daily Planet', 'Science Communications'),
(19, 'Stark Industries', 'Energy Research'),
(20, 'S.H.I.E.L.D', 'Security Analytics'),
(21, 'Sokovia Inst', 'Psychology Research'),
(22, 'Army Research Lab', 'Historical Data');

-- Adding 5 more Faculty (Total: 10)
INSERT INTO Faculty (MemberID, Department) VALUES
(23, 'Physics'),
(24, 'Marine Biology'),
(25, 'Cybernetics'),
(26, 'Criminology'),
(27, 'Law & Ethics');

-- Adding 3 more Students (Total: 10)
INSERT INTO Student (MemberID, AcademicLevel, StudentNumber, Major) VALUES
(28, 'Graduate', 'L10000008', 'Information Systems'),
(29, 'Undergraduate', 'L10000009', 'Criminal Justice'),
(30, 'Graduate', 'L10000010', 'Management');

-- Adding 15 more rows to WorksOn (Total: 25)
-- Format: (WorkID, MemberID, ProjectID, Role, WeeklyHours)
INSERT INTO WorksOn (WorkID, MemberID, ProjectID, Role, WeeklyHours) VALUES
(11, 16, 101, 'External Consultant', 5),
(12, 17, 103, 'Hardware Lead', 25),
(13, 18, 102, 'Documentation', 10),
(14, 19, 101, 'Tech Advisor', 15),
(15, 20, 108, 'Security Audit', 20),
(16, 21, 103, 'UI/UX Research', 15),
(17, 22, 104, 'Field Historian', 10),
(18, 23, 106, 'Physics Analyst', 30),
(19, 24, 105, 'Marine Tech', 20),
(20, 25, 109, 'Systems Engineer', 35),
(21, 28, 110, 'Graduate Asst', 20),
(22, 29, 107, 'Undergrad Asst', 10),
(23, 30, 105, 'Admin Support', 5),
(24, 12, 103, 'Ethics Reviewer', 8),
(25, 10, 109, 'AI Specialist', 15);

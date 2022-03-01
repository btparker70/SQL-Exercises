-- 1
SELECT *
FROM Exercise;

-- 2
SELECT *
FROM `Client`;

-- 3
SELECT *
FROM `Client`
WHERE City = 'Metairie';

-- 4
SELECT *
FROM `Client`
WHERE ClientId = '818u7faf-7b4b-48a2-bf12-7a26c92de20c';

-- 5
SELECT *
FROM Goal;

-- 6
SELECT `Name`, 'LevelId'
FROM Workout;

-- 7
SELECT `Name`, LevelId, Notes
FROM workout
WHERE LevelId = 2;

-- 8
SELECT FirstName, LastName, City
FROM Client
WHERE City = 'Metairie' OR City = 'Kenner' OR City = 'Gretna';

-- 9
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate BETWEEN '1980-01-01' AND '1989-12-31';

-- 10
SELECT FirstName, LastName, BirthDate
FROM Client
WHERE BirthDate >= '1980-01-01' AND BirthDate <= '1989-12-31';

-- 11
SELECT ClientId, EmailAddress, PasswordHash
FROM login
WHERE EmailAddress LIKE '%.gov';

-- 12
SELECT ClientId, EmailAddress, PasswordHash
FROM login
WHERE EmailAddress NOT LIKE '%.com';

-- 13
SELECT firstname, lastname
FROM client
WHERE BirthDate IS NULL;

-- 14
SELECT name
FROM exercisecategory
WHERE ParentCategoryId IS NOT NULL;

-- 15
SELECT name, notes
FROM workout
WHERE levelid = 3 AND notes LIKE '%you%';

-- 16

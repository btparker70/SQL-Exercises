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

-- OR
SELECT FirstName, LastName, City
FROM Client
WHERE city IN ('Metairie', 'Kenner', 'Gretna');

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
WHERE levelid = 3 AND notes LIKE '% you %';

-- 16
SELECT firstname, lastname, city
FROM client
WHERE (city = 'LaPlace') 
AND (lastname LIKE 'L%' OR lastname LIKE 'M%' OR lastname LIKE 'N%');

-- can also do
SELECT
	FirstName,
    LastName,
    City
FROM Client
WHERE LastName REGEXP '^[LMN]'
AND City = 'LaPlace';

-- 17
SELECT
	InvoiceId,
    Description,
    Price,
    Quantity,
    ServiceDate,
    Price * Quantity AS LineItemTotal
FROM InvoiceLineItem
WHERE Price * Quantity BETWEEN '15' AND '25';

-- 18
SELECT *
FROM client
INNER JOIN login
ON client.clientid = login.clientid
WHERE firstname = 'Estrella' AND lastname = 'Bazely';

-- 19
SELECT goal.name
FROM workout
JOIN workoutgoal ON workout.workoutid = workoutgoal.workoutid
JOIN goal ON workoutgoal.goalid = goal.goalid
WHERE workout.name = 'This Is Parkour';



excell pivot tables make tables with sliecers and charting using slicers
itil high end knowledge. 
sql know a lot
differences between inident management and problem management
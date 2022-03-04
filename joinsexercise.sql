USE PersonalTrainer;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows

SELECT *
FROM ExerciseCategory
JOIN Exercise ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;
--------------------
    
-- Select ExerciseCategory.Name and Exercise.Name
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows
SELECT ExerciseCategory.Name, Exercise.Name
FROM ExerciseCategory
JOIN Exercise ON ExerciseCategory.ExerciseCategoryID = Exercise.ExerciseCategoryID
WHERE ExerciseCategory.ParentCategoryId IS NULL;
--------------------

-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows

SELECT ec.Name, e.Name
FROM ExerciseCategory ec
JOIN Exercise e ON ec.ExerciseCategoryID = e.ExerciseCategoryID
WHERE ec.ParentCategoryId IS NULL;
--------------------

-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows
SELECT c.FirstName, c.LastName, c.BirthDate, l.EmailAddress
FROM Client c
JOIN Login l ON c.ClientId = l.ClientId
WHERE c.BirthDate BETWEEN '1990-01-01' AND '1999-12-31';
--------------------

-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows
SELECT w.Name, c.FirstName, c.LastName
FROM `Client` c
JOIN ClientWorkout cw ON cw.ClientId = c.ClientId
JOIN Workout w ON w.WorkoutId = cw.WorkoutId
WHERE LastName LIKE 'C%'; 
--------------------

-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.

SELECT w.Name AS WorkoutName, g.Name AS GoalName
FROM WorkoutGoal wg
JOIN Workout w ON wg.WorkoutId = w.WorkoutId
JOIN Goal g ON wg.GoalId = g.GoalId;
--------------------

-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows

SELECT c.FirstName, c.LastName, l.ClientId, l.EmailAddress
FROM Client c
LEFT JOIN Login l ON l.ClientId = c.ClientId;
--------------------

-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows

SELECT c.FirstName, c.LastName, l.ClientId, l.EmailAddress
FROM Client c
LEFT JOIN Login l ON l.ClientId = c.ClientId
WHERE l.EmailAddress IS NULL;
--------------------

-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(

SELECT c.FirstName, c.LastName, l.ClientId, l.EmailAddress
FROM Client c
LEFT JOIN Login l ON l.ClientId = c.ClientId
WHERE c.FirstName = 'Romeo' AND c.LastName = 'Seaward';
--------------------

-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows

SELECT ex1.Name, ex2.ParentCategoryId
FROM ExerciseCategory ex1, ExerciseCategory ex2
WHERE ex1.ParentCategoryId = ex2.ParentCategoryId;
--------------------
    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows
--------------------
    
-- Are there Clients who are not signed up for a Workout?
-- 50 rows
SELECT CONCAT(c.firstName, ' ', c.LastName) AS ClientName
FROM Client c
LEFT OUTER JOIN ClientWorkout cw ON cw.ClientId = c.ClientId
WHERE cw.WorkoutId IS NULL;
--------------------

-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows
SELECT DISTINCT w.WorkoutId, w.`Name` WorkoutName 
FROM Client c
INNER JOIN ClientGoal cg ON C.ClientId = c.ClientId
INNER JOIN WorkoutGoal wg ON cg.GoalId = wg.GoalId
INNER JOIN Workout w ON w.WorkoutId = wg.WorkoutId
WHERE c.FirstName = 'Shell'
AND c.LastName = 'Creane'
AND w.LevelId = 1;

--------------------

-- Select all Workouts. 
-- Join to the Goal, 'Core Strength', but make it optional.
-- You may have to look up the GoalId before writing the main query.
-- If you filter on Goal.Name in a WHERE clause, Workouts will be excluded.
-- Why?
-- 26 Workouts, 3 Goals
SELECT *
FROM Workout w
LEFT JOIN workoutgoal wg ON w.workoutid = wg.workoutid
JOIN goal g ON wg.goalid = g.goalid
WHERE g.name = 'Core Strength';

--------------------

-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and Exercise.Name for related Workouts and Exercises.
--------------------
   
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. 
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values
--------------------
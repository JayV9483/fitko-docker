-- select all users
SELECT u.name, u.created_at FROM users u;

-- count all users
SELECT COUNT(*) FROM users where name like 'A%';

-- show user's workouts for a day
SELECT e.name, s.set_number, s.weight_kg, s.reps
FROM workout_sessions ws
JOIN session_exercises se ON se.session_id = ws.id
JOIN exercises e          ON e.id = se.exercise_id
JOIN workout_sets s       ON s.session_exercise_id = se.id
WHERE ws.user_id = 1
  AND ws.started_at::date = '2026-10-12'
ORDER BY se.position, s.set_number;

SELECT u.name, ws.started_at, s.completed_at, e.name AS exercise, s.set_number, s.weight_kg, s.reps, e.rest_seconds 
FROM users u
JOIN workout_sessions ws  ON ws.user_id = u.id
JOIN session_exercises se ON se.session_id = ws.id
JOIN exercises e          ON e.id = se.exercise_id
JOIN workout_sets s       ON s.session_exercise_id = se.id
WHERE ws.started_at::date = '2026-10-12'
ORDER BY u.name, ws.started_at, s.completed_at, se.position, s.set_number;


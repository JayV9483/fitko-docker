INSERT INTO users (name)
VALUES ('Jakub')
RETURNING id, name;


INSERT INTO exercises (
    user_id,
    name,
    planned_sets,
    planned_reps,
    planned_weight_kg,
    rest_seconds
)
VALUES
    (1, 'Bench Press', 3, 10, 70.00, 300),
    (1, 'Bicep Curl',      3, 12, 15.00, 180),
    (1, 'Lat Pulldown',3, 10, 60.00, 240);


INSERT INTO workout_sessions (user_id, started_at)
VALUES (1, '2026-10-12 18:00+02');

INSERT INTO session_exercises (session_id, exercise_id, position)
VALUES (1, 1, 1),   -- Bench Press
       (1, 2, 2),   -- Bicep Curl
       (1, 3, 3);   -- Lat Pulldown

INSERT INTO workout_sets (session_exercise_id, set_number, weight_kg, reps, completed_at)
VALUES
    (1, 1, 70, 10, '2026-10-12 18:05+02'),
    (1, 2, 70, 10, '2026-10-12 18:10+02'),
    (1, 3, 70,  8, '2026-10-12 18:15+02'),
    (2, 1, 15, 12, '2026-10-12 18:27+02'),
    (2, 2, 15, 12, '2026-10-12 18:30+02'),
    (2, 3, 15, 10, '2026-10-12 18:33+02'),
    (3, 1, 60, 10, '2026-10-12 18:43+02'),
    (3, 2, 60, 10, '2026-10-12 18:47+02'),
    (3, 3, 60,  9, '2026-10-12 18:51+02');




CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT null,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



CREATE TABLE exercises (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    user_id BIGINT NOT NULL
        REFERENCES users(id) ON DELETE CASCADE,

    name VARCHAR(100) NOT NULL,

    planned_sets INTEGER NOT NULL DEFAULT 3
        CHECK (planned_sets > 0),

    planned_reps INTEGER NOT NULL DEFAULT 10
        CHECK (planned_reps > 0),

    planned_weight_kg NUMERIC(7,2) NOT NULL DEFAULT 0
        CHECK (planned_weight_kg >= 0),

    rest_seconds INTEGER NOT NULL DEFAULT 60
        CHECK (rest_seconds >= 0),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_exercises_user_id
    ON exercises(user_id);



CREATE TABLE workout_sessions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    user_id BIGINT NOT NULL
        REFERENCES users(id) ON DELETE CASCADE,

    started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    notes TEXT
);

CREATE INDEX idx_sessions_user_date
    ON workout_sessions(user_id, started_at DESC);



CREATE TABLE session_exercises (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    session_id BIGINT NOT NULL
        REFERENCES workout_sessions(id) ON DELETE CASCADE,

    exercise_id BIGINT NOT NULL
        REFERENCES exercises(id) ON DELETE CASCADE,

    position INTEGER NOT NULL DEFAULT 1
        CHECK (position > 0),

    UNIQUE (session_id, exercise_id)
);

CREATE INDEX idx_session_exercises_exercise
    ON session_exercises(exercise_id);



CREATE TABLE workout_sets (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    session_exercise_id BIGINT NOT NULL
        REFERENCES session_exercises(id) ON DELETE CASCADE,

    set_number INTEGER NOT NULL
        CHECK (set_number > 0),

    weight_kg NUMERIC(7,2) NOT NULL
        CHECK (weight_kg >= 0),

    reps INTEGER NOT NULL
        CHECK (reps > 0),

    rest_seconds INTEGER
        CHECK (rest_seconds >= 0),

    completed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    UNIQUE (session_exercise_id, set_number)
);

CREATE INDEX idx_workout_sets_session_exercise
    ON workout_sets(session_exercise_id);


DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael
WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

-- Connect to the newly created database

CREATE TABLE tasks
(
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    description text NULL,
    created_at TIMESTAMP WITHOUT time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT time zone NULL,
    completed boolean NOT NULL DEFAULT false
    
);

    ALTER TABLE tasks DROP COLUMN IF EXISTS completed;

    ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP WITHOUT time zone NULL DEFAULT NUll;

    ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
    
    ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

    INSERT INTO tasks
        (title, description, created_at, updated_at, completed_at)
    VALUES
        ('Study SQL', 'Complete this exercise', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

    INSERT INTO tasks
        (title, description)
    VALUES
        ('Study PostgreSQL', 'Read all the documentation');

    SELECT title FROM tasks WHERE completed_at IS NULL; 

    UPDATE tasks SET completed_at = CURRENT_TIMESTAMP WHERE title = 'Study SQL';

    SELECT title, description FROM tasks WHERE completed_at IS NUll;

    SELECT * FROM tasks ORDER BY created_at DESC;

    INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');
    
    INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

    INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

    SELECT * FROM tasks WHERE title LIKE '%mistake%';

    DELETE FROM tasks WHERE title = 'mistake 1';

    SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

    DELETE FROM tasks WHERE title LIKE '%mistake%';

    SELECT * FROM tasks ORDER BY title ASC;


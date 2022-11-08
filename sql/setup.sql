-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    author_first_name VARCHAR NOT NULL,
    author_last_name VARCHAR NOT NULL,
    year_published SMALLINT NOT NULL
);

INSERT INTO authors (
    first_name, 
    last_name
)
VALUES
    ('Shonda','Rhimes'),
    ('Ryan','Holiday'),
    ('Michelle','Obama'),
    ('James','Clear'),
    ('Marcus','Aurelius')
;

INSERT INTO books (
    title,
    author_first_name,
    author_last_name,
    year_published
)
VALUES
    ('Year of Yes', 'Shonda', 'Rhimes', 2015),
    ('Discipline is Destiny', 'Ryan', 'Holiday', 2022),
    ('Courage is Calling', 'Ryan', 'Holiday', 2021),
    ('Becoming', 'Michelle', 'Obama', 2018),
    ('Atomic Habits', 'James', 'Clear', 2018),
    ('Meditations', 'Marcus', 'Aurelius', 1558)
;
    

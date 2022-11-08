-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob DATE NOT NULL,
    pob VARCHAR NOT NULL
);

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULL,
    released SMALLINT NOT NULL
);

INSERT INTO authors (
    name,
    dob,
    pob
)
VALUES
    ('Shonda Rhimes', '1970-01-13', 'Chicago, IL'),
    ('Ryan Holiday', '1987-06-16', 'Sacramento, CA' ),
    ('Michelle Obama', '1964-01-17', 'Chicago, IL'),
    ('James Clear', '1986-01-22', 'Hamilton, OH'),
    ('Marcus Aurelius', '0121-04-26', 'Rome, Italy')
;

INSERT INTO books (
    title,
    released
)
VALUES
    ('Year of Yes', 2015),
    ('Discipline is Destiny', 2022),
    ('Courage is Calling', 2021),
    ('Becoming', 2018),
    ('Atomic Habits', 2018),
    ('Meditations', 1558)
;
    

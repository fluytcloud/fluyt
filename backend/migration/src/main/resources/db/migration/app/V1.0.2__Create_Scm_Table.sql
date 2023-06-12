CREATE TABLE SCM
(
    ID           SERIAL PRIMARY KEY,
    NAME         VARCHAR(100) NOT NULL,
    TYPE         VARCHAR(50)  NOT NULL,
    URL          VARCHAR(255),
    USERNAME     VARCHAR(100),
    TOKEN        TEXT,
    ORGANIZATION VARCHAR(100)
);
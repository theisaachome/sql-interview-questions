# CRUD Commands

## Table Of Content

- ### [Setup The Database](#setup-all-the-database)
- ### [Reading The Database](#reading-the-data)
- ### [The WHERE Clause ](#where-clause)
- ### [Using Aliases ](#aliases)
- ### [Updating The data ](#update-the-data)
- ### [Deleting the data](#delete-the-data)

---

## Setup all The Database

## Drop Table Cats

```sql
DROP TABLE cats;
```

## CREATE TABLE Cats

```sql
CREATE TABLE cats
  (
     cat_id INT NOT NULL AUTO_INCREMENT,
     name   VARCHAR(100),
     breed  VARCHAR(100),
     age    INT,
     PRIMARY KEY (cat_id)
  );
```

## INSERT DATA

```sql
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
```

## READING THE DATA

Read
How do we retrieve and search data?

## `SELECT`

Remember This?

```sql
SELECT * FROM cats;
```

"Give Me All Columns from the table.

`SELECT` Expression What columns do you want?

### Example

```sql
SELECT age FROM cats;
SELECT name FROM cats;
```

### Example

```sql
SELECT name, age FROM cats;
```

---

## WHERE Clause

- The `WHERE` clause , Let's Get Specifical

- We'll use WHERE all the time Not just to SELECT...

#### fetching string values with WHERE

```sql
SELECT * FROM cats WHERE age=4;
```

#### fetching string values with WHERE

```sql
SELECT * FROM cats WHERE name='Egg';
```

---

## Aliases

Easier to read results

```sql
SELECT cat_id AS id, name FROM cats;
```

## Update the data

How do we alter existing data?

```sql
UPDATE cats SET breed='Shorthair'
WHERE breed='Tabby';
```

```sql
UPDATE cats SET age=14
WHERE name='Misty';
```

---

## Delete the data

Time to learn to...delete things

```sql
DELETE FROM cats WHERE name='Egg';
```

delete all without WHERE clause.

```sql
DELETE FROM cats;
```

### CRUD Exercise

```sql
CREATE Database shirts_db;

use shirts_db;
CREATE TABLE shirts
  (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn INT,
    PRIMARY KEY(shirt_id)
  );

```

```sql

INSERT INTO shirts(article,color,shirt_size,last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
```

```sql
SELECT * FROM shirts
```

```sql ADD NEw Shirt
INSERT INTO shirts(color,article,shirt_size,last_worn) VALUES ('Purple',' polo shirt', 'M', 50);
```

---

SELECT all shirts but Only Print Out Article and Color

```sql
SELECT article,color FROM shirts;
```

SELECT all medium shirts Print Out Everything But shirt_id.

```sql
SELECCT shirt_id FROM shirts;
```

Update all polo shirts Change their size to L.

```sql
UPDATE shirts SET shirt_size='L'
WHERE article='polo shirt';
```

Update the shirt last worn 15 days ago Change last_worn to 0.

```sql
UPDATE shirts SET last_worn=0
WHERE last_worn = 50;
```

Update all white shirts change size to 'XS' and color to 'off white'.

```sql
UPDATE shirts SET shirt_size='XS', color ='off white'
WHERE color='white';
```

Delete all old shirts Last worn 200 days ago.

```sql
DELETE FROM shirts WHERE last_worn=200;
```

Delete all tank tops Your tastes have changed.

```sql
DELETE FROM shirts WHERE article='tank top';
```

Delete all shirts Catastrophe!

```sql
DELETE FROM shirts;
```

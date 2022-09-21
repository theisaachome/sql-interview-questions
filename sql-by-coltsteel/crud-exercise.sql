

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
    
                     

INSERT INTO shirts(article,color,shirt_size,last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- SELECT * FROM shirts

--  ADD NEw Shirt
INSERT INTO shirts(color,article,shirt_size,last_worn) VALUES ('Purple',' polo shirt', 'M', 50);


/* SELECT all shirts
But Only Print Out Article and Color */

SELECT article,color FROM shirts;


/* SELECT all medium shirts
Print Out Everything But shirt_id */

SELECCT shirt_id FROM shirts;


/* Update all polo shirts Change their size to  L */

UPDATE shirts SET shirt_size='L'
WHERE article='polo shirt';


/*
Update the shirt last worn 15 days ago
Change last_worn to 0
*/

UPDATE shirts SET last_worn=0
WHERE last_worn = 50;

/*
Update all white shirts
Change size to 'XS' and color to 'off white' */

UPDATE shirts SET shirt_size='XS', color ='off white'
WHERE color='white';

/* 
Delete all old shirts Last worn 200 days ago
*/
DELETE FROM shirts WHERE last_worn=200;


/* Delete all tank tops
Your tastes have changed...*/

DELETE FROM shirts WHERE article='tank top';

/*
Delete all shirts Catastrophe! */

DELETE FROM shirts WHERE 



-- 
INSERT INTO Customers(first_name,last_name,email) VALUES
	('Boy','George','george@gmail.com'),
	('George','Michael','gm@gmail.com'),
	('David','Bowie','david@gmail.com' ),
	('Blue','Steele','blue@gmail.com');


INSERT INTO Orders(order_date,	amount,	customer_id) VALUES
('2016/02/10',99.99,	1),
('2017/11/11',35.50	,1),
('2014/12/12',800.67,	2),
('2015/01/03',12.50	,2);
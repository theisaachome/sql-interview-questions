

-- No 1
SELECT *
FROM Users
ORDER BY created_at
LIMIT 5;

-- No 2 
SELECT 
	DAYNAME(created_at) AS Day,
    COUNT(*) AS total
FROM Users
GROUP BY Day 
ORDER BY total DESC;

-- No 3 
SELECT 
	Users.id, 
    username
FROM Users
LEFT JOIN  photos
	ON   Users.id = photos.user_id
WHERE photos.id IS NULL;

-- No 4

-- get all from photos JOIN with likes table where photos.id 
-- 
SELECT 
	username,
	photos.id,
	image_url,
    COUNT(*) AS total_like
FROM Photos
INNER JOIN Likes
	ON Photos.id = Likes.photo_id
INNER JOIN Users
	ON Photos.user_id = Users.id
GROUP BY photos.id
ORDER BY total_like DESC
LIMIT 1;

-- Our Investors want to know...
-- How many times does the average user post?

-- total number of photos / total number of users
SELECT (SELECT COUNT(*) FROM Photos ) / (SELECT COUNT(*) FROM Users) AS avg_posts_of_user;



--  A brand wants to know which hashtags to use in a post
-- What are the top 5 most commonly used hashtags?

SELECT 
	tags.tag_name,
    COUNT(*) AS no_of_used
FROM tags
INNER JOIN photo_tags
	ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY no_of_used DESC
LIMIT 5;


-- We have a small problem with bots on our site...
-- Find users who have liked every single photo on the site 


SELECT 
	username,
    COUNT(*) AS no_of_like
FROM Users
INNER JOIN likes
	On likes.user_id=Users.id
GROUP BY likes.user_id;







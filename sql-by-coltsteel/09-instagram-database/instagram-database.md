We want to reward our users who have been around the longest.  
Find the 5 oldest users.

```sql
SELECT *
FROM Users
ORDER BY created_at
LIMIT 5;
```

---

What day of the week do most users register on?  
We need to figure out when to schedule an ad campgain

```sql

SELECT
	DAYNAME(created_at) AS Day,
    COUNT(*) AS total
FROM Users
GROUP BY Day
ORDER BY total DESC;

```

---

We want to target our inactive users with an email campaign.
Find the users who have never posted a photo

```sql
SELECT
	Users.id,
    username
FROM Users
LEFT JOIN  photos
	ON   Users.id = photos.user_id
WHERE photos.id IS NULL;
```

---

We're running a new contest to see who can get the most likes on a single photo.

WHO WON??!!We're running a new contest to see who can get the most likes on a single photo.

WHO WON??!!

```sql
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
```

---

Our Investors want to know...

How many times does the average user post?

total number posts / total number of users

```sql

SELECT (SELECT COUNT(*) FROM Photos ) / (SELECT COUNT(*) FROM Users) AS avg_posts_of_user;

```

---

A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?

```sql
SELECT
	tags.tag_name,
    COUNT(*) AS no_of_used
FROM tags
INNER JOIN photo_tags
	ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY no_of_used DESC
LIMIT 5;
```

---

We have a small problem with bots on our site...
Find users who have liked every single photo on the site

```sql
SELECT
	username,
    COUNT(likes.user_id) AS num_likes
FROM Users
INNER JOIN likes
	On likes.user_id=Users.id
GROUP BY likes.user_id
HAVING num_likes=(SELECT COUNT(*) FROM Photos);
```

---

We also have a problem with celebrities Find users who have never commented on a photo.

```sql

```

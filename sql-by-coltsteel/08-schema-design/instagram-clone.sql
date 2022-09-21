DROP DATABASE ig_clone_db;
CREATE DATABASE ig_clone_db;
USE ig_clone_db;

CREATE TABLE Users(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT Now()
);

CREATE TABLE Photos(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(id)
);

CREATE TABLE Comments(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_texts VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY (photo_id) REFERENCES Photos(id)
);

CREATE TABLE Likes(
	user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY (photo_id) REFERENCES Photos(id),
    PRIMARY KEY(user_id,photo_id)
);

CREATE TABLE Follows(
	follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(follower_id) REFERENCES Users(id),
    FOREIGN KEY (followee_id) REFERENCES Users(id),
    PRIMARY KEY(follower_id,followee_id)
);


CREATE TABLE Tags(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_text VARCHAR(200) UNIQUE,
    created_at TIMESTAMP DEFAULT Now()
);

CREATE TABLE Photo_tags(
	photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES Photos(id),
    FOREIGN KEY(tag_id) REFERENCES Tags(id),
    PRIMARY KEY(photo_id,tag_id)
);
INSERT INTO Users(username) VALUES
('Isaachome'),
('May Ye Yint'),
('Pa Rian'),
('Michael');

INSERT INTO photos(image_url,user_id) VALUES
('https://picsum.photos/200/300',1),
('https://picsum.photos/200/300',2),
('https://picsum.photos/200/300',3),
('https://picsum.photos/200/300',4);

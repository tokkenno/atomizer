USE atomizer;

DROP TABLE IF EXISTS users_feeds;
DROP TABLE IF EXISTS users_items;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARBINARY(255) NOT NULL,
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (username)
);

DROP TABLE IF EXISTS feeds;
CREATE TABLE feeds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    remote_id VARCHAR(255) NOT NULL,
    web_url VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    created DATETIME,
    updated DATETIME,
    modified DATETIME,
    UNIQUE KEY (url)
) CHARSET=utf8mb4;

CREATE TABLE users_feeds (
    user_id INT NOT NULL,
    feed_id INT NOT NULL,
    PRIMARY KEY (user_id, feed_id),
    FOREIGN KEY fk_users_feeds_user(user_id) REFERENCES users(id),
    FOREIGN KEY fk_users_feeds_feed(feed_id) REFERENCES feeds(id)
) CHARSET=utf8mb4;

DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    remote_id VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    summary TINYTEXT,
    content TEXT,
    content_type VARCHAR(255), # xhtml, html...
    author VARCHAR(255),
    created DATETIME,
    updated DATETIME,
    modified DATETIME,
    UNIQUE KEY (remote_id)
) CHARSET=utf8mb4;

CREATE TABLE users_items (
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    read_later BOOLEAN NOT NULL DEFAULT FALSE,
    readed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY fk_users_items_user(user_id) REFERENCES users(id),
    FOREIGN KEY fk_users_items_item(item_id) REFERENCES items(id)
) CHARSET=utf8mb4;
    

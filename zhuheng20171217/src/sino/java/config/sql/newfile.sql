USE database_zh;

CREATE TABLE IF NOT EXISTS user(
	id int PRIMARY KEY auto_increment,
	name varchar(30),
	password varchar(30)
);
# JSP-Blog-for-Demo-Project
It is a Blog created using servlet and JSP for practice only

Requirements
1. Apache Tomcat Server 9.2
2. MySql
3. Java JDBC Driver for MySql

MySQL Credential
user : root
password : root


create database blog;
CREATE TABLE blog.users(
    id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100),
    userRole varchar(20),
    createDate timestamp
) engine=InnoDB default charset=utf8;

CREATE TABLE blog.post(
    id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    description varchar(300),
    content longtext,
    author varchar(100),
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references users (id),
    foreign key (author) references users (username)
) engine=InnoDB default charset=utf8;

CREATE TABLE blog.reply(
    id int primary key auto_increment,
    userId int,
    postId int,
    content varchar(300) not null,
    author varchar(100),
    createDate timestamp,
    foreign key (userId) references users (id) on delete set null,
    foreign key (postId) references post (id) on delete cascade,
    foreign key (author) references users (username) on delete cascade
) engine=InnoDB default charset=utf8;



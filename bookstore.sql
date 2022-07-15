create database bookstore;
use bookstore;

create table members (
    memberId int primary key,
    memberName varchar(100) not null,
    email varchar(100) not null,
    address varchar(250) not null,
    phone varchar(12) not null,
    walletbalance double not null,
    coupon varchar(25) not null
);

create table seller (
    sellerid int primary key,
    sellername varchar(100) not null,
    email varchar(100) unique not null,
    phone varchar(10) unique not null
);

create table books (
    bookid int primary key,
    title varchar(255) not null,
    price double not null,
    author varchar(100) not null,
    coverImage blob,
    genre varchar(100) not null,
    category varchar(25) not null,
    sellerId int not null
);

create table purchases (
    purchaseId int primary key,
    purchaseDate date not null,
    amount double not null,
    bookid int not null,
    sellerid int not null,
    memberid int not null,
    purchasestatus varchar(25) not null,
    quantity int not null
);

create table users (
    username varchar(100) primary key,
    passcode varchar(50) not null
);

alter table members modify email varchar(100) unique not null;
alter table members modify phone varchar(100) unique not null;
alter table books add constraint fk_seller foreign key (sellerid) references seller(sellerId);

alter table purchases add constraint fk_member foreign key(memberId) references members(memberId);
alter table purchases add constraint fk_book foreign key(bookId) references books(bookId);
alter table purchases add constraint fk_seller_1 foreign key (sellerid) references seller(sellerId);
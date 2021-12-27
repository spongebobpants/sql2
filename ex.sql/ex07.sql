select * from tab;
drop table author cascade constraints;
CREATE TABLE author (
    author_id NUMBER(10),
    author_name VARCHAR2(100) NOT NULL,
    author_desc VARCHAR2(500),
    PRIMARY KEY(author_id)
);

CREATE SEQUENCE seq_author_id
INCREMENT BY 1 
START WITH 1
NOCACHE;
SELECT * FROM USER_SEQUENCES;
INSERT INTO author
VALUES (seq_author_id.nextval, '박경리', '토지 작가 ' );
INSERT INTO author
VALUES (seq_author_id.nextval, '이문열', '삼국지 작가 ' );
INSERT INTO author
VALUES (seq_author_id.nextval, '강풀', '웹툰작가');
SELECT * FROM USER_SEQUENCES;
SELECT * FROM author;

commit;

drop table book cascade constraints;

create table book(--create table '테이블명( *테이블에 예약어 x
    book_id number, --컬럼명 자료형
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

select * from book;

--2.Alter
--컬럼 추가
--alter table 'table name' add('컬럼명' '자료형');
alter table book add (pubs varchar2(50));
--컬럼 수정
--alter table '테이블명' Modify();
alter table book modify(title varchar2(100));
--alter table '테이블명' Rename column '컬럼명');
--ㅇ컬럼 삭제
--alter table '테이블명' drop('컬럼명');
--alter table book drop(author);
alter table 

--3.Rename to
--테이블명 수정
--rename '테이블명'to '수정할 테이블명';
rename book to article;
----테이블 삭제
--drop table '테이블명'
drop table article;

--select * from article;

/*테이블 생성시 제약조건(옵션, 있어도 되고 없어도 됨)
not null:null값 입력 불가 ex)이름 등
unique :중복값 입력 불가(null값은 허용) ex)주민번호 등
primary key:not null+unique, 테이블당 1개만 설정 가능
*/

select * from book;
rename book to article;
drop table article;

create table book(
    book_id     number(10),
    title       varchar2(100)   not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    primary key(book_id),
    constraint book_fk foreign key  (author_id) -- constraint 테이블명_fk foreign key (본인테이블의 fk 컬럼)
    references author(author_id));--참조 pk가 있는 테이블명(컬럼명) create table book(
    
    select * from book;
    select * from author;
    
--insert 데이터 추가
--1.
insert into author
values (1,'박경리', '토지 작가');
--2.명시적 방법
insert into author(author_id, author_name)
values (2, '이문열');
insert into author
values(3, '기안84', '웹툰 작가');
--update
update author
set author_name='김경리'
where author_id=1;
--delete 
delete from author
where author_id=1;
delete from author;--all delete

select *
from user_sequences;
select * from author;
insert into author
values(seq_author_id.nextval, '박경리', '토지');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지');

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회
select seq_author_id.nextval
from dual;

--시퀀스 삭제
drop sequence seq_author_id;

select * from book;
select * from author;
select * from all tables;

select * from user_sequences;

--시퀀스 삭제
drop sequence seq_author_id;
drop sequence seq_book_id;

--데이터 삭제
delete from author;
delete from book;

--테이블 삭제
drop table book;
drop table author;

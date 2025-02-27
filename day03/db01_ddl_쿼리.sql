-- 데이터베이스 생성
CREATE DATABASE sample;

-- 데이터베이스 생성(CharSet, Collation 지정)
CREATE DATABASE smaple2
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci; 

-- 데이터베이스 변경
ALTER DATABASE sample
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- 데이터베이스 삭제
-- 운영DB에서 실행하면 퇴사각
DROP DATABASE sample2;

-- 테이블 생성
-- 3-34 NewBook 테이블을 생성하세요. 정수형은 Integer 사용, 문자형은 가변형인 Varchar를 사용하십시오.
-- 기본키를 설정합니다.
-- 기본키가 두개 이상일 경우 아래와 같이 작성해야
CREATE TABLE NewBook(
	bookId 		INTEGER,
    bookName	VARCHAR(255),
    publisher	VARCHAR(50),
    price		INTEGER,
    PRIMARY KEY		(bookid, publisher)
);

-- 기본키가 하나면 컬럼 하나에 작성가능. 기본키가 두개이상일 경우 
-- 컬럼에 PRIMARY KEY 두군데 이상 작성 불가
CREATE TABLE NewBook(
	bookId 		INTEGER PRIMARY KEY,
    bookName	VARCHAR(255),
    publisher	VARCHAR(50),
    price		INTEGER
);

DROP TABLE NewBook;

-- 테이블 생성시, 제약조건을 추가가능
-- bookname은 NULL을 가질 수 없고, publisher는 같은 값이 있으면 안됨.
-- price는 값이 입력되지 않은 경우 기본값인 10000을 저장
-- 최소가격은 1000원 이상으로 한다.
CREATE TABLE NewBook (
	bookid		INTEGER PRIMARY KEY,
    bookName	VARCHAR(255)  NOT NULL,
    publisher	VARCHAR(50)   UNIQUE,
    price		INTEGER		DEFAULT 10000 CHECK (price >= 1000),
    PRIMARY KEY (bookId)
);

-- 3-35 아래 속성의 NewCustomer 테이블을 생성하시오.
-- custid - INTEGER, 기본키alter
-- name - VARCHAR(100) NOT NULL
-- address - VARCHAR(255) NOT NULL
-- phone - VARCHAR(30) NOT NULL
CREATE TABLE NewCustomer (
	custid  integer primary key,
    name	varchar(100) not null,
    aderess varchar(255) not null,
    phone   varchar(30) not null
);

-- 3-36 다음과 같은 속성의 NewOrders를 생성하시오.
-- orderid - INTEGER, PRIMARY KEY
-- bookid - INTEGER, NOT NULL, FORIEGNKEY(NewBook bookid)
-- custid - INTEGER, NOT NULL, FK(NewCustomer custid)
-- saleprice - INTEGER
-- orderdate - date
CREATE TABLE NewOrders(
	orderid		integer,
    bookid		integer	not null,
    custid		integer not null,
    saleprice	integer,
    orderdate	date,
    PRIMARY KEY(orderid),
    FOREIGN KEY(bookid) references NewBook(bookid) ON DELETE CASCADE,
    FOREIGN KEY(custid) references NewCustomer(custid) ON DELETE CASCADE
);

-- ALTER
-- NewBook 테이블에 VARCHAR(13)의 isbn 속성을 추가하시오.
ALTER TABLE NewBook ADD isbn VARCHAR(13);

-- 3-38 NewBook에 isbn 데이터타입을 integer로 변경하시오.
ALTER TABLE NewBook MODIFY isbn INTEGER;

-- 3-38 NewBook에 publisher의 제약 사항을 NOT NULL로 변경합니다.
ALTER TABLE NewBook MODIFY publisher VARCHAR(100) NOT NULL;

-- DROP (조심, 조심)
-- 3-42 NewBook 테이블 삭제하시오.
-- 관계에서 부모테이블은 자식테이블을 지우기전에 삭제할 수 없음!
DROP TABLE NewBook;

DROP TABLE NewOrders;


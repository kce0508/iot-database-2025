-- INSERT
-- 3-44 Book 테이블에 '스포츠 의학' 도서를 추가하세요. 한솔의학서적에서 출간했고, 90,000원입니다.
INSERT INTO Book (bookid, bookname, publisher, price)
VALUES (11, '스포츠 의학', '한솔의학서적', 90000);

SELECT * FROM Book;

-- 컬럼명 생략
INSERT INTO Book VALUES (12, '스타워즈 아트북', '디즈니', 1500000);

INSERT INTO Book VALUES (12, '어벤져스 스토리', '디즈니', 500000);

-- 다중 데이터 입력
INSERT INTO Book (bookid, bookname, publisher, price)
VALUES (13, '기타교본 1', '지미 핸드릭스', 12000),
	   (14, '기타교본 2', '지미 핸드릭스', 12000),
	   (15, '기타교본 3', '지미 핸드릭스', 15000);

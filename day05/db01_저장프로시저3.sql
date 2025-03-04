-- 5-3 : Book 테이블에 저장된 도서 평균 가격 반환 프로시저
DELIMITER //
-- 파라미터 IN - 값을 프로시저로 전달
-- 파라미터 OUT - 프로시저에서 리턴값을 보내는 매개변수
CREATE PROCEDURE AveragePrice(
   OUT Val INTEGER   
)
BEGIN
   SELECT AVG(price) INTO Val
      FROM Book WHERE price IS NOT NULL;
END;
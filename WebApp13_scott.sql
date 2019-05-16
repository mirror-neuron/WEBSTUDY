SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM SALGRADE;
--==>>
/*
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/


--○ 샘플 데이터 입력(SALGRADE)
INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(6, '10000', '11000');
INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(7, '11001', '12000');
INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(8, '12001', '13000');
INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(9, '13001', '14000');
INSERT INTO SALGRADE(GRADE, LOSAL, HISAL) VALUES(10, '14001', '15000');

--○ 확인
SELECT GRADE, LOSAL, HISAL FROM SALGRADE ORDER BY GRADE
;

--○ 급여 등급 수 확인
SELECT COUNT(*) AS COUNT 
FROM SALGRADE;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM SALGRADE WHERE GRADE='1'
;
--==>> 5

--○ 급여 등급 정보 검색(GRADE)
SELECT GRADE, LOSAL, HISAL
FROM SALGRADE 
WHERE GRADE='1';
--> 한 줄 구성
SELECT GRADE, LOSAL, HISAL FROM SALGRADE WHERE GRADE='1'
;
--==>> 1	700	1200

--○ 급여 등급 정보 수정
UPDATE SALGRADE
SET LOSAL='500', HISAL='1200'
WHERE GRADE='1';
--> 한 줄 구성
UPDATE SALGRADE SET LOSAL='500', HISAL='1200' WHERE GRADE=1
;


--○ 급여 등급 정보 삭제
DELETE 
FROM SALGRADE
WHERE GRADE='1';
--> 한 줄 구성
DELETE FROM SALGRADE WHERE GRADE='1'
;

--○ 롤백
ROLLBACK;

--○ 커밋
COMMIT;

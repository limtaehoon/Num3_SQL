--시퀀스
--unique한 값을 생성해주는 오라클 "객체"        중복x,기본키 쓸때 
--테이블과 는 독립적으로 저장되고 생성된다 (테이블과 무관)
CREATE SEQUENCE 시퀀스1;--생성
DROP SEQUENCE 시퀀스1;--삭제
--시퀀스이름으로 시퀀스 정보출력
SELECT *FROM USER_SEQUENCES 
WHERE SEQUENCE_NAME ='시퀀스1';

--시퀀스테스트 듀얼 테이블에서
SELECT 시퀀스1.NEXTVAL FROM DUAL;--스퀀스 시용.NEXTVAL
SELECT 시퀀스1.CURRVAL FROM DUAL;--스퀀스의 현재값 (값을 증가하지 않고 현재값)

--시퀀스 테스트용 테이블 생성 
CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);
--이름만 입력하면 자동으로 입력됨
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스1.NEXTVAL,'영업부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스1.NEXTVAL,'개발부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스1.NEXTVAL,'회계부');
COMMIT;--영구 저장
SELECT
    *
FROM 부서_테스트;

--시퀀스 옵션사용 
--시퀀스2 생성 -시작값을 10 증가값을 10
CREATE SEQUENCE 시퀀스2
START WITH 10           --10번부터 증가시작
INCREMENT BY 20;        --증가값이 20

DELETE FROM 부서_테스트;--부서테스트 의 모든행 삭제
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스2.NEXTVAL,'영업부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스2.NEXTVAL,'개발부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스2.NEXTVAL,'회계부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스2.NEXTVAL,'마케팅부');
INSERT INTO 부서_테스트 (부서번호 ,부서이름)
VALUES (시퀀스2.NEXTVAL,'교육부');
COMMIT;

SELECT * FROM 부서_테스트;

--시퀀스1로 부서번호를 업데이트
UPDATE 부서_테스트
SET 부서번호 = 시퀀스1.NEXTVAL;
--테이블 삭제
DROP TABLE 부서_테스트;
DROP SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스2;
DROP TABLE DEPT CASCADE CONSTRAINTS;--CONSTRAINTS:제약조건도 같이 삭제하라
DROP TABLE EMP;
DROP TABLE EMP1;
DROP TABLE EMP2;
DROP TABLE E_EMP2;
DROP TABLE EX_DATE;
DROP TABLE 직원테이블;
DROP TABLE STMANS;
DROP TABLE MEMBERS;

create table class(
cno varchar2(2),
cname varchar(50)
);
insert into class VALUES('01','데이터 베이스');
insert into class VALUES('02','프로그래밍');

CREATE TABLE student(
sno VARCHAR2(4),
sname VARCHAR2(50),
cno VARCHAR2(2)
);
INSERT INTO student VALUES('0414','홍길동','01');
INSERT INTO student VALUES('0415','임꺽정','02');
INSERT INTO student VALUES('0416','이순신','03');
commit;

--클래스테이블에 기본키 추가 
ALTER TABLE class
ADD CONSTRAINT class_con_pk PRIMARY KEY (cno);
--클래스 테이블에 유니크 키를 추가 
ALTER TABLE class
add constraint class_cname_uk UNIQUE (cname);

-- 제약조건 조회 명령문
SELECT *
FROM ALL_CONSTRAINTS -- 모든 제약조건
WHERE table_name = 'CLASS'; -- 테이블명 입력(대문자)

-- 학생 테이블에 기본키 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY (sno);
-- 학생 테이블에 sname 에 NOT NULL 추가
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- 학생 테이블에 외래키 추가
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES class (cno);
SELECT * FROM student;
--제약 조건을 추가할때 이미 만들어진 테이블에 각행의 데이터가 만족해야
--제약조건이 추가된다.
SELECT * FROM class;
UPDATE student set cno ='01'
WHERE sno ='0416';

--제약조건 삭제
--테이블당 primary는 하나만 있어서 primary라고 적으면 지워짐 
--unique는 지정 해야됨 
--cascade" :외래키도 같이 삭제됨 
--제약조건으로 삭제
ALTER TABLE class;
DROP CONSTRAINT class_cno_pk cascade;

ALTER TABLE class
DROP UNIQUE(cname);--클레스 테이블의 cname열 유니크제약조건 삭제
ALTER TABLE student;
DROP primary key;--기본키 삭제


--테이블 삭제 
DROP TABLE class;
DROP TABLE student;
DROP TABLE class CASCADE CONSTRAINT;

---------------------------------------------------------------------

--테이블 컬럼(열의 추가와 삭제
--90번 부서의 직원들을 E_EMP에 입력
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary,department_id
FROM employees
WHERE department_id = 90;
DROP TABLE E_EMP;
--열의 이름은 지정해서 E_EMP2 테이블 작성

CREATE TABLE E_EMP2 (emp_id,name,sal,dest_id)
AS
SELECT employee_id, last_name, salary,department_id
FROM employees
WHERE department_id = 90;
SELECT *FROM E_EMP2;
--열추가
ALTER TABLE E_EMP
ADD (GENDER VARCHAR2(1));
--디폴트값을 0으로 하는 열추가 
ALTER TABLE E_EMP
ADD(커미션 NUMBER DEFAULT 0 NOT NULL);
--두개의 열의 추가 
ALTER TABLE E_EMP
ADD(날짜 DATE DEFAULT sysdate, 제작자 VARCHAR(100) DEFAULT user);
select * from E_EMP;

--열의 수정
--100>200 사이즈 변경
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR(200));
DESC E_EMP;
--200>50 사이즈 변경
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR(50));
--50>1 사이즈 변경(에러)
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR(1));
-----HR은 2BYTE 라고 되어있는데 1로 줄이면 에러가 난다-----
--데이터 유형 수정(에러)
ALTER TABLE E_EMP
MODIFY (제작자 NUMBER );-----이미문자형데터가 있기 때문에 숫자형으로 바꿀수 없다

--데이터 유형변경 가능한 경우
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER);--NULL 값인 경우에 입력된 값이 없기 때문에 테이터 형식을 바꿀수 있음 

--제작자의 사이즈를 바꾸려하면 
UPDATE E_EMP
SET 제작자=NULL;

--열을 삭제
ALTER TABLE E_EMP
DROP COLUMN 제작자;--제작자 열삭제
--여러열 삭제 
ALTER TABLE E_EMP
DROP(GENDER,커미션,날짜);




SELECT * FROM E_EMP;

--열의 이름 수정
ALTER TABLE E_EMP
RENAME COLUMN department_id TO 부서번호;
ALTER TABLE E_EMP
RENAME COLUMN salary TO 급여;
ALTER TABLE E_EMP
RENAME COLUMN employee_id TO 직원번호 ;
ALTER TABLE E_EMP
RENAME COLUMN last_name TO 이름;

--테이블 이름번경
RENAME E_EMP TO 직원테이블 ;



--예제 EMPLOYEES 테이블의 JOB_IDRK 'ST_MAN'인 직원들을 새테이블 stmans를 
--만들어 입력하라 단,테이블의 컬럼이름은 id,job,sal(직원테이블의 employees_id
--job_id,salary)
CREATE TABLE STMANS(employee_id, job_id, salary)
AS
SELECT  id, job,sal
FROM employees
WHERE job_name ='ST_MAN';
SELECT
    *
FROM STMANS;
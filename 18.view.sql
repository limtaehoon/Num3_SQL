--단순한 뷰 만들기 EMP_V1
--하나의 원본데이터를 사용,함수나 그룹 사용안함 DML 사용가능
DROP VIEW EMP_V1;--미리 뷰 삭제 변경

--employees 테이블에서 필요한 열들을 골라서 부로 생성
CREATE VIEW EMP_V1
AS
SELECT  employee_id, last_name, email, hire_date, job_id
FROM employees;

--테이블처럼 select 문 사용 
SELECT * FROM emp_v1;
desc emp_v1;
--테이블처럼 dml사용가능 (뷰는 가상의 테이블->원본 테이블에 입력됨)
INSERT INTO EMP_V1(employee_id, last_name, email, hire_date, job_id)
VALUES (333,'David','DAVID',SYSDATE,'IT_PROG');
--뷰에 입력된 데이터확인 
SELECT * FROM EMP_V1;
SELECT * FROM employees;
DESC employees;

--삭제하기 
DELETE FROM emp_v1
WHERE employee_id= 333;
COMMIT;

--두번째뷰 (이름넣기)
CREATE VIEW EMP_V2
AS
SELECT employee_id 직원번호, last_name 이름,email,hire_date,job_id
FROM employees;
SELECT*FROM emp_v2;

--세번째뷰
CREATE VIEW emp_v3(직원번호,이름,이메일,고용일자,직종)
AS
SELECT employee_id, last_name,email,hire_date,job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM EMP_V3;
SELECT*FROM employees;

--DML사용 3번째 뷰에서 
INSERT INTO EMP_V3(직원번호,이름,이메일,고용일자,직종)
VALUES(334,'lala','LALA',SYSDATE,'IT_PROG');

--복잡한 뷰만들기 
--그룹함수를 아용한 뷰는 DML 사용불가
CREATE OR REPLACE VIEW 부서별_직원_보고서 --OR REPLACE :삭제없이 수정 가능
AS
SELECT department_id 부서번호,COUNT(employee_id)직원수,
        MAX(salary)최고급여, MIN(salary)최저급여,
        ROUND (AVG(salary))평균급여
FROM employees
GROUP BY department_id
ORDER By 부서번호;
SELECT * FROM 부서별_직원_보고서;

--INSERT INTO 부서별_직원_보고서;
--VALUES (200,4,5000,1000);--그룹함수를 이용해서 DML을 만들기에 그룸합수이용불가
--------------
--읽기 전용 뷰(옵션 WITH READ ONLY)
CREATE OR REPLACE VIEW EMP_V_READ
AS
SELECT employee_id, last_name,email,hire_date,job_id
FROM employees
WHERE department_id =90
WITH READ ONLY ;--읽기 전용 

SELECT * FROM EMP_V_READ;
--DML 사용불가 
DELETE FROM EMP_V_READ;--읽기전용이라서 볼수는 있지만 수정불가

--체크옵션 뷰
CREATE OR REPLACE VIEW EMP_V_CHECK
AS
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id =90
WITH CHECK OPTION; --WHERE절의 조건에서만 수정및 입력가능

SELECT * FROM EMP_V_CHECK;
--90분 부서일때만 DML 가능
INSERT INTO EMP_V_CHECK(employee_id, last_name,email,
                        hire_date,job_id, department_id)
VALUES (444,'알리','ALI',SYSDATE,'IT_PROG',90);


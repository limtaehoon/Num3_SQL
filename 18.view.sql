--�ܼ��� �� ����� EMP_V1
--�ϳ��� ���������͸� ���,�Լ��� �׷� ������ DML ��밡��
DROP VIEW EMP_V1;--�̸� �� ���� ����

--employees ���̺��� �ʿ��� ������ ��� �η� ����
CREATE VIEW EMP_V1
AS
SELECT  employee_id, last_name, email, hire_date, job_id
FROM employees;

--���̺�ó�� select �� ��� 
SELECT * FROM emp_v1;
desc emp_v1;
--���̺�ó�� dml��밡�� (��� ������ ���̺�->���� ���̺� �Էµ�)
INSERT INTO EMP_V1(employee_id, last_name, email, hire_date, job_id)
VALUES (333,'David','DAVID',SYSDATE,'IT_PROG');
--�信 �Էµ� ������Ȯ�� 
SELECT * FROM EMP_V1;
SELECT * FROM employees;
DESC employees;

--�����ϱ� 
DELETE FROM emp_v1
WHERE employee_id= 333;
COMMIT;

--�ι�°�� (�̸��ֱ�)
CREATE VIEW EMP_V2
AS
SELECT employee_id ������ȣ, last_name �̸�,email,hire_date,job_id
FROM employees;
SELECT*FROM emp_v2;

--����°��
CREATE VIEW emp_v3(������ȣ,�̸�,�̸���,�������,����)
AS
SELECT employee_id, last_name,email,hire_date,job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM EMP_V3;
SELECT*FROM employees;

--DML��� 3��° �信�� 
INSERT INTO EMP_V3(������ȣ,�̸�,�̸���,�������,����)
VALUES(334,'lala','LALA',SYSDATE,'IT_PROG');

--������ �丸��� 
--�׷��Լ��� �ƿ��� ��� DML ���Ұ�
CREATE OR REPLACE VIEW �μ���_����_���� --OR REPLACE :�������� ���� ����
AS
SELECT department_id �μ���ȣ,COUNT(employee_id)������,
        MAX(salary)�ְ�޿�, MIN(salary)�����޿�,
        ROUND (AVG(salary))��ձ޿�
FROM employees
GROUP BY department_id
ORDER By �μ���ȣ;
SELECT * FROM �μ���_����_����;

--INSERT INTO �μ���_����_����;
--VALUES (200,4,5000,1000);--�׷��Լ��� �̿��ؼ� DML�� ����⿡ �׷��ռ��̿�Ұ�
--------------
--�б� ���� ��(�ɼ� WITH READ ONLY)
CREATE OR REPLACE VIEW EMP_V_READ
AS
SELECT employee_id, last_name,email,hire_date,job_id
FROM employees
WHERE department_id =90
WITH READ ONLY ;--�б� ���� 

SELECT * FROM EMP_V_READ;
--DML ���Ұ� 
DELETE FROM EMP_V_READ;--�б������̶� ������ ������ �����Ұ�

--üũ�ɼ� ��
CREATE OR REPLACE VIEW EMP_V_CHECK
AS
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id =90
WITH CHECK OPTION; --WHERE���� ���ǿ����� ������ �Է°���

SELECT * FROM EMP_V_CHECK;
--90�� �μ��϶��� DML ����
INSERT INTO EMP_V_CHECK(employee_id, last_name,email,
                        hire_date,job_id, department_id)
VALUES (444,'�˸�','ALI',SYSDATE,'IT_PROG',90);


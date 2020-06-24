create table class(
cno varchar2(2),
cname varchar(50)
);
insert into class VALUES('01','������ ���̽�');
insert into class VALUES('02','���α׷���');

CREATE TABLE student(
sno VARCHAR2(4),
sname VARCHAR2(50),
cno VARCHAR2(2)
);
INSERT INTO student VALUES('0414','ȫ�浿','01');
INSERT INTO student VALUES('0415','�Ӳ���','02');
INSERT INTO student VALUES('0416','�̼���','03');
commit;

--Ŭ�������̺� �⺻Ű �߰� 
ALTER TABLE class
ADD CONSTRAINT class_con_pk PRIMARY KEY (cno);
--Ŭ���� ���̺� ����ũ Ű�� �߰� 
ALTER TABLE class
add constraint class_cname_uk UNIQUE (cname);

-- �������� ��ȸ ��ɹ�
SELECT *
FROM ALL_CONSTRAINTS -- ��� ��������
WHERE table_name = 'CLASS'; -- ���̺�� �Է�(�빮��)

-- �л� ���̺� �⺻Ű �߰�
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY (sno);
-- �л� ���̺� sname �� NOT NULL �߰�
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- �л� ���̺� �ܷ�Ű �߰�
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES class (cno);
SELECT * FROM student;
--���� ������ �߰��Ҷ� �̹� ������� ���̺� ������ �����Ͱ� �����ؾ�
--���������� �߰��ȴ�.
SELECT * FROM class;
UPDATE student set cno ='01'
WHERE sno ='0416';

--�������� ����
--���̺�� primary�� �ϳ��� �־ primary��� ������ ������ 
--unique�� ���� �ؾߵ� 
--cascade" :�ܷ�Ű�� ���� ������ 
--������������ ����
ALTER TABLE class;
DROP CONSTRAINT class_cno_pk cascade;

ALTER TABLE class
DROP UNIQUE(cname);--Ŭ���� ���̺��� cname�� ����ũ�������� ����
ALTER TABLE student;
DROP primary key;--�⺻Ű ����


--���̺� ���� 
DROP TABLE class;
DROP TABLE student;
DROP TABLE class CASCADE CONSTRAINT;

---------------------------------------------------------------------

--���̺� �÷�(���� �߰��� ����
--90�� �μ��� �������� E_EMP�� �Է�
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary,department_id
FROM employees
WHERE department_id = 90;
DROP TABLE E_EMP;
--���� �̸��� �����ؼ� E_EMP2 ���̺� �ۼ�

CREATE TABLE E_EMP2 (emp_id,name,sal,dest_id)
AS
SELECT employee_id, last_name, salary,department_id
FROM employees
WHERE department_id = 90;
SELECT *FROM E_EMP2;
--���߰�
ALTER TABLE E_EMP
ADD (GENDER VARCHAR2(1));
--����Ʈ���� 0���� �ϴ� ���߰� 
ALTER TABLE E_EMP
ADD(Ŀ�̼� NUMBER DEFAULT 0 NOT NULL);
--�ΰ��� ���� �߰� 
ALTER TABLE E_EMP
ADD(��¥ DATE DEFAULT sysdate, ������ VARCHAR(100) DEFAULT user);
select * from E_EMP;

--���� ����
--100>200 ������ ����
ALTER TABLE E_EMP
MODIFY (������ VARCHAR(200));
DESC E_EMP;
--200>50 ������ ����
ALTER TABLE E_EMP
MODIFY (������ VARCHAR(50));
--50>1 ������ ����(����)
ALTER TABLE E_EMP
MODIFY (������ VARCHAR(1));
-----HR�� 2BYTE ��� �Ǿ��ִµ� 1�� ���̸� ������ ����-----
--������ ���� ����(����)
ALTER TABLE E_EMP
MODIFY (������ NUMBER );-----�̹̹��������Ͱ� �ֱ� ������ ���������� �ٲܼ� ����

--������ �������� ������ ���
ALTER TABLE E_EMP
MODIFY (GENDER NUMBER);--NULL ���� ��쿡 �Էµ� ���� ���� ������ ������ ������ �ٲܼ� ���� 

--�������� ����� �ٲٷ��ϸ� 
UPDATE E_EMP
SET ������=NULL;

--���� ����
ALTER TABLE E_EMP
DROP COLUMN ������;--������ ������
--������ ���� 
ALTER TABLE E_EMP
DROP(GENDER,Ŀ�̼�,��¥);




SELECT * FROM E_EMP;

--���� �̸� ����
ALTER TABLE E_EMP
RENAME COLUMN department_id TO �μ���ȣ;
ALTER TABLE E_EMP
RENAME COLUMN salary TO �޿�;
ALTER TABLE E_EMP
RENAME COLUMN employee_id TO ������ȣ ;
ALTER TABLE E_EMP
RENAME COLUMN last_name TO �̸�;

--���̺� �̸�����
RENAME E_EMP TO �������̺� ;



--���� EMPLOYEES ���̺��� JOB_IDRK 'ST_MAN'�� �������� �����̺� stmans�� 
--����� �Է��϶� ��,���̺��� �÷��̸��� id,job,sal(�������̺��� employees_id
--job_id,salary)
CREATE TABLE STMANS(employee_id, job_id, salary)
AS
SELECT  id, job,sal
FROM employees
WHERE job_name ='ST_MAN';
SELECT
    *
FROM STMANS;
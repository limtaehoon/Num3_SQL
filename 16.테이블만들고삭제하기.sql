--���̺� �����
CREATE TABLE ex_date( --CREATE TABLE: BD�� ���̺� �����ϴ� �� EX_DATE :���̺� �̸�
        ex_id NUMBER(2),--ex_id:���� �̸�  NUMBER(2):���̹� Ÿ��
        start_date date DEFAULT sysdate --DEFAULT: �Է��� �����ǰų������� �⺻�Է°����� ���ǵȴ�
        --����Ʈ�� �Է¾ȵɽ� Ƽ��Ʈ ���� ������ 
 );
 --���ǻ���:1.���̺� �̸� ����� �� Į������ ,�� �����ϰ� ()�� ����
 --       2.�����̺�ȿ��� Į���̸��� �ߺ��Ұ�,�ٸ����̺�� �̸��ߺ��Ұ�
 INSERT  INTO ex_date(ex_id)
 VALUES (1);--
  INSERT  INTO ex_date(ex_id)
 VALUES (2);
  INSERT  INTO ex_date(ex_id)
 VALUES (3);
 COMMIT;
  SELECT * FROM ex_date;
DESC ex_date;

-- ���̺� �����ϱ� DROP TABLE
DROP TABLE COMP;
DROP TABLE COPY_EMP;

--����1 PRODUCT_ID(number Ÿ��),product_name (varchar2 Ÿ��,20�ڸ�),
--menu_date(date Ÿ��) ���� �ִ� sample_prduct �̸��� ���̺��� �����϶� 
CREATE TABLE sample_product(
         PRODUCT_ID  number,
         product_name varchar2(20),
         menu_date date
         );
Desc sample_product;

--����2 ������ ���� ���̺��� ����
DROP TABLE sample_product;

--���̺��� ��������
--  1.NOT NULL: ���� NULL������ ���� �ȵ�
--  2.UNIQUE KEY: ���̺��� ����࿡�� ������ ���� ���Ǵ� ���������� ���� =(�ߺ��Ұ�)
--  3.PRIMARY KEY(�⺻Ű): �ش翭�� �ݵ�� ���ϰ� �����ؾߵ� =(NOT NILL +UNIQUE KEY)
--  4.FOREIGN KEY(�ܷ�Ű): �ѿ��� ������ ���̺��� �� ���� �ܷ�Ű ����� ����
--  5.CHECK: �ش翭�� ���尡���� ������ ���� ������ ���� ���� ��)BETWEEN


CREATE TABLE emp(
        eno    number(3) CONSTRAINT emp_eno_pk PRIMARY KEY,   
        --CONSTRAINT :���������̸� PRIMARY KEY ��������
        emp_name varchar2(20)
        );
desc emp;
INSERT INTO emp
VALUES (2,'��');    --2,���� 2,�ڰ� �ߺ��Ǽ� ����
SELECT *FROM emp;
DROP TABLE emp;

--�������� ���̺� �Ʒ��Ѷ� �������ǿ� ����� �������� �����ֱ� (eno)
CREATE TABLE emp(
        eno    number(3),   
        emp_name varchar2(20),
        CONSTRAINT emp_eno_pk PRIMARY KEY(eno)
        );
--���������� �̸�����
CREATE TABLE emp1(
        eno    number(3) PRIMARY KEY,   
        emp_name varchar2(20)
        );
INSERT INTO emp1
VALUES(1,'��');--������ ���� ���뿡�� HR.SYS�� �ڵ����� ����� �� ��������

DROP TABLE emp1;
--not null/uk����ũ
CREATE TABLE emp1(
       eno       number(3),
       emp_name  VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
       email     VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);
--not null �� null���� �Է��Ҽ� ���� 
INSERT INTO emp1
VALUES(1,null,'hong@naver.com');
desc emp1;
--uk ����ũ�� ������ ���� �Էµ� �� ���� 
INSERT INTO emp1
VALUES (1,'ȫ�浿','hong@naver.com');
INSERT INTO emp1
VALUES (2,'������','hong@naver.com');

CREATE TABLE emp2(
        eno NUMBER(3),
        emp_name  VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
        sal       NUMBER(10),
        CONSTRAINT emp2_sal_check CHECK(sal>1000)
        );
INSERT INTO emp2
VALUES(1,'ȫ�浿',1999);--sal�� 1000���� Ŀ�� �Էµ�

DROP TABLE emp;
CREATE TABLE emp(
        eno NUMBER(4) PRIMARY KEY,
        --�������� �̸� ����
        ename VARCHAR2(20) not null,
        --�̸��� �ߺ� ���� not null:�𸣸� �ȵ�
        gno VARCHAR2(13) UNIQUE CHECK(length(gno)>=8),
        --CHECK(length(gno)>=8):���̰�8�ڸ� �̻� UNIQUE : �ߺ�������
        gender VARCHAR2(5) CHECK(gender IN('woman','man'))
        --gender IN('woman','man') :�����ϳ��� �����ϱ�
        );
INSERT INTO emp VALUES(3,'��','1234567890','man');
INSERT INTO emp VALUES(2,'��','123456789','woman');

--���� 1 members ��� �����̺��� ������
CREATE TABLE members(
        member_id       NUMBER(2)        PRIMARY KEY,
                        --�������� �̸� ����
        first_name      VARCHAR2(50)     not null,
                        --NULL�� �ԷºҰ�
        last_name       VARCHAR2(50)     not null,
                        --NULL�� �ԷºҰ�
        gender          VARCHAR2(5)      CHECK(gender IN('man','woman')),
                        --���� �ϳ� ����
        birth_day       date             DEFAULT sysdate,
                        --����Ʈ �� SYSDATE �����ɽ� ����ð�����
        email           VARCHAR(200)     UNIQUE NOT NULL
                        --�ߺ��Ұ�,NULL�� �ԷºҰ� 
        );
DROP TABLE DEPT;
--���� ����:�ܷ�Ű(FK)
CREATE TABLE DEPT(
        dno     NUMBER(4),
        dname   VARCHAR2(20),
        CONSTRAINT dept_dno_pk PRIMARY KEY(dno)
        );
DROP TABLE EMP;

CREATE TABLE EMP(
    eno NUMBER(4),
    emp_name VARCHAR2(20),
    sal NUMBER(4),
    dno NUMBER(4),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno),
    CONSTRAINT emp_dno_fk FOREIGN KEY(dno) --FOREIGN KEY :�ܷ�Ű ����
    --REFERENCES DEPT(dno) ON DELETE CASCADE
    REFERENCES DEPT(dno)ON DELETE SET NULL
    --REFERENCES : ���� dept

);
insert into dept values (10,'TEST1');
insert into dept values (20,'TEST2');
insert into dept values (30,'TEST3');
insert into dept values (40,'TEST4');
insert into dept values (50,'TEST5');
insert into dept values (60,'TEST6');
SELECT * FROM DEPT;

INSERT INTO EMP VALUES(1010,'Kim',200,10);
INSERT INTO EMP VALUES(1020,'Kim',180,20);
INSERT INTO EMP VALUES(1030,'Hong',220,30);
INSERT INTO EMP VALUES(1040,'Lee',250,40);
INSERT INTO EMP VALUES(1050,'oh',300,50);
INSERT INTO EMP VALUES(1060,'Kang',500,60);

SELECT * FROM EMP;


--�ܷ�Ű�� �������� �� ���̿ܿ��� �ԷºҰ�
insert into EMP values (1060,'Kang'500,60);
--null�� ���� 
insert into EMP values (1060,'Kang'500,null);


--������
DELETE FROM DEPT--����: �����ϰ� �ִµ� �����ϸ� ���� �Ұ� ���������� �����ȵ�
WHERE dno =40;
--�������1:������ ������ �ڵ�����
--ON DELETE CASCADE �־��༭ ���� ����
--�������2: ������ ������ �ڵ� �ΰ�
--ON DELETE SET NULL


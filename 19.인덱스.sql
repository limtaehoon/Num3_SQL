    SELECT
        TABLE_NAME ���̺��,
        INTDEX_NAME �ε�����,
        COLUMN_NAME �÷��̸�
    FROM ALL_IND_COLUMN --����Ŭ���� �ڵ� ������
    WHERE TABLE_NAME ='DEPARTMENT';--���̺��̸��� �빮�ڷ�
DROP TABLE MEMBERS;
--�ǽ����� ���̺����
CREATE TABLE members (
        member_id INT,
        first_name VARCHAR2(100) NOT NULL,
        last_name VARCHAR2(100) NOT NULL,
        gender CHAR(1) NOT NULL,
        dob DATE NOT NULL,
        email VARCHAR2(255) NOT NULL,
        PRIMARY KEY(MEMBER_id)
    );
  --�ε��� Ȯ��
  SELECT
        TABLE_NAME ,
        INDEX_NAME ,
        COLUMN_NAME 
    FROM ALL_IND_COLUMNS 
    WHERE TABLE_NAME ='MEMBERS'; 
    
    SELECT * FROM members
    WHERE last_name ='Harse'; --���̺���ü�˻�
    
    EXPLAIN PLAN FOR--���������� select ���� �����Ͽ� ���� �ۼ�
    SELECT * FROM members
    WHERE last_name ='Harse';
    
    SELECT PLAN_TABLE_OUTPUT--������ ���
    FROM TABLE(DBMS_XPLAN.DISPLAY());
    --------���������
    --�ε��������  
    CREATE INDEX member_last_name_i
    on members(last_name); 
    
    --�ε��� ���� 
    drop INDEX member_last_name_i;
    --���� ���� ������� members  ���̺��� first_name �� last_name��
    --��Ƽ �ε����� ���� �Ʒ��� �׸�ó���� �ε������� ��ȸ�� ������ �����
    --����϶�

    SELECT*
    FROM members
    WHERE first_name like 'M%' and last_name like 'A%';
    
    --��Ƽ �ε��� �����
    CREATE INDEX name_i
    ON member(first_name,last_name);
    --������     
    EXPLAIN PLAN FOR--���������� select ���� �����Ͽ� ���� �ۼ�
    SELECT * FROM members
    WHERE first_name like 'M%' and last_name like 'A%';
    
    SELECT PLAN_TABLE_OUTPUT--������ ���
    FROM TABLE(DBMS_XPLAN.DISPLAY());
    --�ε��� ���� �ϱ�
    drop INDEX name_i;
    
    

    
--������
--unique�� ���� �������ִ� ����Ŭ "��ü"        �ߺ�x,�⺻Ű ���� 
--���̺�� �� ���������� ����ǰ� �����ȴ� (���̺�� ����)
CREATE SEQUENCE ������1;--����
DROP SEQUENCE ������1;--����
--�������̸����� ������ �������
SELECT *FROM USER_SEQUENCES 
WHERE SEQUENCE_NAME ='������1';

--�������׽�Ʈ ��� ���̺���
SELECT ������1.NEXTVAL FROM DUAL;--������ �ÿ�.NEXTVAL
SELECT ������1.CURRVAL FROM DUAL;--�������� ���簪 (���� �������� �ʰ� ���簪)

--������ �׽�Ʈ�� ���̺� ���� 
CREATE TABLE �μ�_�׽�Ʈ (
    �μ���ȣ NUMBER PRIMARY KEY,
    �μ��̸� VARCHAR2(100)
);
--�̸��� �Է��ϸ� �ڵ����� �Էµ�
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������1.NEXTVAL,'������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������1.NEXTVAL,'���ߺ�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������1.NEXTVAL,'ȸ���');
COMMIT;--���� ����
SELECT
    *
FROM �μ�_�׽�Ʈ;

--������ �ɼǻ�� 
--������2 ���� -���۰��� 10 �������� 10
CREATE SEQUENCE ������2
START WITH 10           --10������ ��������
INCREMENT BY 20;        --�������� 20

DELETE FROM �μ�_�׽�Ʈ;--�μ��׽�Ʈ �� ����� ����
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������2.NEXTVAL,'������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������2.NEXTVAL,'���ߺ�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������2.NEXTVAL,'ȸ���');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������2.NEXTVAL,'�����ú�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ ,�μ��̸�)
VALUES (������2.NEXTVAL,'������');
COMMIT;

SELECT * FROM �μ�_�׽�Ʈ;

--������1�� �μ���ȣ�� ������Ʈ
UPDATE �μ�_�׽�Ʈ
SET �μ���ȣ = ������1.NEXTVAL;
--���̺� ����
DROP TABLE �μ�_�׽�Ʈ;
DROP SEQUENCE ������1;
DROP SEQUENCE ������2;
DROP TABLE DEPT CASCADE CONSTRAINTS;--CONSTRAINTS:�������ǵ� ���� �����϶�
DROP TABLE EMP;
DROP TABLE EMP1;
DROP TABLE EMP2;
DROP TABLE E_EMP2;
DROP TABLE EX_DATE;
DROP TABLE �������̺�;
DROP TABLE STMANS;
DROP TABLE MEMBERS;

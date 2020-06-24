--테이블 만들기
CREATE TABLE ex_date( --CREATE TABLE: BD와 테이블 생성하는 것 EX_DATE :테이블 이름
        ex_id NUMBER(2),--ex_id:열의 이름  NUMBER(2):데이버 타입
        start_date date DEFAULT sysdate --DEFAULT: 입력이 누락되거나없으면 기본입력값으로 정의된다
        --디폴트는 입력안될시 티폴트 뒤의 값으로 
 );
 --주의사항:1.테이블 이름 만들고 각 칼럼들은 ,로 구분하고 ()로 묶기
 --       2.한테이블안에서 칼럼이름은 중복불가,다른테이블과 이름중복불가
 INSERT  INTO ex_date(ex_id)
 VALUES (1);--
  INSERT  INTO ex_date(ex_id)
 VALUES (2);
  INSERT  INTO ex_date(ex_id)
 VALUES (3);
 COMMIT;
  SELECT * FROM ex_date;
DESC ex_date;

-- 테이블 삭제하기 DROP TABLE
DROP TABLE COMP;
DROP TABLE COPY_EMP;

--예제1 PRODUCT_ID(number 타입),product_name (varchar2 타입,20자리),
--menu_date(date 타입) 열이 있는 sample_prduct 이름의 테이블을 생성하라 
CREATE TABLE sample_product(
         PRODUCT_ID  number,
         product_name varchar2(20),
         menu_date date
         );
Desc sample_product;

--예제2 위에서 만든 테이블을 삭제
DROP TABLE sample_product;

--테이블의 제약조건
--  1.NOT NULL: 열이 NULL값으로 지정 안됨
--  2.UNIQUE KEY: 테이블의 모든행에서 고유한 값을 열또는 열조합으로 지정 =(중복불가)
--  3.PRIMARY KEY(기본키): 해당열은 반드시 존하고 유일해야됨 =(NOT NILL +UNIQUE KEY)
--  4.FOREIGN KEY(외래키): 한열과 참조된 테이블의 열 간의 외래키 관계로 생성
--  5.CHECK: 해당열에 저장가능한 데이터 값의 범위나 조건 지정 예)BETWEEN


CREATE TABLE emp(
        eno    number(3) CONSTRAINT emp_eno_pk PRIMARY KEY,   
        --CONSTRAINT :제약조건이름 PRIMARY KEY 제약조건
        emp_name varchar2(20)
        );
desc emp;
INSERT INTO emp
VALUES (2,'양');    --2,양은 2,박과 중복되서 오류
SELECT *FROM emp;
DROP TABLE emp;

--제약조건 테이블 아래둘때 제약조건에 어디의 제약인지 적어주기 (eno)
CREATE TABLE emp(
        eno    number(3),   
        emp_name varchar2(20),
        CONSTRAINT emp_eno_pk PRIMARY KEY(eno)
        );
--제약조건의 이름없이
CREATE TABLE emp1(
        eno    number(3) PRIMARY KEY,   
        emp_name varchar2(20)
        );
INSERT INTO emp1
VALUES(1,'박');--에러남 에러 내용에서 HR.SYS는 자동으로 만들어 준 제약조건

DROP TABLE emp1;
--not null/uk유니크
CREATE TABLE emp1(
       eno       number(3),
       emp_name  VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
       email     VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);
--not null 은 null값을 입력할수 없다 
INSERT INTO emp1
VALUES(1,null,'hong@naver.com');
desc emp1;
--uk 유니크는 동일한 값이 입력될 수 없다 
INSERT INTO emp1
VALUES (1,'홍길동','hong@naver.com');
INSERT INTO emp1
VALUES (2,'김유신','hong@naver.com');

CREATE TABLE emp2(
        eno NUMBER(3),
        emp_name  VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
        sal       NUMBER(10),
        CONSTRAINT emp2_sal_check CHECK(sal>1000)
        );
INSERT INTO emp2
VALUES(1,'홍길동',1999);--sal은 1000보다 커야 입력됨

DROP TABLE emp;
CREATE TABLE emp(
        eno NUMBER(4) PRIMARY KEY,
        --제약조건 이름 생략
        ename VARCHAR2(20) not null,
        --이름은 중복 가능 not null:모르면 안됨
        gno VARCHAR2(13) UNIQUE CHECK(length(gno)>=8),
        --CHECK(length(gno)>=8):길이가8자리 이상에 UNIQUE : 중복허용안함
        gender VARCHAR2(5) CHECK(gender IN('woman','man'))
        --gender IN('woman','man') :둘중하나는 선택하기
        );
INSERT INTO emp VALUES(3,'김','1234567890','man');
INSERT INTO emp VALUES(2,'강','123456789','woman');

--예제 1 members 라는 새테이블을 만들어라
CREATE TABLE members(
        member_id       NUMBER(2)        PRIMARY KEY,
                        --제약조건 이름 생략
        first_name      VARCHAR2(50)     not null,
                        --NULL값 입력불가
        last_name       VARCHAR2(50)     not null,
                        --NULL갑 입력불가
        gender          VARCHAR2(5)      CHECK(gender IN('man','woman')),
                        --둘중 하나 선택
        birth_day       date             DEFAULT sysdate,
                        --디폴트 값 SYSDATE 누락될시 현재시간으로
        email           VARCHAR(200)     UNIQUE NOT NULL
                        --중복불가,NULL값 입력불가 
        );
DROP TABLE DEPT;
--제약 조건:외래키(FK)
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
    CONSTRAINT emp_dno_fk FOREIGN KEY(dno) --FOREIGN KEY :외래키 설정
    --REFERENCES DEPT(dno) ON DELETE CASCADE
    REFERENCES DEPT(dno)ON DELETE SET NULL
    --REFERENCES : 참조 dept

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


--외래키는 참조열의 값 값이외에는 입력불가
insert into EMP values (1060,'Kang'500,60);
--null은 가능 
insert into EMP values (1060,'Kang'500,null);


--삭제시
DELETE FROM DEPT--오류: 참조하고 있는데 삭제하면 참고 할게 없어짐으로 삭제안됨
WHERE dno =40;
--삭제방법1:참조행 삭제시 자동삭제
--ON DELETE CASCADE 넣어줘서 삭제 가능
--삭제방법2: 참조행 삭제시 자동 널값
--ON DELETE SET NULL


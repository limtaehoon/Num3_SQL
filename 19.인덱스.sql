    SELECT
        TABLE_NAME 테이블명,
        INTDEX_NAME 인덱스명,
        COLUMN_NAME 컬럼이름
    FROM ALL_IND_COLUMN --오라클에서 자동 생성됨
    WHERE TABLE_NAME ='DEPARTMENT';--테이블이름을 대문자로
DROP TABLE MEMBERS;
--실습으로 테이블만들기
CREATE TABLE members (
        member_id INT,
        first_name VARCHAR2(100) NOT NULL,
        last_name VARCHAR2(100) NOT NULL,
        gender CHAR(1) NOT NULL,
        dob DATE NOT NULL,
        email VARCHAR2(255) NOT NULL,
        PRIMARY KEY(MEMBER_id)
    );
  --인덱스 확인
  SELECT
        TABLE_NAME ,
        INDEX_NAME ,
        COLUMN_NAME 
    FROM ALL_IND_COLUMNS 
    WHERE TABLE_NAME ='MEMBERS'; 
    
    SELECT * FROM members
    WHERE last_name ='Harse'; --테이블전체검색
    
    EXPLAIN PLAN FOR--다음나오는 select 문을 실행하여 보고서 작성
    SELECT * FROM members
    WHERE last_name ='Harse';
    
    SELECT PLAN_TABLE_OUTPUT--설명문을 출력
    FROM TABLE(DBMS_XPLAN.DISPLAY());
    --------설명문출력하
    --인덱스만들기  
    CREATE INDEX member_last_name_i
    on members(last_name); 
    
    --인덱스 삭제 
    drop INDEX member_last_name_i;
    --예제 위의 문법대로 members  테이블의 first_name 과 last_name의
    --멀티 인덱스를 만들어서 아래의 그림처럼의 인덱스들의 조회및 성능평가 결과를
    --출력하라

    SELECT*
    FROM members
    WHERE first_name like 'M%' and last_name like 'A%';
    
    --멀티 인덱스 만들기
    CREATE INDEX name_i
    ON member(first_name,last_name);
    --성능평가     
    EXPLAIN PLAN FOR--다음나오는 select 문을 실행하여 보고서 작성
    SELECT * FROM members
    WHERE first_name like 'M%' and last_name like 'A%';
    
    SELECT PLAN_TABLE_OUTPUT--설명문을 출력
    FROM TABLE(DBMS_XPLAN.DISPLAY());
    --인덱스 삭제 하기
    drop INDEX name_i;
    
    

    
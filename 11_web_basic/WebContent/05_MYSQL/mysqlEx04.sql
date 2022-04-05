/*

	# 연습환경 셋팅작업
    
		> 파일탐색기열기 > '내PC' 우 클릭 > '속성' 클릭 > '고급시스템 설정' 클릭
        > (고급탭에서) '환경변수' 클릭 > (시스템변수에서) path클릭 
        > 새로만들기 클릭 
        > C:\Program Files\MySQL\MySQL Server 8.0\bin 입력후 확인
        
        > cmd를 관리자 권한으로 실행
        > test_db-master폴더의 위치를 복사해 놓고 cd 명령어로 디비연습폴더로 이동
          (예시) cd C:\Users\user\Desktop\test_db-master\test_db-master
        > mysql -u root -p -t <employees.sql 명령어 입력
          비밀번호 1234 입력후 (30~40초 대기후 로드 완료 메세지 확인)
		> Mysqlworkbench에서 새로고침 클릭 
        > employees 스키마를 확인
        > 끝


*/

USE EMPLOYEES;

# 예시 1) EMPLOYEES 사원의 사원번호 , 이름 조회하기.
SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES;

# 예시 2) DEPARTMENTS테이블의 전체 데이터 조회하기.
SELECT
		*
FROM
		DEPARTMENTS;

# 예시 3) SALARIES테이블의 SALARY , 3.3%세금 공제후 SALARY 조회
SELECT
		SALARY,
        SALARY * 0.033,
        SALARY - SALARY * 0.033,
        SALARY * 0.033 				AS TAX,   # AS 키워드를 이용하여 컬럼명을 지정할 수 있다.
        SALARY - SALARY * 0.033		AFTER_TAX # AS 키워드는 생략가능.
FROM
		SALARIES;


/*
	DISTINCT : 중복 제거 키워드
*/
		
# 예시 4) 각사원들의 직함을 중복되지않게 가져오기.
SELECT
		TITLE
FROM
		TITLES;
SELECT DISTINCT
		TITLE
FROM
		TITLES;   
 
 /*
 
	LIMIT : 특정 개수만큼 조회하기
    
    [ 형식 ]
	LIMIT x 	: x row만 조회
	LIMIT x,y   : x번째 부터 y row만 조회
    
    Ex)
		LIMIT 3      : 3row만 조회
		LIMIT 12     : 12row만 조회
		LIMIT 10,3   : 10번째부터 3row만 조회
		LIMIT 100,10 : 100번째부터 10row만 조회
        
 */
SELECT
		*
FROM
		EMPLOYEES;
        
SELECT
		*
FROM
		EMPLOYEES
LIMIT
		10;
        
SELECT
		*
FROM
		EMPLOYEES
LIMIT
		10 , 7;
        
        
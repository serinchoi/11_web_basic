/*

	# 조인(JOIN) 
    
		- 조인은 두 개 이상의 테이블을 결합하는 연산이다.
		- 각 테이블은 각자에 맞는 데이터를 저장하고 있는데, 서로 다른 테이블에서 데이터를 가져오려면 조인 연산을 해야 한다.
		- 주로 주키(PRIMARY KEY)와 참조키(FOREIGN KEY)를 기준으로 테이블을 결합한다.
        - 대표적인 조인은 INNER , LEFT(LEFT OUTER), RIGHT(RIGHT OUTER) 조인이 있다.
		- 주로 테이블명은 별칭을 사용한다.
        - INNER JOIN은 INNER를 생략한 JOIN으로 사용가능하다.        Ex) INNER JOIN , JOIN
        - LEFT JOIN은 OUTER를 생략한 LEFT JOIN으로 사용가능하다.    Ex) LEFT OUTER JOIN , LEFT JOIN
        - RIGHT JOIN은 OUTER를 생략한 RIGHT JOIN으로 사용가능하다.  Ex) RIGHT OUTER JOIN , RIGHT JOIN
   
		[형식]
		
		SELECT
				*
		FROM
				(TABLE1 ALIAS)
			INNER(LEFT,RIGHT) JOIN (TABLE2 ALIAS)
								ON (CONDITION)

*/

# INNER JOIN , LEFT JOIN , RIGHT JOIN 테스트를 위한 데이터 셋업
CREATE TABLE T_BANK (
	BANK_CD VARCHAR(10),
    BANK_NM VARCHAR(10)
);


CREATE TABLE T_TAX (
    IDX 		 INT,
	BANK_CD 	 VARCHAR(10) ,
    TAX 		 INT,
    DEPOSIT_DATE VARCHAR(20)
);

INSERT INTO T_BANK VALUES("SH" , "신한은행");
INSERT INTO T_BANK VALUES("NH" , "농협은행");
INSERT INTO T_BANK VALUES("KB" , "국민은행");
INSERT INTO T_BANK VALUES("WR" , "우리은행");
INSERT INTO T_BANK VALUES("HN" , "하나은행");


INSERT INTO T_TAX VALUES(1  ,"SH" , 5000000 , '2020-12-12');
INSERT INTO T_TAX VALUES(2 , "NH" , 3000000 , '2020-12-23');
INSERT INTO T_TAX VALUES(3 , "KB" , 7000000 , '2020-12-30');
INSERT INTO T_TAX VALUES(4 , "ETC" , 10000 , '2020-12-31');

SELECT * FROM T_BANK;
SELECT * FROM T_TAX;

# 1. WHERE 절을 이용한 테이블의 JOIN
SELECT
		BANK_NM,
        TAX
FROM
		T_BANK,
        T_TAX
WHERE 
		T_BANK.BANK_CD = T_TAX.BANK_CD;
        

SELECT	
		T_BANK.BANK_CD,  # 중복으로 인하여 컬럼명앞에 테이블명을 붙인다.
		T_BANK.BANK_NM,  # 관용적으로 모든 컬럼명에 테이블명을 붙인다.
        T_Tax.TAX
FROM
		T_BANK,
        T_TAX
WHERE 
		T_BANK.BANK_CD = T_TAX.BANK_CD;

# 2. 별칭을 추가

SELECT	
		B.BANK_CD AS BANK_CD,  # 실무에서 관리적 차원에서 ALIAS를 사용한다.
		B.BANK_NM AS BANK_NM,  
        T.TAX     TAX          # AS 키워드는 생략 가능.
FROM
		T_BANK AS B,
		T_TAX T                # AS 키워드는 생략 가능.
WHERE 
		B.BANK_CD = T.BANK_CD;

# 3. INNER JOIN 사용예시
SELECT
		*
FROM
		T_BANK B
	INNER JOIN T_TAX T
			ON B.BANK_CD = T.BANK_CD;

SELECT
		B.*,
        T.TAX
FROM
		T_BANK B
		  JOIN T_TAX T                    # INNER 키워드는 생략가능.
			ON B.BANK_CD = T.BANK_CD
		   AND T.TAX >= 5000000; 


# 4. LEFT JOIN 사용예시
SELECT
		*
FROM
		 T_BANK B
LEFT OUTER JOIN T_TAX T
			 ON B.BANK_CD = T.BANK_CD;

SELECT
		*
FROM
		 T_BANK B
      LEFT JOIN T_TAX T                 # OUTER 키워드는 생략가능.
			 ON B.BANK_CD = T.BANK_CD;


# 5. RIGHT JOIN 사용예시
SELECT
		*
FROM
		  T_BANK B
RIGHT OUTER JOIN T_TAX T
			  ON B.BANK_CD = T.BANK_CD;

SELECT
		*
FROM
		  T_BANK B
      RIGHT JOIN T_TAX T
			  ON B.BANK_CD = T.BANK_CD;


1. 자격증 테이블
drop table license;
delete from license;

CREATE TABLE license ( -- 자격증 테이블
  lc_no       NUMBER(7)     NOT NULL, -- 글 번호
  lc_id       VARCHAR2(100)   NOT NULL UNIQUE, -- 이메일
  lc_nick     VARCHAR2(40)   NOT NULL, -- 닉네임
  lc_title    VARCHAR2(120)  NOT NULL, -- 제목
  lc_content  VARCHAR2(4000) NOT NULL, -- 내용
  lc_file    VARCHAR2(100)   NULL,     -- 사진
  lc_cal     VARCHAR2(100)   NULL,     -- 일정
  lc_url     VARCHAR2(1000)  NULL,      -- URL
  lc_date    DATE       NOT NULL,  -- 등록 시간
  PRIMARY KEY (lc_no)         -- 한번 등록된 값은 중복 안됨
);

2. 레코드 삽입
INSERT INTO license(lc_no, lc_id, lc_password, lc_nick, lc_title, lc_content, 
lc_file, lc_cal, lc_url, lc_date)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),'demoncode@naver.com', 1234, '생일선물은 죽빵',
'테스트', '테스트', '테스트', '2016-10-06', 'www.naver.com', sysdate);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '여행', 2);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '캠핑', 3);
  
3. 전체목록 검색
select * from license;

4. 수정
UPDATE license
SET lc_nick='', lc_title='', lc_content=''
WHERE lc_no=1;



CREATE TABLE license ( -- 자격증 테이블
  lc_no       NUMBER(7)     NOT NULL, -- 글 번호
  lc_nick     VARCHAR2(40)   NOT NULL, -- 닉네임
  lc_title    VARCHAR2(120)  NOT NULL, -- 제목
  lc_content  VARCHAR2(4000) NOT NULL, -- 내용
  lc_date    DATE       NOT NULL,  -- 등록 시간
  PRIMARY KEY (lc_no)         -- 한번 등록된 값은 중복 안됨
);

-- 전체 목록
SELECT lc_no, lc_nick, lc_title, lc_content, lc_date
FROM license
ORDER BY lc_no ASC;


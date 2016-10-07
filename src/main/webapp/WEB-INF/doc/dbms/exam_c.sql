
2. 기출문제 테이블
CREATE TABLE exam ( -- 기출문제 테이블
  ex_no       NUMBER(7)     NOT NULL, -- 글 번호
  ex_id       VARCHAR(100)   NOT NULL UNIQUE, -- 이메일
  ex_password   VARCHAR2(20)   NOT NULL, -- 비밀번호
  ex_nick     VARCHAR2(40)   NOT NULL, -- 닉네임
  ex_title    VARCHAR(120)  NOT NULL, -- 제목
  ex_content  VARCHAR(4000) NOT NULL, -- 내용
  ex_file    VARCHAR(100)   NULL,     -- 사진, 파일
  ex_url     VARCHAR(1000)  NULL,      -- URL
  ex_date    DATE       NOT NULL,  -- 등록 시간
  PRIMARY KEY (ex_no)         -- 한번 등록된 값은 중복 안됨
);
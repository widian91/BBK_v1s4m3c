CREATE TABLE contest ( -- 공모전 테이블
  cn_no       NUMBER(7)     NOT NULL, -- 글 번호
  cn_id       VARCHAR(100)   NOT NULL UNIQUE, -- 이메일
  cn_password   VARCHAR2(20)   NOT NULL, -- 비밀번호
  cn_nick     VARCHAR2(40)   NOT NULL, -- 닉네임
  cn_title    VARCHAR(120)  NOT NULL, -- 제목
  cn_content  VARCHAR(4000) NOT NULL, -- 내용
  cn_file    VARCHAR(100)   NULL,     -- 사진, 파일
  cn_cal     VARCHAR(100)   NULL,     -- 일정
  cn_date    DATE       NOT NULL,  -- 등록 시간
  PRIMARY KEY (cn_no)         -- 한번 등록된 값은 중복 안됨
);
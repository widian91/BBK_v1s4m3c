1. �ڰ��� ���̺�
drop table license;
delete from license;

CREATE TABLE license ( -- �ڰ��� ���̺�
  lc_no       NUMBER(7)     NOT NULL, -- �� ��ȣ
  lc_id       VARCHAR2(100)   NOT NULL UNIQUE, -- �̸���
  lc_nick     VARCHAR2(40)   NOT NULL, -- �г���
  lc_title    VARCHAR2(120)  NOT NULL, -- ����
  lc_content  VARCHAR2(4000) NOT NULL, -- ����
  lc_file    VARCHAR2(100)   NULL,     -- ����
  lc_cal     VARCHAR2(100)   NULL,     -- ����
  lc_url     VARCHAR2(1000)  NULL,      -- URL
  lc_date    DATE       NOT NULL,  -- ��� �ð�
  PRIMARY KEY (lc_no)         -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);

2. ���ڵ� ����
INSERT INTO license(lc_no, lc_id, lc_password, lc_nick, lc_title, lc_content, 
lc_file, lc_cal, lc_url, lc_date)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),'demoncode@naver.com', 1234, '���ϼ����� �׻�',
'�׽�Ʈ', '�׽�Ʈ', '�׽�Ʈ', '2016-10-06', 'www.naver.com', sysdate);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  '����', 2);
 
INSERT INTO code(codeno, sort, seqno)
VALUES((SELECT NVL(MAX(codeno), 0)+1 as codeno FROM code),
  'ķ��', 3);
  
3. ��ü��� �˻�
select * from license;

4. ����
UPDATE license
SET lc_nick='', lc_title='', lc_content=''
WHERE lc_no=1;



CREATE TABLE license ( -- �ڰ��� ���̺�
  lc_no       NUMBER(7)     NOT NULL, -- �� ��ȣ
  lc_nick     VARCHAR2(40)   NOT NULL, -- �г���
  lc_title    VARCHAR2(120)  NOT NULL, -- ����
  lc_content  VARCHAR2(4000) NOT NULL, -- ����
  lc_date    DATE       NOT NULL,  -- ��� �ð�
  PRIMARY KEY (lc_no)         -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);

-- ��ü ���
SELECT lc_no, lc_nick, lc_title, lc_content, lc_date
FROM license
ORDER BY lc_no ASC;


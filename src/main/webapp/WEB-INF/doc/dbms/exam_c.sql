
2. ���⹮�� ���̺�
CREATE TABLE exam ( -- ���⹮�� ���̺�
  ex_no       NUMBER(7)     NOT NULL, -- �� ��ȣ
  ex_id       VARCHAR(100)   NOT NULL UNIQUE, -- �̸���
  ex_password   VARCHAR2(20)   NOT NULL, -- ��й�ȣ
  ex_nick     VARCHAR2(40)   NOT NULL, -- �г���
  ex_title    VARCHAR(120)  NOT NULL, -- ����
  ex_content  VARCHAR(4000) NOT NULL, -- ����
  ex_file    VARCHAR(100)   NULL,     -- ����, ����
  ex_url     VARCHAR(1000)  NULL,      -- URL
  ex_date    DATE       NOT NULL,  -- ��� �ð�
  PRIMARY KEY (ex_no)         -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
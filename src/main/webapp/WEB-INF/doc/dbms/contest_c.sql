CREATE TABLE contest ( -- ������ ���̺�
  cn_no       NUMBER(7)     NOT NULL, -- �� ��ȣ
  cn_id       VARCHAR(100)   NOT NULL UNIQUE, -- �̸���
  cn_password   VARCHAR2(20)   NOT NULL, -- ��й�ȣ
  cn_nick     VARCHAR2(40)   NOT NULL, -- �г���
  cn_title    VARCHAR(120)  NOT NULL, -- ����
  cn_content  VARCHAR(4000) NOT NULL, -- ����
  cn_file    VARCHAR(100)   NULL,     -- ����, ����
  cn_cal     VARCHAR(100)   NULL,     -- ����
  cn_date    DATE       NOT NULL,  -- ��� �ð�
  PRIMARY KEY (cn_no)         -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);
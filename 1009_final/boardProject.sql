DROP TABLE users cascade constraint
DROP TABLE board cascade constraint
DROP TABLE boardreply cascade constraint
DROP TABLE test cascade constraint
DROP TABLE testreply cascade constraint

SELECT * FROM users;
SELECT * FROM board;
SELECT * FROM boardreply;
SELECT * FROM test;
SELECT * FROM testreply;

/* ���� ============================================*/
CREATE TABLE users(
   usernum INT PRIMARY KEY,
   name VARCHAR(15) NOT NULL,
   id VARCHAR(50) NOT NULL,
   pw VARCHAR(50) NOT NULL,
   phone VARCHAR(25) NOT NULL,
   gender VARCHAR(5) NOT NULL,
   email VARCHAR(255) NOT NULL,
   addr VARCHAR(255) NOT NULL,
   birth VARCHAR(30) NOT NULL,
   iconid VARCHAR(30) NOT NULL
);

/* ����  ============================================*/
CREATE TABLE board(
   bid INT PRIMARY KEY,
   usernum int NOT NULL,
   bctgr VARCHAR(50) NOT NULL,
   btitle VARCHAR(100) NOT NULL,
   bcontent VARCHAR(4000) NOT NULL,
   bwriter VARCHAR(50) NOT NULL,
   bdate DATE DEFAULT SYSDATE,
   bhit INT DEFAULT 0,
   blang VARCHAR(20),
   recnt INT DEFAULT 0,
   CONSTRAINT board_cons FOREIGN KEY (usernum) REFERENCES users(usernum) ON DELETE CASCADE
);

/* ���� ���  ============================================*/
CREATE TABLE boardreply(

   rid INT PRIMARY KEY,
   bid INT NOT NULL,
   usernum INT NOT NULL,
   rcontent VARCHAR(255) NOT NULL,
   rdate DATE DEFAULT SYSDATE,
   deleteat VARCHAR(1) DEFAULT 'N',
   rwriter VARCHAR(20) NOT NULL,
   parentid INT NOT NULL,
   CONSTRAINT b_id_cons FOREIGN KEY (bid) REFERENCES board(bid) ON DELETE CASCADE,
   CONSTRAINT user_num_cons2 FOREIGN KEY (usernum) REFERENCES users(usernum) ON DELETE CASCADE
);

/* �׽�Ʈ  ============================================*/
CREATE TABLE test(
   tid INT PRIMARY KEY,
   usernum int NOT NULL,
   ttitle VARCHAR(100) NOT NULL,
   tcontent VARCHAR(4000) NOT NULL,
   tanswer VARCHAR(4000) NOT NULL,
   tex VARCHAR(225) NOT NULL,
   twriter VARCHAR(50) NOT NULL,
   tdate DATE DEFAULT SYSDATE,
   thit int DEFAULT 0,
   tlang VARCHAR(20) NOT NULL,
   recnt int DEFAULT 0,
   CONSTRAINT user_num_cons FOREIGN KEY (usernum) REFERENCES users(usernum) ON DELETE CASCADE
);

/* �׽�Ʈ ��� ============================================*/
CREATE TABLE testreply(
	rid INT PRIMARY KEY, -- ��� ��ȣ
	tid INT NOT NULL, -- TEST�Խñ� ��ȣ
	usernum INT NOT NULL, -- ȸ����ȣ
	rcontent VARCHAR(225) NOT NULL, -- ���/���� ���� 
	rdate DATE DEFAULT SYSDATE, -- ���/���� �ۼ���
	deleteat VARCHAR(1) DEFAULT 'N', -- ��� ���� ����
	rwriter VARCHAR(20) NOT NULL, -- �ۼ��� == ID
	parentid INT NOT NULL, -- ���� Ȯ��
	CONSTRAINT t_id_cons FOREIGN KEY (tid) REFERENCES test(tid) ON DELETE CASCADE,
	CONSTRAINT user_num_cons3 FOREIGN KEY (usernum) REFERENCES users(usernum) ON DELETE CASCADE
);

/* ���� ���� =====================================================================================================================*/
INSERT INTO USERS VALUES (1, '��浿', 'kim', '1234', '01012341234', 'M', 'xxssgg120@naver.com', '��⵵ ������', '19960205', '1');
INSERT INTO USERS VALUES (2, 'ȫ�浿', 'hong', '1234', '01012345678', 'F', 'asdf1234@naver.com', '��⵵ �Ⱦ��', '19991021', '2');


/* ���� ���� =====================================================================================================================*/
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','�Խñ�1','�Խñ� ����1','kim','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','�Խñ�2','�Խñ� ����2','hong','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','�Խñ�3','�Խñ� ����3','kim','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','�Խñ�4','�Խñ� ����4','hong','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','�Խñ�5','�Խñ� ����5','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','�Խñ�6','�Խñ� ����6','hong','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','�Խñ�7','�Խñ� ����7','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','�Խñ�8','�Խñ� ����8','kim','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','�Խñ�9','�Խñ� ����9','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','�Խñ�10','�Խñ� ����10','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����1','�Խñ� ����11','kim','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'question','����2','�Խñ� ����12','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����3','�Խñ� ����13','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����4','�Խñ� ����14','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����5','�Խñ� ����15','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����6','�Խñ� ����16','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����7','�Խñ� ����17','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','����8','�Խñ� ����18','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','��������1','�Խñ� ����19','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','��������2','�Խñ� ����20','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','��������3','�Խñ� ����21','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','��������4','�Խñ� ����22','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','��������5','�Խñ� ����23','kim','C');


/* ���� ��� ���� =====================================================================================================================*/
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,2,'���1','hong',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'���2','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'����1','hong',1);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'����2','kim',1);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'���3','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'���5','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'���6','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'���7','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'���8','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'���9','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'���10','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'���11','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'���12','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'����3','kim',1);


/* �׽�Ʈ ���� =====================================================================================================================*/
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����1','����1','��1','���1','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����2','����2','��2','���2','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����3','����3','��3','���3','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����4','����4','��4','���4','kim','C#');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����5','����5','��5','���5','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����6','����6','��6','���6','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����7','����7','��7','���7','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����8','����8','��8','���8','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����9','����9','��9','���9','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����10','����10','��10','���10','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����11','����11','��11','���11','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����12','����12','��12','���12','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����13','����13','��13','���13','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����14','����14','��14','���14','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����15','����15','��15','���15','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����16','����16','��16','���16','kim','C#');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����17','����17','��17','���17','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����18','����18','��18','���18','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����19','����19','��19','���19','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����20','����20','��20','���20','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����21','����21','��21','���21','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����22','����22','��22','���22','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'����23','����23','��23','���23','kim','C#');


/* �׽�Ʈ ��� ���� =====================================================================================================================*/
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���1','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���1_���1','kim',1);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���2','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���2_���1','kim',3);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���3','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���4','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���5','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���6','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,2,'���7','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,2,'���8','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���9','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���10','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���11','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,2,'���12','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'���13','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'���14','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'���15','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'���16','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'���17','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'���18','kim',0);


UPDATE BOARDREPLY SET RCONTENT='hellp tw' WHERE RID=1


ALTER TABLE Test ADD(rating number); 

select * from select(select rating=round(rating,2) from test where tid=1 ) test where tid=1;

ALTER TABLE Test MODIFY (rating DEFAULT 0.0);

update test set rating=5.3657 where tid=1;


-----------------------------------------------------
-- �������� �÷� �߰� 
ALTER TABLE Test ADD (ttotal INT DEFAULT 0);
-- �������� �÷� �߰� 
ALTER TABLE Test ADD (tsubmit INT DEFAULT 0);
-- ���� �÷� �߰�
ALTER TABLE Test ADD (trating number DEFAULT 0);
-----------------------------------------------------



update test set trating= round(total/submit,2) where tid=1;

-- �÷��� ����
ALTER TABLE Test RENAME COLUMN total TO ttotal;
ALTER TABLE Test RENAME COLUMN submit TO tsubmit;

ALTER TABLE Test DROP COLUMN trating;





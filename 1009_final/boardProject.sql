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

/* 유저 ============================================*/
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

/* 보드  ============================================*/
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

/* 보드 댓글  ============================================*/
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

/* 테스트  ============================================*/
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

/* 테스트 댓글 ============================================*/
CREATE TABLE testreply(
	rid INT PRIMARY KEY, -- 댓글 번호
	tid INT NOT NULL, -- TEST게시글 번호
	usernum INT NOT NULL, -- 회원번호
	rcontent VARCHAR(225) NOT NULL, -- 댓글/대댓글 내용 
	rdate DATE DEFAULT SYSDATE, -- 댓글/대댓글 작성일
	deleteat VARCHAR(1) DEFAULT 'N', -- 댓글 삭제 유무
	rwriter VARCHAR(20) NOT NULL, -- 작성자 == ID
	parentid INT NOT NULL, -- 대댓글 확인
	CONSTRAINT t_id_cons FOREIGN KEY (tid) REFERENCES test(tid) ON DELETE CASCADE,
	CONSTRAINT user_num_cons3 FOREIGN KEY (usernum) REFERENCES users(usernum) ON DELETE CASCADE
);

/* 유저 샘플 =====================================================================================================================*/
INSERT INTO USERS VALUES (1, '김길동', 'kim', '1234', '01012341234', 'M', 'xxssgg120@naver.com', '경기도 군포시', '19960205', '1');
INSERT INTO USERS VALUES (2, '홍길동', 'hong', '1234', '01012345678', 'F', 'asdf1234@naver.com', '경기도 안양시', '19991021', '2');


/* 보드 샘플 =====================================================================================================================*/
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','게시글1','게시글 내용1','kim','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','게시글2','게시글 내용2','hong','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','게시글3','게시글 내용3','kim','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','게시글4','게시글 내용4','hong','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','게시글5','게시글 내용5','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','게시글6','게시글 내용6','hong','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','게시글7','게시글 내용7','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','게시글8','게시글 내용8','kim','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'board','게시글9','게시글 내용9','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'board','게시글10','게시글 내용10','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문1','게시글 내용11','kim','C#');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),2,'question','질문2','게시글 내용12','hong','JAVA');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문3','게시글 내용13','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문4','게시글 내용14','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문5','게시글 내용15','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문6','게시글 내용16','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문7','게시글 내용17','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'question','질문8','게시글 내용18','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','공지사항1','게시글 내용19','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','공지사항2','게시글 내용20','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','공지사항3','게시글 내용21','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','공지사항4','게시글 내용22','kim','C');
INSERT INTO board(bid, usernum, bctgr, btitle, bcontent, bwriter, blang) VALUES((SELECT NVL(MAX(bid), 0)+1 FROM board),1,'announce','공지사항5','게시글 내용23','kim','C');


/* 보드 댓글 샘플 =====================================================================================================================*/
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,2,'댓글1','hong',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'댓글2','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'대댓글1','hong',1);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'대댓글2','kim',1);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'댓글3','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'댓글5','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'댓글6','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'댓글7','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'댓글8','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'댓글9','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'댓글10','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'댓글11','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),2,1,'댓글12','kim',0);
INSERT INTO boardreply (rid, bid, usernum, rcontent, rwriter, parentid) VALUES((SELECT NVL(MAX(rid), 0)+1 FROM boardreply),1,1,'대댓글3','kim',1);


/* 테스트 샘플 =====================================================================================================================*/
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제1','내용1','답1','출력1','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제2','내용2','답2','출력2','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제3','내용3','답3','출력3','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제4','내용4','답4','출력4','kim','C#');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제5','내용5','답5','출력5','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제6','내용6','답6','출력6','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제7','내용7','답7','출력7','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제8','내용8','답8','출력8','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제9','내용9','답9','출력9','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제10','내용10','답10','출력10','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제11','내용11','답11','출력11','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제12','내용12','답12','출력12','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제13','내용13','답13','출력13','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제14','내용14','답14','출력14','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제15','내용15','답15','출력15','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제16','내용16','답16','출력16','kim','C#');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제17','내용17','답17','출력17','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제18','내용18','답18','출력18','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제19','내용19','답19','출력19','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제20','내용20','답20','출력20','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제21','내용21','답21','출력21','kim','C');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제22','내용22','답22','출력22','kim','JAVA');
INSERT INTO test (tid, usernum, ttitle, tcontent, tanswer, tex, twriter, tlang) VALUES ((SELECT NVL(MAX(tid),0)+1 FROM test),1,'문제23','내용23','답23','출력23','kim','C#');


/* 테스트 댓글 샘플 =====================================================================================================================*/
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글1','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글1_대댓1','kim',1);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글2','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글2_대댓1','kim',3);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글3','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글4','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글5','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글6','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,2,'댓글7','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,2,'댓글8','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글9','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글10','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글11','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,2,'댓글12','hong',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'댓글13','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),1,1,'댓글14','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'댓글15','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'댓글16','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'댓글17','kim',0);
INSERT INTO testreply (rid, tid, usernum, rcontent, rwriter, parentid) VALUES ((SELECT NVL(MAX(rid),0)+1 FROM testreply),2,1,'댓글18','kim',0);


UPDATE BOARDREPLY SET RCONTENT='hellp tw' WHERE RID=1


ALTER TABLE Test ADD(rating number); 

select * from select(select rating=round(rating,2) from test where tid=1 ) test where tid=1;

ALTER TABLE Test MODIFY (rating DEFAULT 0.0);

update test set rating=5.3657 where tid=1;


-----------------------------------------------------
-- 누적별점 컬럼 추가 
ALTER TABLE Test ADD (ttotal INT DEFAULT 0);
-- 별점제출 컬럼 추가 
ALTER TABLE Test ADD (tsubmit INT DEFAULT 0);
-- 평점 컬럼 추가
ALTER TABLE Test ADD (trating number DEFAULT 0);
-----------------------------------------------------



update test set trating= round(total/submit,2) where tid=1;

-- 컬럼명 변경
ALTER TABLE Test RENAME COLUMN total TO ttotal;
ALTER TABLE Test RENAME COLUMN submit TO tsubmit;

ALTER TABLE Test DROP COLUMN trating;





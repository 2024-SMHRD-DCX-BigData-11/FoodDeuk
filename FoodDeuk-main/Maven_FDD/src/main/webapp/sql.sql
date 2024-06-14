-- 테이블 생성 SQL - t_user
CREATE TABLE t_user
(
    user_no      NUMBER(18, 0)     NOT NULL, 
    user_id      VARCHAR2(50)      NOT NULL, 
    user_pw      VARCHAR2(50)      NOT NULL, 
    user_addr    VARCHAR2(1000)    NOT NULL, 
    joined_at    DATE              NOT NULL, 
     PRIMARY KEY (user_no)
);

-- 테이블 Comment 설정 SQL - t_user
COMMENT ON TABLE t_user IS '사용자';

-- 컬럼 Comment 설정 SQL - t_user.user_no
COMMENT ON COLUMN t_user.user_no IS '사용자 고유번호';

-- 컬럼 Comment 설정 SQL - t_user.user_id
COMMENT ON COLUMN t_user.user_id IS '사용자 아이디';

-- 컬럼 Comment 설정 SQL - t_user.user_pw
COMMENT ON COLUMN t_user.user_pw IS '사용자 비밀번호';

-- 컬럼 Comment 설정 SQL - t_user.user_addr
COMMENT ON COLUMN t_user.user_addr IS '사용자 주소';

-- 컬럼 Comment 설정 SQL - t_user.joined_at
COMMENT ON COLUMN t_user.joined_at IS '사용자 가입일자';

CREATE SEQUENCE t_user_SEQ
START WITH 1
INCREMENT BY 1;
select * from t_user;
-- Auto Increment를 위한 Trigger 추가 SQL - t_user.user_no
--CREATE OR REPLACE TRIGGER t_user_AI_TRG
--BEFORE INSERT ON t_user 
--REFERENCING NEW AS NEW FOR EACH ROW 
--BEGIN 
--    SELECT t_user_SEQ.NEXTVAL
--    INTO :NEW.user_no
--    FROM DUAL;
--END;
-- 테이블 생성 SQL - t_review
CREATE TABLE t_review
(
    review_no         NUMBER(18, 0)    NOT NULL, 
    res_no            NUMBER(18, 0)    NOT NULL, 
    user_no           NUMBER(18, 0)    NOT NULL,
    filename		VARCHAR2(100),
    review_content    VARCHAR2(900)    NOT NULL, 
    ratings           NUMBER(2,1)      NOT NULL, 
    r_date       DATE             NOT NULL, 
     PRIMARY KEY (review_no)
);

-- Auto Increment를 위한 Sequence 추가 SQL - t_review.review_no
CREATE SEQUENCE t_review_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - t_review.review_no
--CREATE OR REPLACE TRIGGER t_review_AI_TRG
--BEFORE INSERT ON t_review 
--REFERENCING NEW AS NEW FOR EACH ROW 
--BEGIN 
--    SELECT t_review_SEQ.NEXTVAL
--    INTO :NEW.review_no
--    FROM DUAL;
--END;

DROP TRIGGER t_review_AI_TRG; 

-- DROP SEQUENCE t_review_SEQ; 

-- 테이블 Comment 설정 SQL - t_review
COMMENT ON TABLE t_review IS '리뷰';

-- 컬럼 Comment 설정 SQL - t_review.review_no
COMMENT ON COLUMN t_review.review_no IS '리뷰 고유번호';

-- 컬럼 Comment 설정 SQL - t_review.res_no
COMMENT ON COLUMN t_review.res_no IS '레스토랑 고유번호';

-- 컬럼 Comment 설정 SQL - t_review.user_no
COMMENT ON COLUMN t_review.user_no IS '사용자 고유번호';

COMMENT ON COLUMN t_review.filename IS '리뷰 이미지';

-- 컬럼 Comment 설정 SQL - t_review.review_content
COMMENT ON COLUMN t_review.review_content IS '리뷰 내용';

-- 컬럼 Comment 설정 SQL - t_review.ratings
COMMENT ON COLUMN t_review.ratings IS '리뷰 평점';

-- 컬럼 Comment 설정 SQL - t_review.created_at
COMMENT ON COLUMN t_review.r_date IS '리뷰 작성일자';

-- Foreign Key 설정 SQL - t_review(res_no) -> t_restaurant(res_no)
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_res_no_t_restauran FOREIGN KEY (res_no)
        REFERENCES t_restaurant (res_no) ;

-- Foreign Key 삭제 SQL - t_review(res_no)
-- ALTER TABLE t_review
-- DROP CONSTRAINT FK_t_review_res_no_t_restauran;

-- Foreign Key 설정 SQL - t_review(user_no) -> t_user(user_no)
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_user_no_t_user_use FOREIGN KEY (user_no)
        REFERENCES t_user (user_no) ;

-- Foreign Key 삭제 SQL - t_review(user_no)
-- ALTER TABLE t_review
-- DROP CONSTRAINT FK_t_review_user_no_t_user_use;
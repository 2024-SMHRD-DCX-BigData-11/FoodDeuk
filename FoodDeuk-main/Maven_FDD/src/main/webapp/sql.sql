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

-- Auto Increment를 위한 Trigger 추가 SQL - t_user.user_no
CREATE OR REPLACE TRIGGER t_user_AI_TRG
BEFORE INSERT ON t_user 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_user_SEQ.NEXTVAL
    INTO :NEW.user_no
    FROM DUAL;
END;

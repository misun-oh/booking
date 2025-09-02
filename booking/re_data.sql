CREATE TABLE RE_DATA (
  RE_ID     NUMBER PRIMARY KEY,     -- 예약 번호 (시퀀스 사용)
  RE_NAME       VARCHAR2(100),          -- 예약자 이름
  RE_PHONE      VARCHAR2(100),           -- 전화번호
  RE_CHECKIN    DATE,                   -- 체크인
  RE_CHECKOUT   DATE,                   -- 체크아웃
  RE_NIGHTS     NUMBER,                 -- 숙박일수
  RE_PRICE      NUMBER                  -- 총 금액
);

-- 시퀀스 생성 (자동 증가 번호)
CREATE SEQUENCE RE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

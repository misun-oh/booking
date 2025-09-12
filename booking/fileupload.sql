CREATE TABLE UPLOAD_FILE (
  FILE_ID       BIGINT AUTO_INCREMENT PRIMARY KEY, 
  BOARD_ID      VARCHAR(40),                 -- 게시판 구분(예: 'NOTICE','QNA'); 필요 없으면 NULL
  BOARD_SEQ     BIGINT,                      -- 게시글 PK(숫자)
  ATTACH_IDX    INT NOT NULL DEFAULT 0,      -- 첨부 정렬용 인덱스(0,1,2...)
  ORIG_NAME     VARCHAR(255) NOT NULL,       -- 원본 파일명
  STORED_NAME   VARCHAR(255) NOT NULL,       -- 실제 저장명(UUID.ext)
  REL_PATH      VARCHAR(400) NOT NULL,       -- 저장 상대경로(yyyy/MM/dd/{user}/UUID.ext)
  CONTENT_TYPE  VARCHAR(100),
  FILE_SIZE     BIGINT NOT NULL,             -- 바이트 단위 크기
  USER_ID       VARCHAR(50),                 -- 업로더 식별자 (옵션)
  CREATED_AT    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 게시글별 첨부 조회/정렬 최적화 인덱스
CREATE INDEX IX_UPLOAD_FILE ON UPLOAD_FILE (BOARD_ID, BOARD_SEQ);



-----------------------------------------------------------------------------
CREATE TABLE my_sequence (
    name VARCHAR(50) PRIMARY KEY,
    current_value BIGINT
);

-- 시퀀스 초기화
INSERT INTO my_sequence (name, current_value) VALUES ('seq_test', 0);
-- 로그인시 USER_ID에 권한 부여 칼럼 추가
CREATE TABLE `member` (
   `USER_ID` VARCHAR(50) NOT NULL,
   `USERNAME` VARCHAR(50) NOT NULL,
   `PASSWORD` VARCHAR(100) NOT NULL,
   `EMAIL` VARCHAR(100) DEFAULT NULL,
   `PHONE_NUMBER` VARCHAR(20) DEFAULT NULL,
   `PROFILE_IMAGE_URL` VARCHAR(255) DEFAULT NULL,
   `CREATED_AT` TIMESTAMP NULL DEFAULT NULL,
   `LAST_LOGIN_AT` DATE DEFAULT NULL,
   `LOGIN_FAIL_COUNT` INT DEFAULT 0,
   `ACCOUNT_LOCKED` CHAR(1) DEFAULT 'N',
   PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 권한
CREATE TABLE `roles` (
   `ROLE_ID` INT NOT NULL,
   `ROLE_NAME` VARCHAR(50) NOT NULL,
   `DESCRIPTION` VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 권한 테이블
insert into roles (role_id, role_name, description)
values (1, 'admin', '시스템 관리자( 전체 권한 보유)');
insert into roles (role_id, role_name, description)
values (2, 'user', '일반 사용자( 예약 기능 이용)');
insert into roles (role_id, role_name, description)
values (3, 'partner', '플렛폼 제휴 사업자(예약 및 매장 운영 권한)');


-- 멤버에 권한부여하는 테이블
CREATE TABLE `member_roles` (
   `USER_ID` VARCHAR(50) NOT NULL,
   `ROLE_ID` INT NOT NULL,
   `ASSIGNED_AT` TIMESTAMP NULL DEFAULT NULL,
   PRIMARY KEY (`USER_ID`,`ROLE_ID`),
   KEY `ROLE_ID` (`ROLE_ID`),
   CONSTRAINT `member_roles_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `member` (`USER_ID`),
   CONSTRAINT `member_roles_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

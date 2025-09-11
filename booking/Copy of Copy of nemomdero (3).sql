CREATE TABLE `posts` (
	`post_id`	BIGINT	NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`content`	TEXT	NOT NULL,
	`created_at`	TIMESTAMP	NULL,
	`user_id`	BIGINT	NOT NULL
);

CREATE TABLE `user` (
	`user_id`	BIGINT	NULL,
	`name`	VARCHAR(100)	NOT NULL,
	`email`	VARCHAR(150)	NOT NULL,
	`password`	VARCHAR(255)	NOT NULL,
	`role`	ENUM('student','instructor','admin')	NULL	DEFAULT 'student',
	`created_at`	TIMESTAMP	NULL
);

CREATE TABLE `instructor` (
	`instructor_id`	BIGINT	NULL,
	`img`	VARCHAR(255)	NULL,
	`word`	VARCHAR(300)	NULL,
	`name`	VARCHAR(100)	NULL,
	`file_id`	INTEGER	NULL
);

CREATE TABLE `category` (
	`category_id`	BIGINT	NULL,
	`course_id`	BIGINT	NULL,
	`name`	VARCHAR(200)	NULL,
	`parent_id`	BIGINT	NULL,
	`title`	VARCHAR(200)	NULL
);

CREATE TABLE `enrollment` (
	`enrollment_id`	BIGINT	NULL,
	`course_id`	BIGINT	NULL,
	`instructor_id`	BIGINT	NULL,
	`user_id`	BIGINT	NULL,
	`status`	ENUM('ongoing','completed','cancelled')	NULL	DEFAULT 'ongoing',
	`enrolled_at`	TIMESTAMP	NULL
);

CREATE TABLE `lesson` (
	`lesson_id`	BIGINT	NULL,
	`course_id`	BIGINT	NULL,
	`instructor_id`	BIGINT	NULL,
	`lesson_name`	VARCHAR(250)	NULL,
	`lesson_order`	INT	NULL,
	`video_url`	VARCHAR(255)	NULL
);

CREATE TABLE `course` (
	`course_id`	BIGINT	NULL,
	`category_id`	BIGINT	NULL,
	`instructor_id`	BIGINT	NULL,
	`title`	VARCHAR(200)	NOT NULL,
	`description`	TEXT	NULL,
	`created_at`	TIMESTAMP	NULL,
	`price`	DECIMAL	NULL,
	`level`	ENUM('beginner', 'intermediate', 'advanced')	NULL,
	`img`	VARCHAR(255)	NULL,
	`file_id`	INTEFER	NULL
);

ALTER TABLE `posts` ADD CONSTRAINT `PK_POSTS` PRIMARY KEY (
	`post_id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `instructor` ADD CONSTRAINT `PK_INSTRUCTOR` PRIMARY KEY (
	`instructor_id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `enrollment` ADD CONSTRAINT `PK_ENROLLMENT` PRIMARY KEY (
	`enrollment_id`,
	`course_id`,
	`instructor_id`,
	`user_id`
);

ALTER TABLE `lesson` ADD CONSTRAINT `PK_LESSON` PRIMARY KEY (
	`lesson_id`,
	`course_id`,
	`instructor_id`
);

ALTER TABLE `course` ADD CONSTRAINT `PK_COURSE` PRIMARY KEY (
	`course_id`,
	`category_id`,
	`instructor_id`
);

ALTER TABLE `enrollment` ADD CONSTRAINT `FK_course_TO_enrollment_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `enrollment` ADD CONSTRAINT `FK_course_TO_enrollment_2` FOREIGN KEY (
	`instructor_id`
)
REFERENCES `course` (
	`instructor_id`
);

ALTER TABLE `enrollment` ADD CONSTRAINT `FK_user_TO_enrollment_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `lesson` ADD CONSTRAINT `FK_course_TO_lesson_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `lesson` ADD CONSTRAINT `FK_course_TO_lesson_2` FOREIGN KEY (
	`instructor_id`
)
REFERENCES `course` (
	`instructor_id`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_category_TO_course_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_instructor_TO_course_1` FOREIGN KEY (
	`instructor_id`
)
REFERENCES `instructor` (
	`instructor_id`
);


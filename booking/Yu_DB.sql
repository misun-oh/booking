CREATE TABLE lesson (
  lesson_id BIGINT AUTO_INCREMENT PRIMARY KEY, 
  course_id int,
  instructor_id int,
  lesson_name VARCHAR(255),
  lesson_order VARCHAR(50),
  lesson_explan VARCHAR(500),
  file_id int,
  fix_time DATETIME NULL DEFAULT NULL,
  delete_time DATETIME NULL DEFAULT NULL,
  registration_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- CREATE TABLE eq_type (
--     eqt_id INT AUTO_INCREMENT PRIMARY KEY,
--     eqt_name VARCHAR(255) NOT NULL,
--     eqt_img VARCHAR(255) NULL
-- );ENGINE = InnoDB;
-- CREATE TABLE `emsdb`.`test_eqproduct`(
--     `eqp_id` INT NOT NULL AUTO_INCREMENT,
-- `eqt_id` INT NOT NULL,
-- `user_id` INT NOT NULL,
--     `eqp_name` VARCHAR(255) NOT NULL,
--     `eqp_img` VARCHAR(255) NOT NULL,
--     `eqp_brand` VARCHAR(255) NOT NULL,
--     `eqp_version` VARCHAR(255) NULL,
--     `eqp_price` VARCHAR(255) NOT NULL,
--     `eqp_date` VARCHAR(255) NOT NULL,
--     `eqp_status` VARCHAR(255) NOT NULL,
--     PRIMARY KEY(`eqp_id`),
-- FOREIGN KEY(`eqt_id`) REFERENCES `test_eqtype`(`eqt_id`)
-- FOREIGN KEY(`user_id`) REFERENCES `test_user`(`user_id`)
-- ) ENGINE = InnoDB;
-- CREATE TABLE `emsdb`.`test_user`(
--     `user_id` INT NOT NULL AUTO_INCREMENT,
--     `user_fname` VARCHAR(255) NOT NULL,
--     `user_lname` VARCHAR(255) NOT NULL,
--     `epassport` VARCHAR(255) NOT NULL,
--     `password` VARCHAR(255) NOT NULL,
-- 	`user_img` VARCHAR(255) NULL,
--     `user_status` VARCHAR(255) NOT NULL,
--     PRIMARY KEY(`user_id`)
-- ) ENGINE = InnoDB;
CREATE TABLE
    `ems_db`.`checkout` (
        `checkout_id` INT NOT NULL AUTO_INCREMENT,
        `mt_name` VARCHAR(255) NOT NULL,
        `username` VARCHAR(255) NOT NULL,
        `quantity` INT NOT NULL,
        `date` DATE NOT NULL,
        `status` VARCHAR(255) NOT NULL,
        `request_id` INT NOT NULL,
        PRIMARY KEY (`checkout_id`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `ems_db`.`checkout_status` (
        `checkout_status_id` INT NOT NULL AUTO_INCREMENT,
        `checkout_status_id_name` VARCHAR(255) NOT NULL,
        PRIMARY KEY (`checkout_status_id`)
    ) ENGINE = InnoDB;

INSERT INTO
    `checkout_status` (`checkout_status_id`, `checkout_status_name`)
VALUES
    (NULL, 'รอการอนุมัติ'),
    (NULL, 'คำขอได้รับการอนุมัติ'),
    (NULL, 'คำขอถูกปฏิเสธ');

CREATE TABLE
    `ems_db`.`approval_requests` (
        `request_id` INT NOT NULL AUTO_INCREMENT,
        `username` VARCHAR(255) NOT NULL,
        `items` JSON NOT NULL,
        `request_date` DATETIME NOT NULL,
        `status` VARCHAR(255) NOT NULL,
        PRIMARY KEY (`request_id`)
    ) ENGINE = InnoDB;

CREATE TABLE
    usertb (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        user_fname VARCHAR(255),
        user_lname VARCHAR(255),
        user_email VARCHAR(255),
        user_epass VARCHAR(255),
        user_password VARCHAR(255),
        user_imgpath VARCHAR(255),
        user_role VARCHAR(255)
    ) ENGINE = INNODB;

CREATE TABLE
    `home_tb` (
        `home_id` INT NOT NULL AUTO_INCREMENT,
        `home_name` VARCHAR(255) NOT NULL,
        `home_img` VARCHAR(255) NOT NULL,
        PRIMARY KEY (`home_id`)
    ) ENGINE = InnoDB;

INSERT INTO
    `home_tb` (`home_id`, `home_name`, `home_img`)
VALUES
    (NULL, 'จัดการครุภัณฑ์', NULL),
    (NULL, 'จัดการวัสดุ', NULL),
    (NULL, 'ระบบแจ้งซ่อม', NULL),
    (NULL, 'ข้อมูลงบประมาณ', NULL)
CREATE TABLE
    status_tb (
        status_id INT AUTO_INCREMENT PRIMARY KEY,
        status VARCHAR(255)
    ) ENGINE = INNODB
INSERT INTO
    `status_tb` (`status_id`, `status`)
VALUES
    (NULL, 'Active'),
    (NULL, 'Inactive')
CREATE TABLE
    eq_type (
        eqt_id INT AUTO_INCREMENT PRIMARY KEY,
        eqt_name VARCHAR(255),
        eqt_img VARCHAR(255)
    ) ENGINE = INNODB
CREATE TABLE
    eq_table (
        eq_id INT AUTO_INCREMENT PRIMARY KEY,
        eq_type VARCHAR(255),
        user_id VARCHAR(255),
        eq_model VARCHAR(255),
        eq_brand VARCHAR(255),
        eq_serial VARCHAR(255),
        eq_status VARCHAR(255),
        eq_price VARCHAR(255),
        eq_buy_date VARCHAR(255),
        eq_date VARCHAR(255),
        eq_warran VARCHAR(255),
        eq_img VARCHAR(255)
    ) ENGINE = INNODB;

UPDATE eq_table a
INNER JOIN eq_type b ON a.eq_type = b.eqt_name
SET
    a.eqt_id = b.eqt_id;

CREATE TABLE
    eq_chaeckout (
        checkout_id INT AUTO_INCREMENT PRIMARY KEY,
        eq_id INT,
        checkout_date VARCHAR(255),
        due_date VARCHAR(255) NULL,
        return_date VARCHAR(255) NULL
    ) ENGINE = INNODB;

CREATE TABLE
    unit_table (
        unit_id INT AUTO_INCREMENT PRIMARY KEY,
        unit_name VARCHAR(255)
    ) ENGINE = INNODB;

INSERT INTO
    `unit_table` (`unit_id`, `unit_name`)
VALUES
    (NULL, 'ชิ้น'),
    (NULL, 'แท่ง'),
    (NULL, 'เล่ม'),
    (NULL, 'แผ่น'),
    (NULL, 'แพ็ค'),
    (NULL, 'กล่อง'),
    (NULL, 'ลัง'),
    (NULL, 'ตัว'),
    (NULL, 'ชุด'),
    (NULL, 'ขวด'),
    (NULL, 'ล้อ'),
    (NULL, 'บอร์ด'),
    (NULL, 'เส้น'),
    (NULL, 'แถว'),
    (NULL, 'ม้วน'),
    (NULL, 'แผง'),
    (NULL, 'ก้อน'),
    (NULL, 'แพ'),
    (NULL, 'ตู้'),
    (NULL, 'ตลับ'),
    (NULL, 'อัน'),
    (NULL, 'แถว'),
    (NULL, 'EA');

CREATE TABLE
    mt_type (
        mttype_id INT AUTO_INCREMENT PRIMARY KEY,
        mttype_name VARCHAR(255),
        mttype_img VARCHAR(255)
    ) ENGINE = INNODB
INSERT INTO
    `mt_type` (`mttype_id`, `mttype_name`, `mttype_img`)
VALUES
    (NULL, 'วัสดุสิ้นเปลือง', 'upload/default.jpg'),
    (NULL, 'วัสดุถาวร', 'upload/default.jpg');

CREATE TABLE
    mt_table (
        mt_id INT AUTO_INCREMENT PRIMARY KEY,
        mt_type VARCHAR(255) NOT NULL,
        mt_name VARCHAR(255) NOT NULL,
        unit_id VARCHAR(255) NOT NULL,
        mt_stock INT NOT NULL,
        unit_price INT NOT NULL,
        mt_price INT NOT NULL,
        mt_date VARCHAR(255),
        mt_img VARCHAR(255),
        mt_url VARCHAR(255)
    ) ENGINE = INNODB;

CREATE TABLE
    mt_checkout (
        mtcheck_id INT AUTO_INCREMENT PRIMARY KEY,
        mt_id INT,
        user_id INT,
        mtcheck_date VARCHAR(255),
        mtcheck_qty INT,
        unit_id INT,
        mt_duedate VARCHAR(255),
        mt_turndate VARCHAR(255),
        mt_note VARCHAR(255)
    ) ENGINE = INNODB;

CREATE TABLE
    role_table (
        role_id INT AUTO_INCREMENT PRIMARY KEY,
        role VARCHAR(255),
        description VARCHAR(255)
    ) ENGINE = INNODB;

CREATE TABLE
    maintenance_tb (
        mainten_id INT NOT NULL AUTO_INCREMENT,
        eq_id VARCHAR(255) NOT NULL,
        eq_name VARCHAR(255) NOT NULL,
        mainten_date VARCHAR(255) NOT NULL,
        mainten_detail VARCHAR(255) NOT NULL,
        user_mainten VARCHAR(255) NOT NULL,
        mainten_status VARCHAR(255) NOT NULL,
        mainten_img VARCHAR(255) NOT NULL,
        operator VARCHAR(255) NOT NULL,
        PRIMARY KEY (`mainten_id`)
    ) ENGINE = InnoDB;

CREATE TABLE
    maintenance_status (
        `status_id` INT (11) NOT NULL AUTO_INCREMENT,
        `mainten_status` VARCHAR(255) NOT NULL
    ) ENGINE = InnoDB;
INSERT INTO maintenance_status (status_id, mainten_status) VALUES (1, 'แจ้งซ่อม'), (2, 'กำลังดำเนินการ'), (3, 'รออะไหล่'), (4, 'ซ่อมสำเร็จ'), (5, 'ซ่อมไม่สำเร็จ');

CREATE TABLE
    budget_table (
        budget_id INT NOT NULL AUTO_INCREMENT,
        budget_name VARCHAR(255) NOT NULL,
        budget_amount INT NOT NULL,
        budget_year VARCHAR(255) NOT NULL,
        budget_type VARCHAR(255) NOT NULL,
        PRIMARY KEY (`budget_id`)
    ) ENGINE = InnoDB;
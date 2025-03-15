-- สร้าง Database (ถ้ายังไม่มี)
CREATE DATABASE IF NOT EXISTS EquipmentDB;

-- เลือกใช้ Database ที่สร้าง
USE EquipmentDB;

-- สร้างตาราง Equipment
CREATE TABLE Equipment_tb (
    HN_id VARCHAR(20) NOT NULL,  -- Primary Key, รูปแบบ ทต.XXX-YYYY
    eq_type VARCHAR(255),      -- ประเภทของครุภัณฑ์
    user_name VARCHAR(255),    -- ชื่อผู้ถือครอง
    eq_name VARCHAR(255),      -- ชื่อของครุภัณฑ์
    eq_brand VARCHAR(255),     -- แบรนด์
    eq_model VARCHAR(255),     -- รุ่น
    eq_status VARCHAR(50),     -- สถานะ (เช่น 'ใช้งาน', 'ซ่อมบำรุง', 'จำหน่าย')
    eq_price DECIMAL(10, 2),  -- ราคา (ทศนิยม 2 ตำแหน่ง)
    eq_buydate DATE,          -- วันที่ซื้อ (YYYY-MM-DD)
    eq_date DATE,             -- วันที่เบิก (YYYY-MM-DD)
    eq_warran VARCHAR(255),    -- รายละเอียดการรับประกัน (เช่น '1 ปี', '2 ปี', 'ไม่มีประกัน')
    eq_img VARCHAR(255),      -- เก็บ path ของรูปภาพ (หรือใช้ BLOB ถ้าต้องการเก็บรูปภาพโดยตรงใน DB)

    PRIMARY KEY (HN_id)
);


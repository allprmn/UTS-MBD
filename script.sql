-- TUGAS 3
CREATE SCHEMA IF NOT EXISTS "SALAM";

CREATE TABLE "SALAM".mahasiswas (
    nim VARCHAR(15) PRIMARY KEY,   
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,                              
    ipk NUMERIC(3, 2) CHECK (ipk >= 0.00 AND ipk <= 4.00)  
);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, ipk) 
VALUES ('1247050031', 'Aldi Pramana', '1247050031@student.uinsgd.ac.id', 3.70);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, ipk) 
VALUES ('1247050031', 'Budi Santoso', 'budi@student.uin.ac.id', 3.50);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, ipk) 
VALUES ('1247050032', 'Budi Santoso', '1247050031@student.uinsgd.ac.id', 3.50);

INSERT INTO "SALAM".mahasiswas (nim, nama, email, ipk) 
VALUES ('1247050033', 'Citra Dewi', 'citra@student.uin.ac.id', 4.50);

-- ===================================================
-- TUGAS 4
CREATE USER backend_dev WITH PASSWORD 'dev123';
CREATE USER bi_dev WITH PASSWORD 'dev123';
CREATE USER data_engineer WITH PASSWORD 'dev123';

GRANT USAGE ON SCHEMA "SALAM" TO backend_dev, bi_dev, data_engineer;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "SALAM" TO backend_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;

GRANT SELECT ON ALL TABLES IN SCHEMA "SALAM" TO bi_dev;
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT SELECT ON TABLES TO bi_dev;

GRANT ALL PRIVILEGES ON SCHEMA "SALAM" TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "SALAM" TO data_engineer;
ALTER DEFAULT PRIVILEGES IN SCHEMA "SALAM" GRANT ALL ON TABLES TO data_engineer;

SELECT * FROM "SALAM".mahasiswas;
INSERT INTO "SALAM".mahasiswas (nim, nama) VALUES ('111', 'Test');
DELETE FROM "SALAM".mahasiswas 
WHERE nim = '111';

-- ===================================================
-- uji bi_dev

SELECT * FROM "SALAM".mahasiswas;
INSERT INTO "SALAM".mahasiswas (nim, nama) VALUES ('111', 'Test');

-- ===================================================
--  Uji backend_dev
INSERT INTO "SALAM".mahasiswas (nim, nama, email, ipk) 
VALUES ('1247050099', 'Uji Backend', 'backend@test.com', 3.75);

UPDATE "SALAM".mahasiswas 
SET nama = 'Uji Backend Edit' 
WHERE nim = '1247050099';

DROP TABLE "SALAM".mahasiswas;

-- ===================================================
-- Uji data_engineer
CREATE TABLE "SALAM".test_tabel (
    id INT PRIMARY KEY,
    keterangan VARCHAR(50)
);

DROP TABLE "SALAM".test_tabel;

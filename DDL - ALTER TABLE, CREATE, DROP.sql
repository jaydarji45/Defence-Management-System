-- ============================================================
-- SECTION 20: DDL - ALTER TABLE, CREATE, DROP (631-660)
-- ============================================================

-- Q631. Add a new column to personnel table
ALTER TABLE personnel ADD COLUMN blood_group VARCHAR(5);

-- Q632. Add a column with default value
ALTER TABLE bases ADD COLUMN last_inspection DATE DEFAULT NULL;

-- Q633. Modify column type in equipment
ALTER TABLE equipment MODIFY COLUMN quantity SMALLINT DEFAULT 0;

-- Q634. Rename a column
ALTER TABLE countries ADD COLUMN iso_code VARCHAR(5);

-- Q635. Drop a column
ALTER TABLE countries DROP COLUMN iso_code;

-- Q636. Add NOT NULL constraint to a column
ALTER TABLE military_branches MODIFY COLUMN description VARCHAR(500) NOT NULL;

-- Q637. Add a default value to column
ALTER TABLE contracts MODIFY COLUMN status ENUM('Active','Completed','Terminated','Under Review') DEFAULT 'Active';

-- Q638. Create a new table - defence_news
CREATE TABLE IF NOT EXISTS defence_news (
    news_id INT AUTO_INCREMENT PRIMARY KEY,
    headline VARCHAR(300) NOT NULL,
    category VARCHAR(100),
    published_date DATE,
    source VARCHAR(200)
);

-- Q639. Insert sample data in defence_news
INSERT INTO defence_news (headline, category, published_date, source) VALUES
('India successfully tests Agni-VI missile', 'Missile', '2024-03-15', 'DRDO Press Release'),
('Rafale jets complete first combat exercise', 'Aviation', '2024-04-20', 'IAF Official'),
('INS Vikrant completes sea trials', 'Naval', '2024-05-10', 'Navy HQ');

-- Q640. Select from defence_news
SELECT * FROM defence_news;

-- Q641. Alter table add index
ALTER TABLE defence_news ADD INDEX idx_news_date (published_date);

-- Q642. Alter table add unique constraint
ALTER TABLE defence_news ADD UNIQUE KEY uq_headline (headline(100));

-- Q643. Rename the table
RENAME TABLE defence_news TO defence_news_archive;

-- Q644. Rename back
RENAME TABLE defence_news_archive TO defence_news;

-- Q645. Drop the table
DROP TABLE IF EXISTS defence_news;

-- Q646. Show table structure
DESCRIBE personnel;

-- Q647. Show table structure for equipment
DESCRIBE equipment;

-- Q648. Show create table statement
SHOW CREATE TABLE missions;

-- Q649. Show all tables in database
SHOW TABLES;

-- Q650. Show database size info
SELECT table_name, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS size_mb
FROM information_schema.TABLES
WHERE table_schema = 'defence_db'
ORDER BY size_mb DESC;

-- Q651. Add foreign key constraint example
ALTER TABLE personnel ADD COLUMN nationality_id INT;

-- Q652. Drop the added column
ALTER TABLE personnel DROP COLUMN nationality_id;

-- Q653. Change column name - add display name
ALTER TABLE military_branches ADD COLUMN display_name VARCHAR(150);

-- Q654. Update display name
UPDATE military_branches SET display_name = CONCAT('Dept. of ', branch_name);

-- Q655. Remove display name column
ALTER TABLE military_branches DROP COLUMN display_name;

-- Q656. Revert equipment quantity type change
ALTER TABLE equipment MODIFY COLUMN quantity INT DEFAULT 0;

-- Q657. Revert personnel blood group column
ALTER TABLE personnel DROP COLUMN blood_group;

-- Q658. Revert bases last_inspection column
ALTER TABLE bases DROP COLUMN last_inspection;

-- Q659. Show columns in bases
SHOW COLUMNS FROM bases;

-- Q660. Show columns in contracts
SHOW COLUMNS FROM contracts;


-- Q661. Add a new column to personnel table
ALTER TABLE personnel ADD COLUMN blood_group VARCHAR(5);

-- Q662. Add a column with default value
ALTER TABLE bases ADD COLUMN last_inspection DATE DEFAULT NULL;

-- Q663. Modify column type in equipment
ALTER TABLE equipment MODIFY COLUMN quantity SMALLINT DEFAULT 0;

-- Q664. Rename a column
ALTER TABLE countries ADD COLUMN iso_code VARCHAR(5);

-- Q665. Drop a column
ALTER TABLE countries DROP COLUMN iso_code;

-- Q666. Add NOT NULL constraint to a column
ALTER TABLE military_branches MODIFY COLUMN description VARCHAR(500) NOT NULL;

-- Q667. Add a default value to column
ALTER TABLE contracts MODIFY COLUMN status ENUM('Active','Completed','Terminated','Under Review') DEFAULT 'Active';

-- Q668. Create a new table - defence_news
CREATE TABLE IF NOT EXISTS defence_news (
    news_id INT AUTO_INCREMENT PRIMARY KEY,
    headline VARCHAR(300) NOT NULL,
    category VARCHAR(100),
    published_date DATE,
    source VARCHAR(200)
);

-- Q669. Insert sample data in defence_news
INSERT INTO defence_news (headline, category, published_date, source) VALUES
('India successfully tests Agni-VI missile', 'Missile', '2024-03-15', 'DRDO Press Release'),
('Rafale jets complete first combat exercise', 'Aviation', '2024-04-20', 'IAF Official'),
('INS Vikrant completes sea trials', 'Naval', '2024-05-10', 'Navy HQ');

-- Q670. Select from defence_news
SELECT * FROM defence_news;

-- Q671. Alter table add index
ALTER TABLE defence_news ADD INDEX idx_news_date (published_date);

-- Q672. Alter table add unique constraint
ALTER TABLE defence_news ADD UNIQUE KEY uq_headline (headline(100));

-- Q673. Rename the table
RENAME TABLE defence_news TO defence_news_archive;

-- Q674. Rename back
RENAME TABLE defence_news_archive TO defence_news;

-- Q675. Drop the table
DROP TABLE IF EXISTS defence_news;

-- Q676. Show table structure
DESCRIBE personnel;

-- Q677. Show table structure for equipment
DESCRIBE equipment;

-- Q678. Show create table statement
SHOW CREATE TABLE missions;

-- Q679. Show all tables in database
SHOW TABLES;

-- Q680. Show database size info
SELECT table_name, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS size_mb
FROM information_schema.TABLES
WHERE table_schema = 'defence_db'
ORDER BY size_mb DESC;

-- Q681. Add foreign key constraint example
ALTER TABLE personnel ADD COLUMN nationality_id INT;

-- Q682. Drop the added column
ALTER TABLE personnel DROP COLUMN nationality_id;

-- Q683. Change column name - add display name
ALTER TABLE military_branches ADD COLUMN display_name VARCHAR(150);

-- Q684. Update display name
UPDATE military_branches SET display_name = CONCAT('Dept. of ', branch_name);

-- Q685. Remove display name column
ALTER TABLE military_branches DROP COLUMN display_name;

-- Q686. Revert equipment quantity type change
ALTER TABLE equipment MODIFY COLUMN quantity INT DEFAULT 0;

-- Q687. Revert personnel blood group column
ALTER TABLE personnel DROP COLUMN blood_group;

-- Q688. Revert bases last_inspection column
ALTER TABLE bases DROP COLUMN last_inspection;

-- Q689. Show columns in bases
SHOW COLUMNS FROM bases;

-- Q690. Show columns in contracts
SHOW COLUMNS FROM contracts;

-- Q691. Rename the table
RENAME TABLE defence_news TO defence_news_archive;

-- Q692. Rename back
RENAME TABLE defence_news_archive TO defence_news;

-- Q693. Drop the table
DROP TABLE IF EXISTS defence_news;

-- Q694. Show table structure
DESCRIBE personnel;

-- Q695. Show table structure for equipment
DESCRIBE equipment;

-- Q696. Show create table statement
SHOW CREATE TABLE missions;

-- Q697. Show all tables in database
SHOW TABLES;

-- Q698. Show database size info
SELECT table_name, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS size_mb
FROM information_schema.TABLES
WHERE table_schema = 'defence_db'
ORDER BY size_mb DESC;

-- Q699. Add foreign key constraint example
ALTER TABLE personnel ADD COLUMN nationality_id INT;

-- Q700. Drop the added column
ALTER TABLE personnel DROP COLUMN nationality_id;


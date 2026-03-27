-- ============================================================
-- SECTION 8 : DML - INSERT UPDATE DELETE (591-630)
-- ============================================================

-- Q591. Insert a new country
INSERT INTO countries (country_name, region, alliance)
VALUES ('Kenya', 'Africa', 'Non-Aligned');

-- Q592. Insert multiple countries
INSERT INTO countries (country_name, region, alliance) VALUES
('Morocco', 'Africa', 'Non-Aligned'),
('Tanzania', 'Africa', 'Non-Aligned');

-- Q593. Insert a new military branch
INSERT INTO military_branches (branch_name, branch_code, established_year, description)
VALUES ('Cyber Command Test', 'CCT', 2024, 'Test cyber unit for academic exercise');

-- Q594. Insert a new rank
INSERT INTO ranks (rank_name, rank_code, branch_id, rank_level)
VALUES ('Master Sergeant', 'MSG', 1, 5);

-- Q595. Insert a new base
INSERT INTO bases (base_name, base_code, branch_id, country_id, location_city, location_state, established_year, capacity, is_active)
VALUES ('Test Training Base', 'TTB-001', 1, 1, 'Nashik', 'Maharashtra', 2024, 500, TRUE);

-- Q596. Insert a new award
INSERT INTO awards (award_name, award_type, description)
VALUES ('Excellence in Training Award', 'Certificate', 'Awarded for exceptional performance in training');

-- Q597. Update personnel status to Retired
UPDATE personnel SET status = 'Retired' WHERE personnel_id = 26;

-- Q598. Update equipment quantity
UPDATE equipment SET quantity = quantity + 50 WHERE equipment_id = 1;

-- Q599. Update mission status to Completed
UPDATE missions SET status = 'Completed', end_date = '2024-12-31'
WHERE mission_id = 2;

-- Q600. Update contract status
UPDATE contracts SET status = 'Under Review' WHERE contract_id = 1;

-- Q601. Update base capacity
UPDATE bases SET capacity = 6000 WHERE base_id = 1;

-- Q602. Update training program status
UPDATE training_programs SET status = 'Ongoing' WHERE program_id = 8;

-- Q603. Update multiple columns in personnel
UPDATE personnel SET specialization = 'Special Operations', status = 'Active'
WHERE personnel_id = 7;

-- Q604. Update all equipment status where quantity is 0
UPDATE equipment SET status = 'Decommissioned' WHERE quantity = 0;

-- Q605. Update country alliance
UPDATE countries SET alliance = 'QUAD' WHERE country_name = 'Kenya';

-- Q606. Delete the test country inserted
DELETE FROM countries WHERE country_name = 'Kenya';

-- Q607. Delete the test branch inserted
DELETE FROM military_branches WHERE branch_code = 'CCT';

-- Q608. Delete test base
DELETE FROM bases WHERE base_code = 'TTB-001';

-- Q609. Delete training enrollments with Withdrawn result
DELETE FROM training_enrollments WHERE result = 'Withdrawn';

-- Q610. Safe delete using subquery
DELETE FROM personnel_awards
WHERE pa_id IN (
    SELECT pa_id FROM (
        SELECT pa_id FROM personnel_awards WHERE YEAR(awarded_date) < 1990
    ) AS temp);

-- Q611. Update contracts end date by 1 year for active ones
UPDATE contracts SET end_date = DATE_ADD(end_date, INTERVAL 1 YEAR)
WHERE status = 'Active' AND end_date < '2025-01-01';

-- Q612. Bulk update equipment year acquired for legacy items
UPDATE equipment SET status = 'Under Maintenance'
WHERE year_acquired < 1995 AND status = 'Operational';

-- Q613. Insert into training enrollment
INSERT INTO training_enrollments (program_id, personnel_id, enrollment_date, result, score)
VALUES (1, 10, '2024-01-15', 'Pass', 92.5);

-- Q614. Insert a new equipment category
INSERT INTO equipment_categories (category_name, description)
VALUES ('Quantum Systems', 'Next generation quantum computing and sensing military applications');

-- Q615. Update rank levels
UPDATE ranks SET rank_level = 9 WHERE rank_code = 'BRIG' AND branch_id = 1;

-- Q616. Insert a new personnel record
INSERT INTO personnel (service_number, first_name, last_name, gender, date_of_birth, nationality, branch_id, rank_id, base_id, enlistment_date, status, specialization, email, phone)
VALUES ('IN-TEST-001', 'Test', 'Soldier', 'Male', '2000-01-01', 'Indian', 1, 1, 1, '2024-01-01', 'Active', 'Training', 'test@defence.in', '9999999999');

-- Q617. Delete the test personnel
DELETE FROM personnel WHERE service_number = 'IN-TEST-001';

-- Q618. Update mission budget
UPDATE missions SET budget_usd = budget_usd * 1.1 WHERE status = 'Ongoing';

-- Q619. Update equipment manufacturer
UPDATE equipment SET manufacturer = 'HAL/DRDO' WHERE equipment_id = 5;

-- Q620. Soft delete - mark as inactive instead of deleting base
UPDATE bases SET is_active = FALSE WHERE base_code = 'NAL-TEST';

-- Q621. REPLACE INTO example for countries
REPLACE INTO countries (country_id, country_name, region, alliance)
VALUES (51, 'United Arab Emirates', 'Middle East', 'Non-Aligned');

-- Q622. INSERT IGNORE - ignore duplicate entry
INSERT IGNORE INTO countries (country_name, region, alliance)
VALUES ('India', 'South Asia', 'QUAD');

-- Q623. Update using JOIN - update personnel rank from ranks table
UPDATE personnel p
JOIN ranks r ON p.rank_id = r.rank_id
SET p.specialization = CONCAT(p.specialization, ' - Sr')
WHERE r.rank_level >= 9 AND p.status = 'Active';

-- Q624. Rollback to fix the above
UPDATE personnel p
JOIN ranks r ON p.rank_id = r.rank_id
SET p.specialization = REPLACE(p.specialization, ' - Sr', '')
WHERE r.rank_level >= 9;

-- Q625. INSERT with SELECT - copy countries to a temp backup
CREATE TABLE IF NOT EXISTS countries_backup AS SELECT * FROM countries;

-- Q626. Count backup records
SELECT COUNT(*) AS backup_count FROM countries_backup;

-- Q627. Drop the backup table
DROP TABLE IF EXISTS countries_backup;

-- Q628. Update training scores by 5% for passing students
UPDATE training_enrollments
SET score = LEAST(score * 1.05, 100)
WHERE result = 'Pass' AND score < 95;

-- Q629. Delete orphan mission assignments (no mission)
DELETE FROM mission_assignments
WHERE mission_id NOT IN (SELECT mission_id FROM missions);

-- Q630. Truncate audit log table
TRUNCATE TABLE personnel_audit;


-- ============================================================
-- SECTION 6: SUBQUERIES (341-390)
-- ============================================================

-- Q341. Personnel with rank level above average
SELECT CONCAT(first_name,' ',last_name) AS name, rank_id
FROM personnel
WHERE rank_id IN (SELECT rank_id FROM ranks WHERE rank_level > (SELECT AVG(rank_level) FROM ranks));

-- Q342. Bases with capacity above average
SELECT base_name, location_city, capacity
FROM bases
WHERE capacity > (SELECT AVG(capacity) FROM bases);

-- Q343. Equipment with cost above average
SELECT equipment_name, unit_cost_usd
FROM equipment
WHERE unit_cost_usd > (SELECT AVG(unit_cost_usd) FROM equipment)
ORDER BY unit_cost_usd DESC;

-- Q344. Missions with budget above average
SELECT mission_name, budget_usd
FROM missions
WHERE budget_usd > (SELECT AVG(budget_usd) FROM missions)
ORDER BY budget_usd DESC;

-- Q345. Personnel in the branch with most personnel
SELECT * FROM personnel
WHERE branch_id = (
    SELECT branch_id FROM personnel
    GROUP BY branch_id ORDER BY COUNT(*) DESC LIMIT 1);

-- Q346. Equipment at the base with highest capacity
SELECT * FROM equipment
WHERE base_id = (SELECT base_id FROM bases ORDER BY capacity DESC LIMIT 1);

-- Q347. Personnel who commanded any mission
SELECT CONCAT(first_name,' ',last_name) AS name, specialization
FROM personnel
WHERE personnel_id IN (SELECT commanding_officer_id FROM missions);

-- Q348. Personnel who never commanded any mission
SELECT CONCAT(first_name,' ',last_name) AS name, specialization
FROM personnel
WHERE personnel_id NOT IN (
    SELECT commanding_officer_id FROM missions WHERE commanding_officer_id IS NOT NULL);

-- Q349. Personnel who received at least one award
SELECT CONCAT(first_name,' ',last_name) AS name
FROM personnel
WHERE personnel_id IN (SELECT DISTINCT personnel_id FROM personnel_awards);

-- Q350. Personnel who never received any award
SELECT CONCAT(first_name,' ',last_name) AS name, specialization
FROM personnel
WHERE personnel_id NOT IN (SELECT DISTINCT personnel_id FROM personnel_awards);

-- Q351. Countries with at least one base
SELECT country_name, region
FROM countries
WHERE country_id IN (SELECT DISTINCT country_id FROM bases);

-- Q352. Countries with no base recorded
SELECT country_name, region
FROM countries
WHERE country_id NOT IN (SELECT DISTINCT country_id FROM bases);

-- Q353. Equipment more expensive than any aircraft
SELECT equipment_name, unit_cost_usd
FROM equipment
WHERE unit_cost_usd > ANY (SELECT unit_cost_usd FROM equipment WHERE category_id = 3);

-- Q354. Equipment more expensive than all artillery
SELECT equipment_name, unit_cost_usd
FROM equipment
WHERE unit_cost_usd > ALL (SELECT unit_cost_usd FROM equipment WHERE category_id = 5);

-- Q355. Personnel in bases with capacity more than 10000
SELECT CONCAT(first_name,' ',last_name) AS name, specialization, base_id
FROM personnel
WHERE base_id IN (SELECT base_id FROM bases WHERE capacity > 10000);

-- Q356. Training programs with above average enrollment
SELECT program_name, program_id
FROM training_programs
WHERE program_id IN (
    SELECT program_id FROM training_enrollments
    GROUP BY program_id
    HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM training_enrollments GROUP BY program_id) AS sub));

-- Q357. Contracts with value above the average active contract value
SELECT contract_number, vendor_name, value_usd
FROM contracts
WHERE value_usd > (SELECT AVG(value_usd) FROM contracts WHERE status = 'Active')
ORDER BY value_usd DESC;

-- Q358. Personnel with score above 95 in any training
SELECT DISTINCT CONCAT(first_name,' ',last_name) AS name
FROM personnel
WHERE personnel_id IN (SELECT personnel_id FROM training_enrollments WHERE score > 95);

-- Q359. Missions commanded by personnel from Army
SELECT mission_name, mission_type, status
FROM missions
WHERE commanding_officer_id IN (SELECT personnel_id FROM personnel WHERE branch_id = 1);

-- Q360. Awards given in 2024
SELECT a.award_name, pa.awarded_date, pa.awarded_for
FROM awards a
WHERE a.award_id IN (
    SELECT award_id FROM personnel_awards WHERE YEAR(awarded_date) = 2024);

-- Q361. EXISTS - Find personnel who have participated in at least one mission
SELECT CONCAT(first_name,' ',last_name) AS name
FROM personnel p
WHERE EXISTS (
    SELECT 1 FROM mission_assignments ma WHERE ma.personnel_id = p.personnel_id);

-- Q362. EXISTS - Find missions that have at least one assignment
SELECT mission_name, mission_type
FROM missions m
WHERE EXISTS (
    SELECT 1 FROM mission_assignments ma WHERE ma.mission_id = m.mission_id);

-- Q363. NOT EXISTS - Find personnel with no training enrollment
SELECT CONCAT(first_name,' ',last_name) AS name, specialization
FROM personnel p
WHERE NOT EXISTS (
    SELECT 1 FROM training_enrollments te WHERE te.personnel_id = p.personnel_id);

-- Q364. NOT EXISTS - Find training programs with no enrollment
SELECT program_name, duration_days, status
FROM training_programs tp
WHERE NOT EXISTS (
    SELECT 1 FROM training_enrollments te WHERE te.program_id = tp.program_id);

-- Q365. Correlated subquery - Personnel with above branch average rank level
SELECT CONCAT(p.first_name,' ',p.last_name) AS name, p.branch_id, p.rank_id
FROM personnel p
WHERE p.rank_id > (
    SELECT AVG(p2.rank_id) FROM personnel p2 WHERE p2.branch_id = p.branch_id);

-- Q366. Subquery in SELECT - Show personnel with total missions count
SELECT CONCAT(first_name,' ',last_name) AS name,
       (SELECT COUNT(*) FROM mission_assignments ma WHERE ma.personnel_id = p.personnel_id) AS mission_count
FROM personnel p;

-- Q367. Subquery in FROM - Branch with highest total equipment value
SELECT branch_id, total_value FROM (
    SELECT branch_id, SUM(quantity * unit_cost_usd) AS total_value
    FROM equipment GROUP BY branch_id) AS branch_values
ORDER BY total_value DESC LIMIT 1;

-- Q368. Second highest mission budget
SELECT mission_name, budget_usd FROM missions
WHERE budget_usd = (
    SELECT MAX(budget_usd) FROM missions
    WHERE budget_usd < (SELECT MAX(budget_usd) FROM missions));

-- Q369. Personnel in the same base as the person with most missions
SELECT CONCAT(first_name,' ',last_name) AS name, base_id
FROM personnel
WHERE base_id = (
    SELECT p.base_id FROM personnel p
    JOIN mission_assignments ma ON p.personnel_id = ma.personnel_id
    GROUP BY p.base_id ORDER BY COUNT(*) DESC LIMIT 1);

-- Q370. Equipment categories with above average item count
SELECT category_name FROM equipment_categories
WHERE category_id IN (
    SELECT category_id FROM equipment
    GROUP BY category_id
    HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM equipment GROUP BY category_id) t));



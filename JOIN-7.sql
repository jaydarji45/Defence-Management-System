-- ============================================================
-- SECTION 6: JOIN QUERIES (271-340)
-- ============================================================

-- Q271. List personnel with their branch name.
SELECT p.personnel_id ,CONCAT(p.first_name ," " , p.last_name) AS full_name,
m.branch_name
FROM personnel AS p
INNER JOIN military_branches AS m
ON p.personnel_id = m.branch_id ;

-- Q272. List personnel with their rank name and level

SELECT concat(p.first_name , " " , p.last_name) full_name,r.rank_name ,r.rank_level
FROM personnel AS p
JOIN ranks AS r
ON p.rank_id = r.rank_id ;

-- Q273. List personnel with their base name and city
SELECT p.personnel_id,CONCAT(P.first_name , " " ,P.last_name) AS full_name ,
	   b.base_name,b.location_city
FROM personnel AS p
INNER JOIN bases AS b
ON p.base_id = b.base_id ;

-- Q274. List all personnel with branch, rank and base

SELECT concat(first_name, " " ,last_name) AS full_name ,branch_name,rank_name,base_name 
FROM personnel AS p
JOIN military_branches AS mb ON p.branch_id = mb.branch_id
JOIN  ranks AS r ON p.rank_id = r.rank_id
JOIN  bases AS b ON p.base_id = b.base_id ;

-- Q275. List equipment with category name

SELECT e.equipment_name , ec.category_name
FROM equipment AS e
INNER JOIN equipment_categories AS ec
ON e.category_id = ec.category_id ;

-- Q276. List equipment with branch name

SELECT e.equipment_name ,mb.branch_name
FROM equipment AS e
INNER JOIN military_branches AS mb
ON e.branch_id = mb.branch_id ;

-- Q277. List equipment with base name
SELECT e.equipment_name, b.base_name, b.location_city, e.quantity
FROM equipment e
JOIN bases b ON e.base_id = b.base_id;

-- Q278. List missions with country name
SELECT m.mission_name, m.mission_type, c.country_name, m.status
FROM missions m
JOIN countries c ON m.country_id = c.country_id;

-- Q279. List missions with commanding officer name
SELECT m.mission_name,
       CONCAT(p.first_name,' ',p.last_name) AS commanding_officer,
       m.status
FROM missions m
JOIN personnel p ON m.commanding_officer_id = p.personnel_id;

-- Q280. List mission assignments with personnel and mission name
SELECT ma.role, CONCAT(p.first_name,' ',p.last_name) AS personnel_name,
       m.mission_name, ma.assigned_date
FROM mission_assignments ma
JOIN personnel p ON ma.personnel_id = p.personnel_id
JOIN missions m ON ma.mission_id = m.mission_id;

-- Q281. List contracts with branch name
SELECT c.contract_number, c.vendor_name, mb.branch_name,
       c.value_usd, c.status
FROM contracts c
JOIN military_branches mb ON c.branch_id = mb.branch_id;

-- Q282. List training programs with branch name and base name
SELECT tp.program_name, mb.branch_name, b.base_name, tp.duration_days
FROM training_programs tp
JOIN military_branches mb ON tp.branch_id = mb.branch_id
JOIN bases b ON tp.base_id = b.base_id;

-- Q283. List training programs with instructor name
SELECT tp.program_name,
       CONCAT(p.first_name,' ',p.last_name) AS instructor,
       tp.start_date, tp.end_date
FROM training_programs tp
JOIN personnel p ON tp.instructor_id = p.personnel_id;

-- Q284. List training enrollments with personnel and program name
SELECT CONCAT(p.first_name,' ',p.last_name) AS trainee,
       tp.program_name, te.result, te.score
FROM training_enrollments te
JOIN personnel p ON te.personnel_id = p.personnel_id
JOIN training_programs tp ON te.program_id = tp.program_id;

-- Q285. List personnel awards with personnel name and award name
SELECT CONCAT(p.first_name,' ',p.last_name) AS personnel_name,
       a.award_name, a.award_type, pa.awarded_date
FROM personnel_awards pa
JOIN personnel p ON pa.personnel_id = p.personnel_id
JOIN awards a ON pa.award_id = a.award_id;

-- Q286. List bases with branch name and country name
SELECT b.base_name, mb.branch_name, c.country_name,
       b.location_city, b.capacity
FROM bases b
JOIN military_branches mb ON b.branch_id = mb.branch_id
JOIN countries c ON b.country_id = c.country_id;

-- Q287. List ranks with branch name
SELECT r.rank_name, r.rank_code, mb.branch_name, r.rank_level
FROM ranks r
JOIN military_branches mb ON r.branch_id = mb.branch_id;

-- Q288. Active personnel with full details
SELECT p.service_number, CONCAT(p.first_name,' ',p.last_name) AS name,
       mb.branch_name, r.rank_name, b.base_name,
       p.specialization, p.status
FROM personnel p
JOIN military_branches mb ON p.branch_id = mb.branch_id
JOIN ranks r ON p.rank_id = r.rank_id
JOIN bases b ON p.base_id = b.base_id
WHERE p.status = 'Active';

-- Q289. Equipment with full details including category, branch, base
SELECT e.equipment_name, ec.category_name, mb.branch_name,
       b.base_name, e.quantity, e.unit_cost_usd, e.status
FROM equipment e
JOIN equipment_categories ec ON e.category_id = ec.category_id
JOIN military_branches mb ON e.branch_id = mb.branch_id
JOIN bases b ON e.base_id = b.base_id;

-- Q290. Missions with full details country and commanding officer
SELECT m.mission_name, m.mission_type,
       c.country_name, c.region,
       CONCAT(p.first_name,' ',p.last_name) AS commander,
       m.budget_usd, m.status
FROM missions m
JOIN countries c ON m.country_id = c.country_id
JOIN personnel p ON m.commanding_officer_id = p.personnel_id;

-- Q291. LEFT JOIN - all personnel including those without awards
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       a.award_name, pa.awarded_date
FROM personnel p
LEFT JOIN personnel_awards pa ON p.personnel_id = pa.personnel_id
LEFT JOIN awards a ON pa.award_id = a.award_id;

-- Q292. LEFT JOIN - all missions including unassigned personnel
SELECT m.mission_name, COUNT(ma.personnel_id) AS assigned_personnel
FROM missions m
LEFT JOIN mission_assignments ma ON m.mission_id = ma.mission_id
GROUP BY m.mission_id, m.mission_name;

-- Q293. LEFT JOIN - all training programs with enrollment count
SELECT tp.program_name, COUNT(te.enrollment_id) AS enrolled_count
FROM training_programs tp
LEFT JOIN training_enrollments te ON tp.program_id = te.program_id
GROUP BY tp.program_id, tp.program_name;

-- Q294. LEFT JOIN - all personnel with their mission assignments
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       COUNT(ma.mission_id) AS mission_count
FROM personnel p
LEFT JOIN mission_assignments ma ON p.personnel_id = ma.personnel_id
GROUP BY p.personnel_id ORDER BY mission_count DESC;

-- Q295. RIGHT JOIN - all awards even if not awarded to anyone
SELECT a.award_name, pa.personnel_id, pa.awarded_date
FROM personnel_awards pa
RIGHT JOIN awards a ON pa.award_id = a.award_id;

-- Q296. Join training enrollments with scores and program details
SELECT tp.program_name, tp.branch_id,
       AVG(te.score) AS avg_score,
       MAX(te.score) AS max_score,
       MIN(te.score) AS min_score
FROM training_enrollments te
JOIN training_programs tp ON te.program_id = tp.program_id
GROUP BY tp.program_id, tp.program_name, tp.branch_id;

-- Q297. Personnel with more than 1 mission assignment
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       COUNT(ma.mission_id) AS mission_count
FROM personnel p
JOIN mission_assignments ma ON p.personnel_id = ma.personnel_id
GROUP BY p.personnel_id HAVING mission_count > 1
ORDER BY mission_count DESC;

-- Q298. Equipment total value per branch using join
SELECT mb.branch_name,
       SUM(e.quantity * e.unit_cost_usd) AS total_inventory_value
FROM equipment e
JOIN military_branches mb ON e.branch_id = mb.branch_id
GROUP BY mb.branch_name ORDER BY total_inventory_value DESC;

-- Q299. Bases with personnel count using join
SELECT b.base_name, b.location_city,
       COUNT(p.personnel_id) AS personnel_count
FROM bases b
LEFT JOIN personnel p ON b.base_id = p.base_id
GROUP BY b.base_id ORDER BY personnel_count DESC;

-- Q300. Countries with number of missions
SELECT c.country_name, COUNT(m.mission_id) AS mission_count
FROM countries c
LEFT JOIN missions m ON c.country_id = m.country_id
GROUP BY c.country_id ORDER BY mission_count DESC;

-- Q301. Missions assigned to most personnel
SELECT m.mission_name, m.mission_type, COUNT(ma.personnel_id) AS team_size
FROM missions m
JOIN mission_assignments ma ON m.mission_id = ma.mission_id
GROUP BY m.mission_id ORDER BY team_size DESC;

-- Q302. Top scoring trainees with branch info
SELECT CONCAT(p.first_name,' ',p.last_name) AS trainee,
       mb.branch_name, te.score, tp.program_name
FROM training_enrollments te
JOIN personnel p ON te.personnel_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
JOIN training_programs tp ON te.program_id = tp.program_id
ORDER BY te.score DESC LIMIT 10;

-- Q303. Personnel who won Param Vir Chakra
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       a.award_name, pa.awarded_date, pa.awarded_for
FROM personnel_awards pa
JOIN personnel p ON pa.personnel_id = p.personnel_id
JOIN awards a ON pa.award_id = a.award_id
WHERE a.award_name = 'Param Vir Chakra';

-- Q304. Contracts with branch info ordered by value
SELECT c.contract_number, c.vendor_name, mb.branch_name,
       c.value_usd, c.status
FROM contracts c
JOIN military_branches mb ON c.branch_id = mb.branch_id
ORDER BY c.value_usd DESC;

-- Q305. Training programs with instructor branch
SELECT tp.program_name,
       CONCAT(p.first_name,' ',p.last_name) AS instructor,
       mb.branch_name AS instructor_branch,
       tp.duration_days, tp.status
FROM training_programs tp
JOIN personnel p ON tp.instructor_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id;

-- Q306. Mission assignments with mission type and personnel rank
SELECT ma.role, m.mission_type,
       CONCAT(p.first_name,' ',p.last_name) AS personnel,
       r.rank_name
FROM mission_assignments ma
JOIN missions m ON ma.mission_id = m.mission_id
JOIN personnel p ON ma.personnel_id = p.personnel_id
JOIN ranks r ON p.rank_id = r.rank_id;

-- Q307. Equipment at bases in Maharashtra
SELECT e.equipment_name, e.quantity, b.base_name, b.location_city
FROM equipment e
JOIN bases b ON e.base_id = b.base_id
WHERE b.location_state = 'Maharashtra';

-- Q308. Naval personnel with their base details
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       r.rank_name, b.base_name, b.location_city
FROM personnel p
JOIN ranks r ON p.rank_id = r.rank_id
JOIN bases b ON p.base_id = b.base_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
WHERE mb.branch_code = 'NAVY';

-- Q309. Air Force equipment with category
SELECT e.equipment_name, ec.category_name, e.quantity,
       e.unit_cost_usd, e.status
FROM equipment e
JOIN equipment_categories ec ON e.category_id = ec.category_id
JOIN military_branches mb ON e.branch_id = mb.branch_id
WHERE mb.branch_code = 'IAF';

-- Q310. All combat missions with commanding officer and country
SELECT m.mission_name, m.start_date, m.end_date,
       c.country_name,
       CONCAT(p.first_name,' ',p.last_name) AS commander,
       m.outcome
FROM missions m
JOIN countries c ON m.country_id = c.country_id
JOIN personnel p ON m.commanding_officer_id = p.personnel_id
WHERE m.mission_type = 'Combat';

-- Q311. Personnel from bases with capacity over 3000
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       p.specialization, b.base_name, b.capacity
FROM personnel p
JOIN bases b ON p.base_id = b.base_id
WHERE b.capacity > 3000;

-- Q312. Personnel awards with branch info
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       mb.branch_name, a.award_name, pa.awarded_date
FROM personnel_awards pa
JOIN personnel p ON pa.personnel_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
JOIN awards a ON pa.award_id = a.award_id
ORDER BY pa.awarded_date DESC;

-- Q313. Contracts with end date after 2025
SELECT c.contract_number, c.vendor_name, mb.branch_name,
       c.end_date, c.value_usd
FROM contracts c
JOIN military_branches mb ON c.branch_id = mb.branch_id
WHERE c.end_date > '2025-12-31';

-- Q314. Training programs in Army bases
SELECT tp.program_name, b.base_name, tp.duration_days,
       tp.max_participants, tp.status
FROM training_programs tp
JOIN bases b ON tp.base_id = b.base_id
JOIN military_branches mb ON tp.branch_id = mb.branch_id
WHERE mb.branch_code = 'ARMY';

-- Q315. Missions with assigned roles list
SELECT m.mission_name, GROUP_CONCAT(ma.role SEPARATOR ', ') AS roles
FROM missions m
JOIN mission_assignments ma ON m.mission_id = ma.mission_id
GROUP BY m.mission_id, m.mission_name;

-- Q316. Personnel count per branch with branch name
SELECT mb.branch_name, COUNT(p.personnel_id) AS personnel_count
FROM military_branches mb
LEFT JOIN personnel p ON mb.branch_id = p.branch_id
GROUP BY mb.branch_id ORDER BY personnel_count DESC;

-- Q317. Equipment count per base with base name
SELECT b.base_name, b.location_city, COUNT(e.equipment_id) AS equipment_types,
       SUM(e.quantity) AS total_quantity
FROM bases b
LEFT JOIN equipment e ON b.base_id = e.base_id
GROUP BY b.base_id ORDER BY total_quantity DESC;

-- Q318. Training enrollments with pass or fail by branch
SELECT mb.branch_name, te.result, COUNT(*) AS count
FROM training_enrollments te
JOIN personnel p ON te.personnel_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
GROUP BY mb.branch_name, te.result;

-- Q319. Bases in NATO countries
SELECT b.base_name, c.country_name, c.alliance, b.capacity
FROM bases b
JOIN countries c ON b.country_id = c.country_id
WHERE c.alliance = 'NATO';

-- Q320. Personnel who instructed training programs
SELECT DISTINCT CONCAT(p.first_name,' ',p.last_name) AS instructor,
       mb.branch_name, COUNT(tp.program_id) AS programs_taught
FROM training_programs tp
JOIN personnel p ON tp.instructor_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
GROUP BY p.personnel_id ORDER BY programs_taught DESC;

-- Q321. CROSS JOIN - all rank and branch combinations
SELECT r.rank_name, mb.branch_name
FROM ranks r
CROSS JOIN military_branches mb
LIMIT 20;

-- Q322. SELF JOIN - find personnel in same base
SELECT p1.first_name AS personnel1, p2.first_name AS personnel2,
       b.base_name
FROM personnel p1
JOIN personnel p2 ON p1.base_id = p2.base_id AND p1.personnel_id < p2.personnel_id
JOIN bases b ON p1.base_id = b.base_id
LIMIT 15;

-- Q323. Personnel with highest rank in each branch
SELECT mb.branch_name,
       CONCAT(p.first_name,' ',p.last_name) AS name,
       r.rank_name, r.rank_level
FROM personnel p
JOIN ranks r ON p.rank_id = r.rank_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
WHERE r.rank_level = (
    SELECT MAX(r2.rank_level) FROM personnel p2
    JOIN ranks r2 ON p2.rank_id = r2.rank_id
    WHERE p2.branch_id = p.branch_id);

-- Q324. Most expensive equipment per category
SELECT ec.category_name, e.equipment_name, e.unit_cost_usd
FROM equipment e
JOIN equipment_categories ec ON e.category_id = ec.category_id
WHERE e.unit_cost_usd = (
    SELECT MAX(e2.unit_cost_usd) FROM equipment e2
    WHERE e2.category_id = e.category_id);

-- Q325. Missions with personnel count and mission details
SELECT m.mission_name, m.mission_type, m.status,
       COUNT(ma.personnel_id) AS team_size,
       FORMAT(m.budget_usd, 0) AS budget_formatted
FROM missions m
LEFT JOIN mission_assignments ma ON m.mission_id = ma.mission_id
GROUP BY m.mission_id ORDER BY team_size DESC;

-- Q326. Personnel who participated in combat missions
SELECT DISTINCT CONCAT(p.first_name,' ',p.last_name) AS name,
       p.specialization, mb.branch_name
FROM personnel p
JOIN mission_assignments ma ON p.personnel_id = ma.personnel_id
JOIN missions m ON ma.mission_id = m.mission_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
WHERE m.mission_type = 'Combat';

-- Q327. Training programs with pass rate
SELECT tp.program_name,
       COUNT(te.enrollment_id) AS total_enrolled,
       SUM(CASE WHEN te.result = 'Pass' THEN 1 ELSE 0 END) AS passed,
       ROUND(SUM(CASE WHEN te.result = 'Pass' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pass_rate
FROM training_programs tp
LEFT JOIN training_enrollments te ON tp.program_id = te.program_id
GROUP BY tp.program_id;

-- Q328. Award winners with mission participation
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       COUNT(DISTINCT pa.award_id) AS awards_won,
       COUNT(DISTINCT ma.mission_id) AS missions_participated
FROM personnel p
LEFT JOIN personnel_awards pa ON p.personnel_id = pa.personnel_id
LEFT JOIN mission_assignments ma ON p.personnel_id = ma.personnel_id
GROUP BY p.personnel_id ORDER BY awards_won DESC;

-- Q329. Bases with equipment inventory value
SELECT b.base_name, b.location_city, mb.branch_name,
       COALESCE(SUM(e.quantity * e.unit_cost_usd), 0) AS inventory_value
FROM bases b
JOIN military_branches mb ON b.branch_id = mb.branch_id
LEFT JOIN equipment e ON b.base_id = e.base_id
GROUP BY b.base_id ORDER BY inventory_value DESC;

-- Q330. Countries with bases and missions count
SELECT c.country_name,
       COUNT(DISTINCT b.base_id) AS base_count,
       COUNT(DISTINCT m.mission_id) AS mission_count
FROM countries c
LEFT JOIN bases b ON c.country_id = b.country_id
LEFT JOIN missions m ON c.country_id = m.country_id
GROUP BY c.country_id ORDER BY base_count DESC;

-- Q331. Personnel with training completion count
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       mb.branch_name,
       COUNT(te.enrollment_id) AS trainings_completed,
       AVG(te.score) AS avg_score
FROM personnel p
JOIN military_branches mb ON p.branch_id = mb.branch_id
LEFT JOIN training_enrollments te ON p.personnel_id = te.personnel_id
GROUP BY p.personnel_id ORDER BY trainings_completed DESC;

-- Q332. Contracts by branch with total and average value
SELECT mb.branch_name,
       COUNT(c.contract_id) AS contract_count,
       SUM(c.value_usd) AS total_value,
       AVG(c.value_usd) AS avg_value
FROM contracts c
JOIN military_branches mb ON c.branch_id = mb.branch_id
GROUP BY mb.branch_name ORDER BY total_value DESC;

-- Q333. Equipment from countries in QUAD alliance
SELECT e.equipment_name, e.country_of_origin, e.quantity, e.status
FROM equipment e
WHERE e.country_of_origin IN (
    SELECT country_name FROM countries WHERE alliance = 'QUAD');

-- Q334. Personnel at bases established before 1950
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       b.base_name, b.established_year, p.specialization
FROM personnel p
JOIN bases b ON p.base_id = b.base_id
WHERE b.established_year < 1950;

-- Q335. Top 5 highest scoring personnel across all training
SELECT CONCAT(p.first_name,' ',p.last_name) AS name,
       mb.branch_name, AVG(te.score) AS avg_score
FROM training_enrollments te
JOIN personnel p ON te.personnel_id = p.personnel_id
JOIN military_branches mb ON p.branch_id = mb.branch_id
GROUP BY p.personnel_id ORDER BY avg_score DESC LIMIT 5;

-- Q336. Humanitarian missions with budget and outcome
SELECT m.mission_name, c.country_name,
       FORMAT(m.budget_usd, 0) AS budget,
       m.outcome, m.start_date, m.end_date
FROM missions m
JOIN countries c ON m.country_id = c.country_id
WHERE m.mission_type = 'Humanitarian';

-- Q337. All equipment at Navy bases
SELECT e.equipment_name, ec.category_name, e.quantity, b.base_name
FROM equipment e
JOIN equipment_categories ec ON e.category_id = ec.category_id
JOIN bases b ON e.base_id = b.base_id
JOIN military_branches mb ON b.branch_id = mb.branch_id
WHERE mb.branch_code = 'NAVY';

-- Q338. Personnel who both trained and went on missions
SELECT DISTINCT CONCAT(p.first_name,' ',p.last_name) AS name,
       p.specialization
FROM personnel p
WHERE p.personnel_id IN (SELECT personnel_id FROM training_enrollments)
AND p.personnel_id IN (SELECT personnel_id FROM mission_assignments);

-- Q339. Ranks present in personnel with count
SELECT r.rank_name, r.rank_level, mb.branch_name,
       COUNT(p.personnel_id) AS personnel_count
FROM ranks r
JOIN military_branches mb ON r.branch_id = mb.branch_id
LEFT JOIN personnel p ON r.rank_id = p.rank_id
GROUP BY r.rank_id ORDER BY personnel_count DESC;

-- Q340. Training programs never enrolled in
SELECT tp.program_name, tp.branch_id, tp.duration_days, tp.status
FROM training_programs tp
LEFT JOIN training_enrollments te ON tp.program_id = te.program_id
WHERE te.enrollment_id IS NULL;



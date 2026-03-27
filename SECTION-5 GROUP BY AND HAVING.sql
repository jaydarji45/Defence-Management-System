-- ==============================================================================
-- SECTION 5 : GROUP BY AND HAVING (221 TO 270)
-- ==============================================================================

-- Q221. Count personnel per branch
SELECT branch_name ,COUNT(*)
FROM military_branches  
GROUP BY branch_name ;

-- Q222. Count personnel per status
SELECT status , COUNT(personnel_id)
FROM personnel 
GROUP BY status ;

-- Q223. Count personnel per gender
SELECT gender , COUNT(personnel_id) AS SEPARATE
FROM personnel 
GROUP BY gender ;

-- Q224. Count equipment per status
SELECT status ,COUNT(equipment_id)
FROM equipment 
GROUP BY status ;


-- Q225. Count equipment per category
SELECT category_id ,COUNT(equipment_id)
FROM equipment
GROUP BY  category_iD ;

-- Q226. Count missions per type
SELECT mission_type ,COUNT(mission_id)
FROM missions 
GROUP BY mission_type ;
 
-- Q227. Count missions per status
SELECT status ,COUNT(mission_id)
FROM missions 
GROUP BY status ;

-- Q228. Count contracts per type
SELECT contract_type , COUNT(contract_id)
FROM contracts 
GROUP BY contract_type ;

-- Q229. Count contracts per status
SELECT status, COUNT(contract_id)
FROM contracts 
GROUP BY status ;

-- Q230. Count countries per alliance
SELECT alliance ,COUNT(country_id)
FROM countries 
GROUP BY alliance ;

-- Q231. Count countries per region
SELECT region ,COUNT(country_id)
FROM countries 
GROUP BY region ;


-- Q232. Count bases per branch
SELECT branch_id ,COUNT(base_id)
FROM bases 
GROUP BY branch_id ;

-- Q233. Count ranks per branch
SELECT branch_id,COUNT(rank_id)
FROM ranks 
GROUP BY branch_id ;


-- Q234. Sum of equipment quantity per branch
SELECT branch_id ,SUM(quantity)
FROM equipment 
GROUP BY branch_id ;

-- Q235. Average equipment cost per category
SELECT category_id , AVG(unit_cost_usd)
FROM equipment 
GROUP BY category_id ;

-- Q236. Total contract value per branch
SELECT branch_id , SUM(value_usd)
FROM contracts 
GROUP BY branch_id ;

SELECT *
FROM contracts ;

-- Q237. Total contract value per country
SELECT vendor_county
FROM contracts 
GROUP BY vendor_county ;

-- Q238. Average training duration per branch
SELECT branch_id , AVG(duration_days)
FROM training_programs 
GROUP BY branch_id ;

-- Q239. Max mission budget per type
SELECT mission_type ,MAX(budget_usd)
FROM missions
GROUP BY mission_type ;

-- Q240. Min mission budget per type
SELECT mission_type ,MIN(budget_usd)
FROM missions
GROUP BY mission_type ;

-- Q241. Total mission budget per country
SELECT country_id ,SUM(budget_usd)
FROM missions 
GROUP BY country_id ;

-- Q242. Count training enrollments per result
SELECT result , COUNT(*)
FROM training_enrollments 
GROUP BY result ;

-- Q243. Average score per training program
SELECT program_id ,AVG(score)
FROM training_enrollments 
GROUP BY  program_id ;

-- Q244. Count awards per type
SELECT award_type ,COUNT(*)
FROM awards 
GROUP BY award_type ;

-- Q245. Count personnel awards per personnel
SELECT personnel_id, COUNT(*) AS award_count
FROM personnel_awards
GROUP BY personnel_id 
ORDER BY award_count DESC ;


-- Q246. Total equipment value per base
SELECT base_id, SUM(quantity * unit_cost_usd) AS total_value
FROM equipment 
GROUP BY base_id 
ORDER BY total_value DESC;

-- Q247. Count equipment per manufacturer
SELECT manufacturer, COUNT(*) AS count
FROM equipment 
GROUP BY manufacturer 
ORDER BY count DESC;

-- Q248. Count missions per year
SELECT YEAR(start_date) AS year, COUNT(*) AS mission_count
FROM missions 
GROUP BY YEAR(start_date) 
ORDER BY year;

-- Q249. Count personnel enlisted per year
SELECT YEAR(enlistment_date) AS year, COUNT(*) AS count
FROM personnel 
GROUP BY YEAR(enlistment_date) 
ORDER BY year;

-- Q250. Count bases per country
SELECT country_id, COUNT(*) AS base_count
FROM bases 
GROUP BY country_id;

-- Q251. Branches with more than 5 personnel
SELECT branch_id, COUNT(*) AS count
FROM personnel 
GROUP BY branch_id 
HAVING count > 5;

-- Q252. Equipment categories with more than 3 items
SELECT category_id, COUNT(*) AS count
FROM equipment 
GROUP BY category_id 
HAVING count > 3;

-- Q253. Countries with more than 5 countries in same region
SELECT region, COUNT(*) AS count
FROM countries 
GROUP BY region 
HAVING count > 5;

-- Q254. Vendors with total contract value > 1 billion
SELECT vendor_country, SUM(value_usd) AS total
FROM contracts 
GROUP BY vendor_country 
HAVING total > 1000000000;

-- Q255. Training programs with average score > 90
SELECT program_id, AVG(score) AS avg_score
FROM training_enrollments 
GROUP BY program_id 
HAVING avg_score > 90;

-- Q256. Branches with average training duration > 60 days
SELECT branch_id, AVG(duration_days) AS avg_days
FROM training_programs 
GROUP BY branch_id 
HAVING avg_days > 60;

-- Q257. Bases with total equipment quantity > 1000
SELECT base_id, SUM(quantity) AS total_qty
FROM equipment 
GROUP BY base_id 
HAVING total_qty > 1000;

-- Q258. Mission types with total budget > 500 million
SELECT mission_type, SUM(budget_usd) AS total_budget
FROM missions 
GROUP BY mission_type 
HAVING total_budget > 500000000;

-- Q259. Personnel with more than 1 award
SELECT personnel_id, COUNT(*) AS award_count
FROM personnel_awards 
GROUP BY personnel_id 
HAVING award_count > 1;

-- Q260. Contract types with average value > 1 billion
SELECT contract_type, AVG(value_usd) AS avg_value
FROM contracts 
GROUP BY contract_type 
HAVING avg_value > 1000000000;

-- Q261. Regions with more than 3 countries
SELECT region, COUNT(*) AS country_count
FROM countries 
GROUP BY region 
HAVING country_count > 3;

-- Q262. Alliances with more than 5 member countries
SELECT alliance, COUNT(*) AS count
FROM countries 
GROUP BY alliance 
HAVING count > 5;

-- Q263. Equipment manufacturers with more than 2 items
SELECT manufacturer, COUNT(*) AS count
FROM equipment 
GROUP BY manufacturer 
HAVING count > 2;

-- Q264. Bases with capacity greater than average capacity
SELECT base_id, base_name, capacity FROM bases
WHERE capacity > (SELECT AVG(capacity) FROM bases);

-- Q265. Branches with total equipment quantity above average
SELECT branch_id, SUM(quantity) AS total
FROM equipment 
GROUP BY branch_id
HAVING total > (SELECT AVG(quantity) FROM equipment);

-- Q266. Training programs with max participants above 40
SELECT program_id, program_name, max_participants
FROM training_programs 
GROUP BY program_id 
HAVING max_participants > 40;

-- Q267. Count of missions per commanding officer
SELECT commanding_officer_id, COUNT(*) AS missions_led
FROM missions 
GROUP BY commanding_officer_id 
ORDER BY missions_led DESC;

-- Q268. Total quantity of operational equipment per branch
SELECT branch_id, SUM(quantity) AS total_qty
FROM equipment 
WHERE status = 'Operational'
GROUP BY branch_id 
ORDER BY total_qty DESC;

-- Q269. Count of personnel per base
SELECT base_id, COUNT(*) AS personnel_count
FROM personnel 
GROUP BY base_id 
ORDER BY personnel_count DESC;

-- Q270. Average score per personnel in training enrollments
SELECT personnel_id, AVG(score) AS avg_score, COUNT(*) AS programs_attended
FROM training_enrollments 
GROUP BY personnel_id 
ORDER BY avg_score DESC;



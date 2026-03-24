-- ======================================================================
-- ORDER BY (181 TO 220)
-- ======================================================================

-- Q181. Display all personnel ordered by last name A-Z
SELECT *
FROM personnel 
ORDER BY last_name ASC ;

-- Q182. Display all personnel ordered by last name Z-A
SELECT *
FROM personnel 
ORDER BY last_name DESC ;

-- Q183. Display equipment ordered by unit cost highest first
SELECT *
FROM equipment 
ORDER BY unit_cost_usd DESC ;

-- Q184. Display equipment ordered by unit cost lowest first
SELECT *
FROM equipment 
ORDER BY unit_cost_usd ASC ;

-- Q185. Display missions ordered by budget highest first
SELECT *
FROM missions 
ORDER BY budget_usd DESC ;

-- Q186. Display missions ordered by start date latest first
SELECT *
FROM missions 
ORDER BY start_date DESC ;

-- Q187. Display missions ordered by start date oldest first
SELECT *
FROM missions 
ORDER BY start_date ASC ;

-- Q188. Display contracts ordered by value highest first
SELECT *
FROM contracts 
ORDER BY value_usd DESC ;

-- Q189. Display contracts ordered by value lowest first
SELECT *
FROM contracts 
ORDER BY value_usd DESC ;

-- Q190. Display ranks ordered by rank level highest first
SELECT *
FROM ranks 
ORDER BY rank_level DESC ;

-- Q191. Display ranks ordered by rank level lowest first
SELECT *
FROM ranks 
ORDER BY rank_level ASC ;

-- Q192. Display bases ordered by capacity highest first
SELECT *
FROM bases 
ORDER BY capacity DESC ;

-- Q193. Display bases ordered by established year oldest first
SELECT *
FROM bases 
ORDER BY established_year ASC ;

-- Q194. Display personnel ordered by enlistment date oldest first
SELECT *
FROM personnel 
ORDER BY enlistment_date ASC ;

-- Q195. Display training programs ordered by duration longest first
SELECT *
FROM training_programs 
ORDER BY duretion DESC ;

-- Q196. Display countries ordered by country name A-Z
SELECT *
FROM countries 
ORDER BY county_name ASC ;

-- Q197. Display equipment ordered by quantity highest first
SELECT *
FROM equipment 
ORDER BY quantity DESC ;

-- Q198. Display personnel ordered by date of birth oldest first
SELECT *
FROM personnel 
ORDER BY date_of_birth ASC ;

-- Q199. Display missions ordered by budget lowest first
SELECT *
FROM missions 
ORDER BY budget_usd ASC ;

-- Q200. Display training programs ordered by max participants
SELECT *
FROM training_programs 
ORDER BY max_participants DESC ;

-- Q201. Display personnel ordered by branch_id then rank_id
SELECT *
FROM personnel 
ORDER BY branch_id ASC , rank_id DESC ;

-- Q202. Display equipment ordered by category then status
SELECT *
FROM equipment 
ORDER BY category_id DESC , status DESC ;

-- Q203. Display contracts ordered by vendor country then value
SELECT *
FROM contracts 
ORDER BY vendor_country DESC , value_usd ;

-- Q204. Display bases ordered by state then city
SELECT *
FROM bases 
ORDER BY city DESC , city ASC ;

-- Q205. Display missions ordered by type then start date
SELECT *
FROM missions 
ORDER BY mission_type ASC , start_date ASC ;

-- Q206. Top 10 most expensive equipment
SELECT *
FROM equipment 
ORDER BY unit_cost_usd DESC 
LIMIT 10 ;

-- Q207. Top 5 largest military bases by capacity
SELECT *
FROM bases  
ORDER BY capacity DESC 
LIMIT 5 ;

-- Q208. Top 10 highest value contracts
SELECT *
FROM contracts 
ORDER BY value_usd DESC 
LIMIT 10 ;

-- Q209. Top 5 most funded missions
SELECT *
FROM missions 
ORDER BY budget_usd DESC 
LIMIT 5 ;

-- Q210. Top 10 most recently enlisted personnel
SELECT *
FROM personnel 
ORDER BY enlistment_date DESC
LIMIT 10 ;

-- Q211. Bottom 5 lowest capacity bases
SELECT *
FROM bases 
ORDER BY capacity ASC
LIMIT 5 ;

-- Q212. 5 oldest military bases
SELECT *
FROM bases 
ORDER BY established_year ASC 
LIMIT  5 ;

-- Q213. 5 newest military bases
SELECT *
FROM bases
ORDER BY established_year DESC
LIMIT 1 ;

-- Q214. Top 5 equipment by quantity
SELECT *
FROM equipment 
ORDER BY quantity DESC 
LIMIT 5 ;

-- Q215. Top 5 longest training programs
SELECT *
FROM training_programs 
ORDER BY duration_days DESC 
LIMIT 5 ;

-- Q216. Display personnel ordered by first name then last name
SELECT first_name, last_name, specialization 
FROM personnel
ORDER BY first_name, last_name ;

-- Q217. Display awards ordered by award type then name
SELECT award_type , award_name
FROM awards 
ORDER BY award_type , award_name ;

-- Q218. Display missions ordered by country_id then status
SELECT *
FROM missions 
ORDER BY country_id , status ;

-- Q219. Display training enrollments ordered by score highest first
SELECT *
FROM training_enrollments 
ORDER BY score DESC ;

-- Q220. Display training enrollments ordered by enrollment date
SELECT *
FROM training_enrollments 
ORDER BY enrollment_date ASC ;










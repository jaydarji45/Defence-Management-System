-- ===========================================================================
-- SECTION-3 AND,OR,NOT,LIKE,BETWEEN, IN(121 TO 180)
-- ===========================================================================
-- Q121. Find active female personnel
SELECT *
FROM personnel 
WHERE gender = 'female' AND status = 'active' ;

-- Q122. Find active male personnel in Army
SELECT *
FROM personnel
WHERE gender = 'male' AND status = 'active' ;

-- Q123. Find personnel in Navy or Air Force 
SELECT *
FROM personnel 
WHERE branch_id = 2 OR branch_id = 3 ;

-- Q124. Find countries in Europe or North America
SELECT *
FROM countries 
WHERE region = 'Europe' OR region = 'North America';

-- Q125. Find equipment that is not operational
SELECT *
FROM equipment 
WHERE status <> 'operational';

-- Q126. Find personnel who are NOT active
SELECT *
FROM personnel 
WHERE  status != 'active';

-- Q127. Find bases with capacity between 1000 and 5000
SELECT *
FROM bases 
WHERE capacity BETWEEN 1000 AND 5000 ;

-- Q128. Find equipment with unit cost between 1000000 and 50000000
SELECT *
FROM equipment 
WHERE unit_cost_usd BETWEEN 1000000 AND 50000000 ;

-- Q129. Find missions with budget between 10000000 and 100000000
SELECT *
FROM missions 
WHERE budget_usd BETWEEN 100000000 AND 100000000 ;

-- Q130. Find ranks with level between 5 and 8
SELECT *
FROM ranks
WHERE rank_level BETWEEN 5 AND  8 ;

-- Q131. Find countries in NATO, QUAD or SCO
SELECT *
FROM countries 
WHERE  alliance IN('NATO','QUAD','SCO') ;

-- Q132. Find personnel in branches 1, 2, or 3
SELECT *
FROM personnel 
WHERE branch_id IN (1,2,3) ;

-- Q133. Find missions of type Combat or Peacekeeping
SELECT *
FROM missions
WHERE mission_type = 'combat' OR mission_type = 'peackeeping' ;

-- Q134. Find contracts from India, USA or France
SELECT *
FROM contracts 
WHERE vendor_country IN('India','USA','France');

-- Q135. Find equipment with status Operational or Under Maintenance
SELECT *
FROM equipment
WHERE status IN ('Operational','Under Maintenance') ;

-- Q136. Find training programs with status Completed or Ongoing
SELECT *
FROM training_programs
WHERE status IN ('completed','ongoing');

-- Q137. Find awards that are NOT medals
SELECT *
FROM awards 
WHERE NOT award_type = 'medals' ;

-- Q138. Find personnel NOT in Army or Navy
SELECT *
FROM personnel 
WHERE branch_id <> 1 and branch_id != 2 ;

-- Q139. Find countries NOT in NATO
SELECT *
FROM countries 
WHERE NOT alliance = 'nato' ;

-- Q140. Find personnel with name starting with 'A'
SELECT *
FROM personnel 
WHERE first_name LIKE 'A%' ;


-- Q141. Find personnel with name starting with 'R'
SELECT *
FROM personnel 
WHERE first_name LIKE 'R%' ;


-- Q142. Find personnel with last name ending in 'a'
SELECT *
FROM personnel 
WHERE first_name LIKE '%a' ;

-- Q143. Find personnel with 'Kumar' in their last name
SELECT *
FROM personnel 
WHERE last_name LIKE '%kumar%' ;

-- Q144. Find bases with 'Air Force' in the name
SELECT *
FROM bases 
WHERE base_name LIKE '%AIR FORCE%';


-- Q145. Find bases with 'Naval' in the name
SELECT *
FROM bases 
WHERE base_name LIKE '%NAVAL%' ;

-- Q146. Find missions with 'Operation' in name
SELECT *
FROM missions 
WHERE mission_name LIKE '%Operation%' ;

-- Q147. Find missions with 'Exercise' in name
SELECT *
FROM missions 
WHERE mission_name LIKE '%ExERcise%' ;

-- Q148. Find contracts with 'HAL' as vendor
SELECT *
FROM contracts 
WHERE vendor_name LIKE'%hal%';

-- Q149. Find equipment with 'Missile' in name
SELECT *
FROM equipment 
WHERE equipment_name LIKE'%missile%' ;

-- Q150. Find equipment with 'Helicopter' in name
SELECT *
FROM equipment 
WHERE equipment_name LIKE'%Helicopter%' ;

-- Q151. Find personnel enlisted between 2000 and 2010
SELECT *
FROM personnel 
WHERE YEAR(enlistment_date) BETWEEN 2000 AND 2010 ;

-- Q152. Find equipment acquired between 2010 and 2020
 SELECT *
 FROM equipment 
 WHERE year_acquired BETWEEN 2010 AND 2020 ;
 
 -- Q153. Find missions started between 2020 and 2024
SELECT *
FROM missions 
WHERE YEAR (start_date) BETWEEN 2020 AND 2024 ;

-- Q154. Find contracts starting between 2021 and 2023
SELECT *
FROM contracts
WHERE YEAR (start_date) BETWEEN 2021 AND 2023 ;

-- Q155. Find active female personnel in Air Force
SELECT *
FROM personnel 
WHERE branch_id = 3 AND status = 'ACTIVE' ;

-- Q156. Find bases in Maharashtra or Rajasthan
SELECT *
FROM bases 
WHERE location_state = 'Maharashtra' OR location_state = 'Rajasthan' ;

-- Q157. Find personnel with specialization containing 'Warfare'
SELECT *
FROM personnel 
WHERE specialization LIKE '%Warfare%';

-- Q158. Find equipment with manufacturer containing 'DRDO'
SELECT *
FROM equipment
WHERE manufacturer LIKE '%DRDO%' ;

-- Q159. Find equipment with manufacturer containing 'HAL'
SELECT *
FROM equipment
WHERE manufacturer LIKE '%HAL%' ;

-- Q160. Find missions NOT completed
SELECT COUNT(*)
FROM missions 
WHERE status <> 'completed' ;
SELECT COUNT(*) FROM missions WHERE status NOT IN ('Completed') ;

-- Q161. Find countries NOT in Asia region
SELECT *
FROM countries 
WHERE region NOT IN ('Asia');

-- Q162. Find personnel born between 1980 and 1990
SELECT *
FROM personnel 
WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31' ;

-- Q163. Find bases with capacity between 2000 and 10000
SELECT *
FROM bases 
WHERE capacity BETWEEN 2000 AND 10000 ;

-- Q164. Find contracts with value between 500000000 and 5000000000
SELECT *
FROM contracts 
WHERE value_usd BETWEEN 50000000 AND 5000000000 ;

-- Q165. Find training programs lasting between 30 and 90 days
SELECT *
FROM training_programs 
WHERE duration_days BETWEEN 30 AND 90 ;

-- Q166. Find personnel with 'Pilot' in specialization
SELECT *
FROM personnel
WHERE specialization  LIKE '%pilot%' ;


-- Q167. Find awards with 'Service' in name
SELECT *
FROM awards 
WHERE award_name LIKE '%service%' ;

-- Q168. Find missions with 'India' in location
SELECT *
FROM missions 
WHERE location LIKE '%india%' ;

-- Q169. Find equipment from Russia or India
SELECT *
FROM equipment 
WHERE country_of_origin IN ('INDIA' ,'RUSSIA') ;

-- Q170. Find personnel NOT from India nationality
SELECT *
FROM personnel 
WHERE nationality != 'India' ;

-- Q171. Find active bases in India (country_id = 1)
SELECT *
FROM bases 
WHERE is_active = 1 ;

-- Q172. Find missions with budget greater than 50 million AND completed
SELECT *
FROM missions 
WHERE budget_usd > 5000000 AND status = 'Completed' ;

-- Q173. Find equipment with quantity greater than 50 AND operational
SELECT *
FROM equipment 
WHERE quantity > 50 AND status = 'Operational' ;

-- Q174. Find contracts active AND from India
SELECT *
FROM contracts 
WHERE status = 'Active' AND vendor_country = 'India' ;

-- Q175. Find personnel active AND male AND in Special Forces
SELECT *
FROM personnel 
WHERE status = 'ACTIVE' AND gender = 'MALE' AND branch_id = 3 ;

-- Q176. Find ranks for Army (branch_id=1) OR Navy (branch_id=2)
SELECT *
FROM ranks 
WHERE branch_id = 1  OR branch_id = 2 ;

-- Q177. Find missions that are ongoing OR planned
SELECT *
FROM missions 
WHERE status = 'ONGOING' OR status = 'PLANNED' ;

-- Q178. Find countries with NULL alliance
SELECT *
FROM countries
WHERE alliance IS NULL ;

-- Q179. Find personnel with NULL phone number
SELECT *
FROM personnel 
WHERE phone IS NULL ;

-- Q180. Find missions with non-null end date
SELECT *
FROM missions 
WHERE end_date IS NOT NULL ;















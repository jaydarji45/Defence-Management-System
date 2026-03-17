-- =============================================================================
-- SECTION 1 : BASIC SELECT QUERIES (1 TO 50)
-- =============================================================================

USE defence_db ;

-- Q1. Display all records from countries table.
SELECT *
FROM countries ;

-- Q2. Display all records from military_branches table.
SELECT *
FROM military_branches ;

-- Q3. Display all records from ranks table
SELECT *
FROM ranks ;

-- Q4. Display all records from bases table.
SELECT *
FROM bases ;

-- Q5. Display all records from personnel table.
SELECT *
FROM personnel ;

-- Q6. Display all records from equipment table.
SELECT *
FROM equipment ;

-- Q7. Display all records from missions table.
SELECT *
FROM missions ;

-- Q8. Display all records from contracts table.
SELECT *
FROM contracts ;

-- Q9. Display all records from training_programs table.
SELECT *
FROM training_programs ;

-- Q10. Display all records from awards table.
SELECT *
FROM awards ;

-- Q11. Display only country names from countries.
SELECT country_name
FROM countries ;

-- Q12. Display branch names and codes from military_branches.
SELECT branch_name,branch_code
FROM military_branches ;

-- Q13. Display rank names and levels from ranks.
DESC ranks ;
SELECT rank_name,rank_level
FROM ranks ;

-- Q14. Display base names and cities from bases.
DESCRIBE bases ;
SELECT base_name,location_city
FROM bases ;

-- Q15. Display first name, last name and specialization of personnel.
DESC personnel ;
SELECT first_name,last_name,specialization
FROM personnel ;

-- Q16. Display equipment name, quantity and status.
DESC equipment ;
SELECT equipment_name,quantity,status
FROM equipment ;

-- Q17. Display mission name, type and status.
DESC missions ;
SELECT mission_name,mission_type,status
FROM missions ;

-- Q18. Display contract number, vendor name and value.
DESC contracts ;
SELECT contract_number , vendor_name ,value_usd
FROM contracts ;

-- Q19. Display program name and duration from training_programs.
DESC training_programs ;
SELECT program_name,duration_days
FROM training_programs ;

-- Q20. Display award name and type from awards.
DESC awards;
SELECT award_name,award_type
FROM awards ;

-- Q21. Display distinct regions from countries.
SELECT DISTINCT region
FROM countries ;

-- Q22. Display distinct alliances from countries.
SELECT DISTINCT alliance
FROM countries ;

-- Q23. Display distinct mission types from missions.
DESC missions ;
SELECT DISTINCT mission_type
FROM missions ;

-- Q24. Display distinct status values from personnel.
SELECT DISTINCT status
FROM personnel ;

-- Q25. Display distinct equipment status values.
DESC equipment ;
SELECT DISTINCT unit_cost_usd , status
FROM equipment ;

-- Q26. Display distinct contract types from contracts.
SELECT DISTINCT contract_type
FROM contracts ;


-- Q27. Display distinct genders from personnel.
SELECT DISTINCT gender
FROM personnel ;


-- Q28. Display distinct specializations from personnel.
SELECT DISTINCT specialization
FROM personnel ;
DESC personnel ;

-- Q29. Display distinct training program statuses.
SELECT DISTINCT status
FROM training_programs ;

-- Q30. Display distinct mission statuses.
SELECT DISTINCT status
FROM missions ;

-- Q31. Display personnel count.
SELECT COUNT(personnel_id) AS TOTAL_PERSONNELS
FROM personnel ;


-- Q32. Display total number of countries.
SELECT DISTINCT COUNT(country_id) AS TOTAL_COUNTRIES
FROM countries ;

-- Q33. Display total number of bases.
SELECT COUNT(base_id) AS TOTAL_BASES
FROM bases ;

-- Q34. Display total number of missions.
SELECT COUNT(mission_id) AS TOTAL_MISSION
FROM missions ;

-- Q35. Display total number of equipment items.
SELECT COUNT(equipment_name) AS TOTAL_ITEMS
FROM equipment ;

-- Q36. Display total quantity of all equipment.
SELECT SUM(quantity) AS TOTAL_QUANTITY
FROM equipment  ;

-- Q37. Display total value of all contracts.
SELECT SUM(value_usd) AS TOTAL_VALUES
FROM contracts ;


-- Q38. Display average rank level from ranks.
SELECT AVG(rank_level) AS AVERGE_RANK_LEVEL
FROM ranks ;

-- Q39. Display maximum unit cost of equipment.
SELECT MAX(unit_cost_usd)
FROM equipment ;

-- Q40. Display minimum unit cost of equipment.
SELECT MIN(unit_cost_usd)
FROM equipment ;

-- Q41. Display maximum training program duration.
SELECT MAX(duration_days)
FROM training_programs ;

-- Q42. Display minimum training program duration.
SELECT MIN(duration_days)
FROM training_programs ;

-- Q43. Display average mission budget.
SELECT AVG(budget_usd)
FROM missions ;

-- Q44. Display maximum mission budget.
SELECT MAX(budget_usd)
FROM missions ;

-- Q45. Display minimum mission budget.
SELECT MIN(budget_usd)
FROM missions ;

-- Q46. Display total number of training programs.
SELECT COUNT(program_id)
FROM training_programs ;

-- Q47. Display total number of contracts.
SELECT COUNT(contract_id)
FROM contracts ;

-- Q48. Display total number of awards.
SELECT COUNT(award_id)
FROM awards ;


-- Q49. Display total number of ranks.
SELECT COUNT(*)
FROM ranks ;

-- Q50. Display total number of equipment categories.
SELECT COUNT(*) AS TOTAL_NUMBERS_CATEGORIES
FROM equipment ;






























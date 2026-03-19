-- ============================================================
-- SECTION 2: WHERE CLAUSE QUERIES (51-120)
-- ============================================================
USE defence_db ;


-- Q51. Find all active personnel.
SELECT *
FROM personnel 
WHERE status = 'ACTIVE' ;

-- Q52. Find all retired personnel.
SELECT *
FROM personnel 
WHERE status = 'RETIRED' ;

-- Q53. Find personnel from Army branch (branch_id = 1)
SELECT *
FROM military_branches
WHERE branch_id = 1 ;

-- Q54. Find personnel from Navy branch (branch_id = 2)
SELECT *
FROM military_branches 
WHERE branch_id = 2 ;

-- Q55. Find personnel from Air Force branch (branch_id = 3)
SELECT *
FROM military_branches 
WHERE branch_id = 3 ;

-- Q56. Find personnel with Fighter Pilot specialization
SELECT *
FROM personnel
WHERE specialization = 'fighter pilot' ;

-- Q57. Find personnel born after 1985
SELECT *
FROM personnel 
WHERE date_of_birth > '1985-01-01' ;

-- Q58. Find personnel born before 1980
SELECT *
FROM personnel
WHERE date_of_birth < '1980-01-01';

-- Q59. Find personnel enlisted after 2010
SELECT *
FROM personnel
WHERE enlistment_date > '2010-01-01' ;

-- Q60. Find male personnel
SELECT *
FROM personnel
WHERE gender = 'male' ;

-- Q61. Find female personnel
SELECT *
FROM personnel
WHERE gender = 'female' ;


-- Q62. Find all NATO alliance countries
SELECT *
FROM countries 
WHERE alliance = 'NATO';

-- Q63. Find all QUAD alliance countries
SELECT *
FROM countries 
WHERE alliance = 'QUAD';

-- Q64. Find all Non-Aligned countries
SELECT *
FROM countries 
WHERE alliance = 'Non-Aligned';

-- Q65. Find countries in Europe region
SELECT *
FROM countries 
WHERE region = 'europe';

-- Q66. Find countries in South Asia region
SELECT *
FROM countries 
WHERE region = 'South Asia';

-- Q67. Find countries in Middle East region
SELECT *
FROM countries 
WHERE region = 'Middle East';

-- Q68. Find active military bases
SELECT *
FROM bases 
WHERE is_active = 1 ;


-- Q69. Find bases with capacity greater than 5000
SELECT *
FROM bases
WHERE capacity > 5000 ;

-- Q70. Find bases with capacity less than 1000
SELECT *
FROM bases
WHERE capacity < 5000 ;

-- Q71. Find bases established before 1950
SELECT *
FROM bases
WHERE established_year < '1950-01-01' ;

-- Q72. Find bases established after 2000
SELECT *
FROM bases
WHERE established_year > '2000-01-01' ;

-- Q73. Find operational equipment
SELECT *
FROM equipment 
WHERE status = 'operational';

-- Q74. Find equipment under maintenance
SELECT *
FROM equipment 
WHERE status = 'under maintenance';

-- Q75. Find decommissioned equipment
SELECT *
FROM equipment 
WHERE status = 'decommissioned';

-- Q76. Find equipment with quantity greater than 100
SELECT *
FROM equipment
WHERE quantity > 100 ;

-- Q77. Find equipment with unit cost greater than 10000000
SELECT *
FROM equipment
WHERE unit_cost_usd > 10000000 ;

-- Q78. Find equipment from India
SELECT *
FROM equipment 
WHERE country_of_origin = 'INDIA' ; 

-- Q79. Find completed missions
SELECT *
FROM missions 
WHERE status = 'Completed' ;

-- Q80. Find ongoing missions
SELECT *
FROM missions 
WHERE status = 'ongoing' ;

-- Q81. Find planned missions
SELECT *
FROM missions 
WHERE status = 'Planned' ;

-- Q82. Find combat missions
SELECT *
FROM missions 
WHERE mission_type = 'combat' ;

-- Q83. Find humanitarian missions
SELECT *
FROM missions 
WHERE mission_type = 'humanitarian' ;

-- Q84. Find peacekeeping missions
SELECT *
FROM missions 
WHERE mission_type = 'peacekeeping' ;

-- Q85. Find joint exercise missions
SELECT *
FROM missions 
WHERE mission_type = 'joint exercise' ;

-- Q86. Find missions with budget greater than 100000000
SELECT *
FROM missions 
WHERE budget_usd > 100000000 ;

-- Q87. Find missions started after 2020
SELECT *
FROM missions 
WHERE start_date > '2020-01-01' ;

-- Q88. Find active contracts
SELECT *
FROM contracts 
WHERE status = 'Active';

-- Q89. Find completed contracts
SELECT *
FROM contracts 
WHERE status = 'completed';

-- Q90. Find equipment contracts
SELECT *
FROM contracts 
WHERE contract_type = 'Equipment';

-- Q91. Find R&D contracts
SELECT *
FROM contracts 
WHERE contract_type = 'R&D';

-- Q92. Find contracts with value greater than 1000000000
SELECT *
FROM contracts 
WHERE value_usd > 1000000000  ;

-- Q93. Find contracts from India
SELECT *
FROM contracts 
WHERE vendor_country = 'INDIA' ;

-- Q94. Find contracts from USA
SELECT *
FROM contracts 
WHERE vendor_country = 'USA' ;

-- Q95. Find completed training programs
SELECT *
FROM training_programs 
WHERE  status = 'completed' ;

-- Q96. Find scheduled training programs
SELECT *
FROM training_programs 
WHERE  status = 'scheduled' ;

-- Q97. Find training programs longer than 90 days
SELECT *
FROM training_programs 
WHERE  duration_days > 90 ;

-- Q98. Find training programs shorter than 30 days
SELECT *
FROM training_programs 
WHERE  duration_days < 90 ;


-- Q99. Find ranks with level 10 (highest)
SELECT *
FROM ranks 
WHERE rank_level = 10 ;

-- Q100. Find ranks with level 1 (lowest)
SELECT *
FROM ranks 
WHERE rank_level = 1 ;

-- Q101. Find medal type awards
SELECT *
FROM awards 
WHERE award_type = 'medal' ;

USE defence_db ;

-- Q102. Find commendation type awards
SELECT *
FROM awards
WHERE award_type = 'commendation' ;

-- Q103. Find badge type awards
SELECT *
FROM awardS
WHERE award_type = 'badge' ;

-- Q104. Find certificate type awards
SELECT *
FROM awards
WHERE award_type = 'certificate';

-- Q105. Find bases in Maharashtra state
SELECT *
FROM bases 
WHERE location_state = 'Maharashtra' ;

-- Q106. Find bases in Rajasthan state
SELECT *
FROM bases
WHERE location_state = 'Rajasthan';

-- Q107. Find bases in Delhi
SELECT *
FROM bases
WHERE location_city = 'Delhi' ;

-- Q108. Find bases in Mumbai
SELECT *
FROM bases
WHERE location_city = 'Mumbai';

-- Q109. Find equipment acquired after 2015
SELECT *
FROM equipment 
WHERE year_acquired > '2015';

-- Q110. Find equipment acquired before 2000
SELECT *
FROM equipment 
WHERE year_acquired < '2000';

-- Q111. Find personnel with rank_id greater than 10
SELECT *
FROM personnel 
WHERE rank_id > 10 ;

-- Q112. Find personnel enlisted before 2000
SELECT *
FROM personnel
WHERE enlistment_date < '2000-01-01' ;

-- Q113. Find missions in India (country_id = 1)
SELECT *
FROM missions
WHERE country_id = 1 ;


-- Q114. Find missions with NULL end date (ongoing)
SELECT *
FROM missions 
WHERE end_date IS NULL ;

-- Q115. Find missions with outcome recorded
 SELECT *
 FROM missions
 WHERE outcome IS NOT NULL ;
 
-- Q116. Find training programs with more than 50 max participants
SELECT *
FROM training_programs 
WHERE max_participants >50 ;

-- Q117. Find training programs starting in 2024
SELECT *
FROM training_programs
WHERE YEAR(start_date) = '2024';

-- Q118. Find training programs starting in 2025

SELECT *
FROM training_programs
WHERE YEAR(start_date) = '2025' ;

-- Q119. Find personnel with email ending in defence.in
SELECT *
FROM personnel 
WHERE email LIKE'%defence.in' ;

-- Q120. Find personnel with email ending in navy.in
SELECT *
FROM personnel
WHERE email LIKE '%navy.in';



 
 
 































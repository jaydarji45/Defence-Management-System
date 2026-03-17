-- =============================================================================================================
--                           DESCRIPTION :A DEMO DEFENCE MANAGEMENT SYSTEM DATBASE
-- =============================================================================================================
--                           THIS IS AI BASE CREATED DEFENCE DATABASE FOR THE PROJECT.
--                           THIS DATABASE CONTAIN 

-- DATABASE CREATION.
CREATE DATABASE IF NOT EXISTS defence_db ;
USE defence_db ;

-- ============================================================
-- TABLE 1: COUNTRIES
-- ============================================================
CREATE TABLE countries (
    country_id      INT AUTO_INCREMENT PRIMARY KEY,
    country_name    VARCHAR(100) NOT NULL,
    region          VARCHAR(100),
    alliance        VARCHAR(100) COMMENT 'e.g., NATO, QUAD, Non-Aligned',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- TABLE 2: MILITARY BRANCHES
-- ============================================================
CREATE TABLE military_branches (
    branch_id       INT AUTO_INCREMENT PRIMARY KEY,
    branch_name     VARCHAR(100) NOT NULL,
    branch_code     VARCHAR(10)  NOT NULL UNIQUE,
    established_year YEAR,
    description     TEXT
);

-- ============================================================
-- TABLE 3: RANKS
-- ============================================================
CREATE TABLE ranks (
    rank_id         INT AUTO_INCREMENT PRIMARY KEY,
    rank_name       VARCHAR(100) NOT NULL,
    rank_code       VARCHAR(20)  NOT NULL,
    branch_id       INT,
    rank_level      INT COMMENT '1=lowest, 10=highest',
    FOREIGN KEY (branch_id) REFERENCES military_branches(branch_id)
);

-- ============================================================
-- TABLE 4: BASES / INSTALLATIONS
-- ============================================================
CREATE TABLE bases (
    base_id         INT AUTO_INCREMENT PRIMARY KEY,
    base_name       VARCHAR(150) NOT NULL,
    base_code       VARCHAR(20)  UNIQUE,
    branch_id       INT,
    country_id      INT,
    location_city   VARCHAR(100),
    location_state  VARCHAR(100),
    established_year YEAR,
    capacity        INT COMMENT 'Personnel capacity',
    is_active       BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (branch_id)   REFERENCES military_branches(branch_id),
    FOREIGN KEY (country_id)  REFERENCES countries(country_id)
);

-- ============================================================
-- TABLE 5: PERSONNEL
-- ============================================================
CREATE TABLE personnel (
    personnel_id    INT AUTO_INCREMENT PRIMARY KEY,
    service_number  VARCHAR(20) NOT NULL UNIQUE,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    gender          ENUM('Male','Female','Other'),
    date_of_birth   DATE,
    nationality     VARCHAR(100),
    branch_id       INT,
    rank_id         INT,
    base_id         INT,
    enlistment_date DATE,
    status          ENUM('Active','Retired','Deceased','Discharged') DEFAULT 'Active',
    specialization  VARCHAR(150),
    email           VARCHAR(150),
    phone           VARCHAR(20),
    FOREIGN KEY (branch_id)   REFERENCES military_branches(branch_id),
    FOREIGN KEY (rank_id)     REFERENCES ranks(rank_id),
    FOREIGN KEY (base_id)     REFERENCES bases(base_id)
);

-- ============================================================
-- TABLE 6: EQUIPMENT CATEGORIES
-- ============================================================
CREATE TABLE equipment_categories (
    category_id     INT AUTO_INCREMENT PRIMARY KEY,
    category_name   VARCHAR(100) NOT NULL,
    description     TEXT
);

-- ============================================================
-- TABLE 7: EQUIPMENT / WEAPONS INVENTORY
-- ============================================================
CREATE TABLE equipment (
    equipment_id    INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name  VARCHAR(150) NOT NULL,
    equipment_code  VARCHAR(30)  UNIQUE,
    category_id     INT,
    branch_id       INT,
    base_id         INT,
    manufacturer    VARCHAR(150),
    country_of_origin VARCHAR(100),
    year_acquired   YEAR,
    quantity        INT DEFAULT 0,
    unit_cost_usd   DECIMAL(15,2),
    status          ENUM('Operational','Under Maintenance','Decommissioned') DEFAULT 'Operational',
    FOREIGN KEY (category_id) REFERENCES equipment_categories(category_id),
    FOREIGN KEY (branch_id)   REFERENCES military_branches(branch_id),
    FOREIGN KEY (base_id)     REFERENCES bases(base_id)
);

-- ============================================================
-- TABLE 8: MISSIONS
-- ============================================================
CREATE TABLE missions (
    mission_id      INT AUTO_INCREMENT PRIMARY KEY,
    mission_name    VARCHAR(200) NOT NULL,
    mission_code    VARCHAR(30)  UNIQUE,
    mission_type    ENUM('Combat','Peacekeeping','Humanitarian','Reconnaissance','Training','Joint Exercise'),
    start_date      DATE,
    end_date        DATE,
    location        VARCHAR(200),
    country_id      INT,
    status          ENUM('Planned','Ongoing','Completed','Aborted') DEFAULT 'Planned',
    commanding_officer_id INT,
    budget_usd      DECIMAL(18,2),
    objective       TEXT,
    outcome         TEXT,
    FOREIGN KEY (country_id)              REFERENCES countries(country_id),
    FOREIGN KEY (commanding_officer_id)   REFERENCES personnel(personnel_id)
);

-- ============================================================
-- TABLE 9: MISSION PERSONNEL ASSIGNMENTS
-- ============================================================
CREATE TABLE mission_assignments (
    assignment_id   INT AUTO_INCREMENT PRIMARY KEY,
    mission_id      INT NOT NULL,
    personnel_id    INT NOT NULL,
    role            VARCHAR(100),
    assigned_date   DATE,
    FOREIGN KEY (mission_id)    REFERENCES missions(mission_id),
    FOREIGN KEY (personnel_id)  REFERENCES personnel(personnel_id),
    UNIQUE KEY uq_mission_personnel (mission_id, personnel_id)
);

-- ============================================================
-- TABLE 10: DEFENCE CONTRACTS / PROCUREMENT
-- ============================================================
CREATE TABLE contracts (
    contract_id     INT AUTO_INCREMENT PRIMARY KEY,
    contract_number VARCHAR(50) NOT NULL UNIQUE,
    vendor_name     VARCHAR(200) NOT NULL,
    vendor_country  VARCHAR(100),
    contract_type   ENUM('Equipment','Services','R&D','Infrastructure','Training'),
    branch_id       INT,
    start_date      DATE,
    end_date        DATE,
    value_usd       DECIMAL(18,2),
    status          ENUM('Active','Completed','Terminated','Under Review') DEFAULT 'Active',
    description     TEXT,
    FOREIGN KEY (branch_id) REFERENCES military_branches(branch_id)
);

-- ============================================================
-- TABLE 11: TRAINING PROGRAMS
-- ============================================================
CREATE TABLE training_programs (
    program_id      INT AUTO_INCREMENT PRIMARY KEY,
    program_name    VARCHAR(200) NOT NULL,
    program_code    VARCHAR(30)  UNIQUE,
    branch_id       INT,
    base_id         INT,
    duration_days   INT,
    start_date      DATE,
    end_date        DATE,
    instructor_id   INT,
    max_participants INT,
    status          ENUM('Scheduled','Ongoing','Completed','Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (branch_id)     REFERENCES military_branches(branch_id),
    FOREIGN KEY (base_id)       REFERENCES bases(base_id),
    FOREIGN KEY (instructor_id) REFERENCES personnel(personnel_id)
);

-- ============================================================
-- TABLE 12: TRAINING ENROLLMENTS
-- ============================================================
CREATE TABLE training_enrollments (
    enrollment_id   INT AUTO_INCREMENT PRIMARY KEY,
    program_id      INT NOT NULL,
    personnel_id    INT NOT NULL,
    enrollment_date DATE,
    completion_date DATE,
    result          ENUM('Pass','Fail','Ongoing','Withdrawn'),
    score           DECIMAL(5,2),
    FOREIGN KEY (program_id)    REFERENCES training_programs(program_id),
    FOREIGN KEY (personnel_id)  REFERENCES personnel(personnel_id),
    UNIQUE KEY uq_program_personnel (program_id, personnel_id)
);

-- ============================================================
-- TABLE 13: AWARDS & MEDALS
-- ============================================================
CREATE TABLE awards (
    award_id        INT AUTO_INCREMENT PRIMARY KEY,
    award_name      VARCHAR(200) NOT NULL,
    award_type      ENUM('Medal','Commendation','Badge','Certificate'),
    description     TEXT
);

-- ============================================================
-- TABLE 14: PERSONNEL AWARDS
-- ============================================================
CREATE TABLE personnel_awards (
    pa_id           INT AUTO_INCREMENT PRIMARY KEY,
    personnel_id    INT NOT NULL,
    award_id        INT NOT NULL,
    awarded_date    DATE,
    awarded_for     TEXT,
    FOREIGN KEY (personnel_id)  REFERENCES personnel(personnel_id),
    FOREIGN KEY (award_id)      REFERENCES awards(award_id)
);

SHOW TABLES ;



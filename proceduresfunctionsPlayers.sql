use nba;

#INPUT A VALID TEAM NAME AND RETURNS ITS FID
DROP FUNCTION IF EXISTS name_fid;
DELIMITER $$

CREATE FUNCTION name_fid
(
name_param VARCHAR(128)
) 
RETURNS INT
BEGIN
	DECLARE fid_var INT;
    SET fid_var = -9999;

	SELECT fid into fid_var
	FROM nba.franchises
	WHERE name_param = f_name;
    
    RETURN(fid_var);

END$$
DELIMITER ;

SELECT name_fid('Boston Celtics');
SELECT name_fid('Golden State Warriors');
SELECT name_fid('wrong');

#---------------------------------------------------

# ADD A PLAYER TO THE PLAYERS TABLE. AT LEAST FRANCHISE NAME, FIRST NAME AND LAST NAME
# MUST BE INPUTED  
DROP PROCEDURE IF EXISTS add_player;
DELIMITER $$

CREATE PROCEDURE add_player
(
IN franchise_name_param 	VARCHAR(128),
IN p_fname_param 			VARCHAR(45),
IN p_lname_param 			VARCHAR(45),
IN p_position_param 		VARCHAR(5),
IN p_jerseynb_param			INT,
IN p_height_param			FLOAT, #in meters
IN p_weight_param			FLOAT, #in kg
IN p_dob_param				DATE,
IN p_from_param 			VARCHAR(45), #college if in the US, country if not
IN p_all_stars_param		INT,
IN p_mvps_param				INT,
IN p_rings_param			INT
) 

BEGIN 

	INSERT INTO nba.players (p_fid, p_fname, p_lname, p_position, p_jerseynb, p_height,
    p_weight, p_dob, p_from, p_all_stars, p_mvps, p_rings)
    VALUES (name_fid(franchise_name_param), p_fname_param, p_lname_param, 
    p_position_param, p_jerseynb_param, p_height_param, p_weight_param, 
    p_dob_param, p_from_param, p_all_stars_param, p_mvps_param, p_rings_param);

END$$
DELIMITER ;

CALL add_player ('Golden State Warriors', 'Stephen', 'Curry', 'G', 30, 1.91, 86, 
'19880314', 'Davidson', 3, 2, 1);
CALL add_player ('Boston Celtics', 'TestFName', 'TestLName', 'G', null, null, null, null, null, 0, 0, 0);



#---------------------------------------------------

# INPUT A VALID PLAYER'S NAME AND RETURNS ITS PID
DROP FUNCTION IF EXISTS name_pid;
DELIMITER $$

CREATE FUNCTION name_pid
(
fname_param VARCHAR(45),
lname_param VARCHAR(45)
) 
RETURNS INT
BEGIN
	DECLARE pid_var INT;
    SET pid_var = -9999;

	SELECT pid into pid_var
	FROM nba.players
	WHERE fname_param = p_fname AND lname_param = p_lname;
    
    RETURN(pid_var);

END$$
DELIMITER ;

SELECT name_pid('TestFName', 'TestLName');
SELECT name_pid('Stephen', 'Curry');
SELECT name_pid('abc', 'abc');

#---------------------------------------------------

# MODIFY POSITION OF A VALID PLAYER
DROP PROCEDURE IF EXISTS modify_position;
DELIMITER $$

CREATE PROCEDURE modify_position
(
IN position_param 	VARCHAR(5),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_position=position_param
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL modify_position('C', 'TestFName', 'TestLName');


#---------------------------------------------------

# MODIFY JERSEY NB OF A VALID PLAYER
DROP PROCEDURE IF EXISTS modify_jerseynb;
DELIMITER $$

CREATE PROCEDURE modify_jerseynb
(
IN jerseynb_param 	VARCHAR(5),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_jerseynb=jerseynb_param
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL modify_jerseynb('100', 'TestFName', 'TestLName');


#---------------------------------------------------

#RETURNS NB OF ALL STARS OF A VALID PLAYER
DROP FUNCTION IF EXISTS get_allstars;
DELIMITER $$

CREATE FUNCTION get_allstars
(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) 
RETURNS INT
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_all_stars into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END$$
DELIMITER ;

SELECT get_allstars('TestFName', 'TestLName');
SELECT get_allstars('Stephen', 'Curry');

#---------------------------------------------------

#RETURNS NB OF MPVS OF A VALID PLAYER
DROP FUNCTION IF EXISTS get_mvps;
DELIMITER $$

CREATE FUNCTION get_mvps
(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) 
RETURNS INT
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_mvps into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END$$
DELIMITER ;

SELECT get_mvps('TestFName', 'TestLName');
SELECT get_mvps('Stephen', 'Curry');

#---------------------------------------------------

#RETURNS NB OF RINGS OF A VALID PLAYER
DROP FUNCTION IF EXISTS get_rings;
DELIMITER $$

CREATE FUNCTION get_rings
(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) 
RETURNS INT
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_rings into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END$$
DELIMITER ;

SELECT get_rings('TestFName', 'TestLName');
SELECT get_rings('Stephen', 'Curry');


#---------------------------------------------------

# ADD 1 ALL STAR TO A VALID PLAYER
DROP PROCEDURE IF EXISTS add_allstar;
DELIMITER $$

CREATE PROCEDURE add_allstar
(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_all_stars=get_allstars(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL add_allstar('TestFName', 'TestLName');

#---------------------------------------------------

# ADD 1 MVP TO A VALID PLAYER
DROP PROCEDURE IF EXISTS add_mvp;
DELIMITER $$

CREATE PROCEDURE add_mvp
(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_mvps=get_mvps(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL add_mvp('TestFName', 'TestLName');
#---------------------------------------------------

# ADD 1 RING TO A VALID PLAYER
DROP PROCEDURE IF EXISTS add_ring;
DELIMITER $$

CREATE PROCEDURE add_ring
(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_rings=get_rings(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL add_ring('TestFName', 'TestLName');


#---------------------------------------------------

# MODIFY TEAM OF A VALID PLAYER
DROP PROCEDURE IF EXISTS modify_team;
DELIMITER $$

CREATE PROCEDURE modify_team
(
IN fname_param 		VARCHAR(128),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
) 

BEGIN 

	UPDATE players
	SET p_fid=name_fid(fname_param)
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END$$
DELIMITER ;

CALL modify_team('Golden State Warriors', 'TestFName', 'TestLName');
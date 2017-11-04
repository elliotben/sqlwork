use nba;

/*
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

*/

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
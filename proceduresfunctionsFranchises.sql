use nba;

# ADD A FRANCHISE (f_name and did are mandatory)
DROP PROCEDURE IF EXISTS add_franchise;
DELIMITER $$

CREATE PROCEDURE add_franchise
(
IN f_name_param			VARCHAR(128),
IN f_arena_param		 	VARCHAR(128),
IN f_city_param	 		VARCHAR(45),
IN f_state_param	 		VARCHAR(2),
IN f_did_param			INT,
IN coach_param			VARCHAR(64)
) 

BEGIN 

	INSERT INTO nba.franchises (f_name, f_arena, f_city, f_state, f_did, cur_coach)
    VALUES (f_name_param, f_arena_param, f_city_param, f_state_param, f_did_param,
    coach_param);

END$$
DELIMITER ;

CALL add_franchise ('Test', null, null, null, 6, null);

#--------------------------------------------

# MODIFY ARENA OF A VALID FRANCHISE
DROP PROCEDURE IF EXISTS modify_arena;
DELIMITER $$

CREATE PROCEDURE modify_arena
(
IN f_arena_param 		VARCHAR(128),
IN f_name_param 		VARCHAR(128)
) 

BEGIN 

	UPDATE franchises
    SET f_arena=f_arena_param
	WHERE name_fid(f_name_param)=fid;

END$$
DELIMITER ;

CALL modify_arena ('test arena', 'Test');

#--------------------------------------------

# MODIFY COACH OF A VALID FRANCHISE
DROP PROCEDURE IF EXISTS modify_coach;
DELIMITER $$

CREATE PROCEDURE modify_coach
(
IN f_coach_param 		VARCHAR(128),
IN f_name_param 		VARCHAR(128)
) 

BEGIN 

	UPDATE franchises
    SET cur_coach=f_coach_param
	WHERE name_fid(f_name_param)=fid;

END$$
DELIMITER ;

CALL modify_coach ('Mr Coach', 'Test');

#--------------------------------------------

# RETURNS THE NB OF CHAMPIONSHIP OF A VALID FRANCHISE
DROP FUNCTION IF EXISTS get_championships;
DELIMITER $$

CREATE FUNCTION get_championships
(
fname_param 	VARCHAR(128)
) 
RETURNS INT
BEGIN
	DECLARE champ_var INT;
    SET champ_var = -9999;

	SELECT championships into champ_var
	FROM nba.franchises
	WHERE name_fid(fname_param)=fid;
    
    RETURN(champ_var);

END$$
DELIMITER ;

SELECT get_championships('Test');
SELECT get_championships('Boston Celtics');

#---------------------------------------------------

# ADD 1 CHAMPIONSHIP TO A VALID FRANCHISE
DROP PROCEDURE IF EXISTS add_champ;
DELIMITER $$

CREATE PROCEDURE add_champ
(
IN fname_param 	VARCHAR(128)
) 

BEGIN 

	UPDATE franchises
	SET championships=get_championships(fname_param) + 1
	WHERE name_fid(fname_param)=fid;

END$$
DELIMITER ;

CALL add_champ('Test');
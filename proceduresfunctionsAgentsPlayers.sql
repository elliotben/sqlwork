use nba;

# ADD AN AGENT TO THE AGENT TABLE
DROP PROCEDURE IF EXISTS add_agent;
DELIMITER $$

CREATE PROCEDURE add_agent
(
IN a_name_param			VARCHAR(128)
) 

BEGIN 

	INSERT INTO nba.agents (a_name)
    VALUES (a_name_param);

END$$
DELIMITER ;

CALL add_agent ('Test Agent');

#---------------------------------------------------

# ADD AN AGENT TO A PLAYER IN THE agentsplayers TABLE
DROP PROCEDURE IF EXISTS add_agentsplayers;
DELIMITER $$

CREATE PROCEDURE add_agentsplayers
(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
) 

BEGIN 

	INSERT INTO nba.agentsplayers (a_name, a_pid)
    VALUES (a_name_param, name_pid(p_fname, p_lname));

END$$
DELIMITER ;

CALL add_agentsplayers ('Test Agent', 'TestFName', 'TestLName');

#---------------------------------------------------

# MODIFY AGENT OF A VALID PLAYER WITH ANOTHER VALID AGENT
DROP PROCEDURE IF EXISTS modify_agentofplayer;
DELIMITER $$

CREATE PROCEDURE modify_agentofplayer
(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
) 

BEGIN 

	UPDATE agentsplayers
    SET a_name=a_name_param
	WHERE name_pid(p_fname, p_lname)=a_pid;

END$$
DELIMITER ;

CALL modify_agentofplayer ('Sam Goldefer', 'TestFName', 'TestLName');
CALL modify_agentofplayer ('Test Agent', 'TestFName', 'TestLName');

#---------------------------------------------------

# MODIFY AGENT OF A VALID PLAYER WITH ANOTHER VALID AGENT
DROP PROCEDURE IF EXISTS drop_playerofagent;
DELIMITER $$

CREATE PROCEDURE drop_playerofagent
(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
) 

BEGIN 

	DELETE FROM agentsplayers
	WHERE name_pid(p_fname, p_lname)=a_pid;

END$$
DELIMITER ;

CALL drop_playerofagent ('Test Agent', 'TestFName', 'TestLName');
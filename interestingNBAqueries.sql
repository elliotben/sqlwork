SELECT ROUND(AVG(p_height), 2), ROUND(AVG(p_weight), 2), p_position FROM nba.players
GROUP BY p_position;

SELECT p_fname, p_lname, f.f_name, p_height 
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_height DESC
LIMIT 1;

SELECT p_fname, p_lname, f.f_name, p_height  
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_height ASC
LIMIT 1;

SELECT p_fname, p_lname, f.f_name, p_weight  
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_weight DESC
LIMIT 1;

SELECT p_fname, p_lname, f.f_name, p_weight  
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_weight ASC
LIMIT 1;

SELECT p_fname, p_lname, f.f_name, p_dob
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_dob ASC
LIMIT 1;

SELECT p_fname, p_lname, f.f_name, p_dob
FROM nba.players p JOIN nba.franchises f ON
p.p_fid = f.fid
ORDER BY p_dob DESC
LIMIT 1;

SELECT p_jerseynb, COUNT(p_jerseynb) FROM nba.players
GROUP BY p_jerseynb
ORDER BY COUNT(p_jerseynb) desc
LIMIT 3;

SELECT p_from, p_all_stars FROM nba.players
ORDER BY p_all_stars DESC
LIMIT 3;

SELECT p_from, COUNT(p_from) FROM nba.players
GROUP BY p_from
ORDER BY COUNT(p_from) DESC
LIMIT 3;

SELECT COUNT(s_starty) FROM nba.seasons
WHERE s_top_seed != s_champ;


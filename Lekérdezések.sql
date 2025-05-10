--1. 
SELECT p.név, COUNT(*) AS gólok  
FROM Gól g JOIN Játékos p ON g.játékos_id = p.játékos_id  
WHERE g.öngól = 0  
GROUP BY p.név  
ORDER BY gólok DESC;

--2.
SELECT j.név AS játékos_nev, m.meccs_dátum, COUNT(g.gól_id) AS gól_aznap,  
SUM(COUNT(g.gól_id)) OVER ( PARTITION BY j.játékos_id ORDER BY m.meccs_dátum ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS göngyölített_gól  
FROM Gól g  
JOIN Játékos j ON g.játékos_id = j.játékos_id  
JOIN Meccs m ON g.meccs_id = m.meccs_id  
WHERE g.öngól = 0  
GROUP BY j.név, j.játékos_id, m.meccs_dátum  
ORDER BY j.név, m.meccs_dátum; 

--3.
SELECT m.meccs_id, c1.név AS hazai, c2.név AS vendég,  
	(m.hazai_gólok + m.vendég_gólok) AS összes_gól, m.meccs_dátum  
FROM Meccs m  
JOIN Csapat c1 ON m.hazai_id = c1.csapat_id  
JOIN Csapat c2 ON m.vendég_id = c2.csapat_id  
ORDER BY összes_gól DESC  
LIMIT 1; 

--4.
SELECT c.név AS csapat, COUNT(*) AS rúgott_gólok  
FROM Gól g  
JOIN Játékos j ON g.játékos_id = j.játékos_id  
JOIN Csapat c ON j.csapat_id = c.csapat_id  
WHERE g.öngól = 0  
GROUP BY c.név  
ORDER BY rúgott_gólok DESC; 

--5.
SELECT m.meccs_id, m.meccs_dátum, ch.név AS hazai_csapat, cv.név AS vendég_csapat,  
m.hazai_gólok, m.vendég_gólok, m.hazai_gólok + m.vendég_gólok AS gól_összesen, 
 AVG(m.hazai_gólok + m.vendég_gólok)  
OVER ( ORDER BY m.meccs_dátum ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING ) AS elozo_3_atlaggól, AVG(m.hazai_gólok + m.vendég_gólok)  
OVER ( ORDER BY m.meccs_dátum ROWS BETWEEN 1 FOLLOWING AND 3 FOLLOWING ) AS kovetkezo_3_atlaggól  
FROM Meccs m  
JOIN Csapat ch ON m.hazai_id = ch.csapat_id  
JOIN Csapat cv ON m.vendég_id = cv.csapat_id  
ORDER BY m.meccs_dátum; 

--6.
SELECT m.meccs_id, m.meccs_dátum,  
	CASE WHEN m.hazai_id = 2  
		THEN 'Hazai' ELSE 'Vendég'  
	END AS szerep,  
	cs_ellenfél.név AS ellenfél, s.név AS stadion, m.hazai_gólok, m.vendég_gólok,  
	(CASE WHEN m.hazai_id = 2  
		THEN m.hazai_gólok - m.vendég_gólok ELSE m.vendég_gólok - m.hazai_gólok  
	END) AS gólkülönbség  
FROM Meccs m  
JOIN Csapat cs_ellenfél ON (m.hazai_id = 2 AND m.vendég_id = cs_ellenfél.csapat_id) OR (m.vendég_id = 2 
AND m.hazai_id = cs_ellenfél.csapat_id)  
JOIN Stadion s ON m.stadion_id = s.stadion_id  
WHERE m.hazai_id = 2 OR m.vendég_id = 2  
ORDER BY m.meccs_dátum; 

--7.
SELECT s.név AS stadion_neve,  
SUM(m.hazai_gólok + m.vendég_gólok) AS összes_gól  
FROM Meccs m JOIN Stadion s ON m.stadion_id = s.stadion_id  
GROUP BY s.név  
ORDER BY összes_gól DESC  
LIMIT 1;

--8.
SELECT cs.csapat_id,  
cs.név AS csapat,  
SUM( 
 CASE  
	WHEN cs.csapat_id = m.hazai_id AND m.hazai_gólok > m.vendég_gólok THEN 3  
	WHEN cs.csapat_id = m.vendég_id AND m.vendég_gólok > m.hazai_gólok THEN 3  
	WHEN (cs.csapat_id = m.hazai_id OR cs.csapat_id = m.vendég_id)  
		AND m.hazai_gólok = m.vendég_gólok THEN 1  

ELSE 0  
END 
 ) AS pontszám  
FROM Csapat cs  
JOIN Meccs m ON cs.csapat_id = m.hazai_id OR cs.csapat_id = m.vendég_id  
GROUP BY cs.csapat_id, cs.név  
ORDER BY pontszám DESC; 
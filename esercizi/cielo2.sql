Quante sono le compagnie che operano (sia in arrivo che in partenza) nei diversi
aeroporti?

SELECT a1.comp, ap.nome, 
FROM arrpart as a1, arrpart as a2, aeroporto as ap
WHERE a1.arrivo = a2.partenza
AND a1.codice<> a2.codice



#6 Quali sono le nazioni che hanno il maggior numero di città dalle 
quali partono voli diretti in altre nazioni?

WITH q as (SELECT count(la.citta) as num_citta, la.citta, la.aeroporto
FROM luogoaeroporto as la
GROUP BY la.citta, la.aeroporto)



SELECT DISTINCT la.nazione, q.num_citta
FROM arrpart as ap, luogoaeroporto as la, luogoaeroporto as l2, q
WHERE ap.partenza = la.aeroporto 
AND ap.arrivo = l2.aeroporto
AND l2.nazione<>la.nazione AND la.citta<>l2.citta AND ap.partenza=q.aeroporto




#1
SELECT persona.posizione, count(persona.posizione)
FROM persona
group by persona.posizione

#2
SELECT count (stipendio)
FROM persona
WHERE stipendio>=40000

#3
SELECT count (progetto)
FROM progetto
WHERE fine< current_date AND budget>50000

#4
SELECT avg(attivitaprogetto.oredurata), min(attivitaprogetto.oredurata), max(attivitaprogetto.oredurata)
FROM progetto, attivitaprogetto
WHERE progetto.nome = 'Pegasus' 
AND progetto.id=attivitaprogetto.progetto

#5
SELECT persona.id, persona.nome, persona.cognome, avg(attivitaprogetto.oredurata), min(attivitaprogetto.oredurata), max(attivitaprogetto.oredurata)
FROM attivitaprogetto, persona, progetto
WHERE progetto.nome = 'Pegasus' 
AND progetto.id=attivitaprogetto.progetto
AND persona.id=attivitaprogetto.persona
GROUP BY persona.id

#6
SELECT persona.id, persona.nome, persona.cognome, attivitanonprogettuale.oredurata
FROM attivitanonprogettuale, persona, progetto
WHERE attivitanonprogettuale.tipo= 'Didattica'
AND persona.id=attivitanonprogettuale.persona
GROUP BY persona.id, attivitanonprogettuale.oredurata

#7
SELECT avg(stipendio), min(stipendio), max(stipendio)
FROM persona 
WHERE posizione= 'Ricercatore'

#8
SELECT posizione, avg(stipendio), min(stipendio), max(stipendio)
FROM persona 
GROUP By posizione, posizione= 'Ricercatore', posizione='Professore Associato', posizione='Professore Ordinario'

#9
SELECT progetto.id, progetto.nome, attivitaprogetto.oredurata
FROM attivitaprogetto, progetto, persona
WHERE persona.nome= 'Ginevra' 
AND persona.cognome= 'Riva'
AND attivitaprogetto.persona= persona.id
AND attivitaprogetto.progetto=progetto.id

#10
SELECT progetto.id, progetto.nome
FROM progetto, attivitaprogetto, persona
WHERE attivitaprogetto.progetto= progetto.id and attivitaprogetto.persona=persona.id
GROUP BY progetto.id 
HAVING count(persona.id) > 2

#11
SELECT p.id, p.nome, p.cognome
FROM persona as p, attivitaprogetto as proj
WHERE p.posizione= 'Professore Associato' 
AND proj.persona= p.id
GROUP BY p.id
HAVING count (p.id)>1
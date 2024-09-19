#1
SELECT wp.id, wp.nome, wp.inizio, wp.fine
FROM wp, progetto
WHERE progetto.nome = 'Pegasus' and (progetto.id = wp.progetto)

#2
SELECT DISTINCT Persona.id, Persona.nome, Persona.cognome, Persona.posizione
FROM Persona, AttivitaProgetto, progetto
WHERE progetto.nome='Pegasus' and (progetto.id= attivitaprogetto.progetto) and (persona.id= attivitaprogetto.persona)
ORDER BY persona.cognome desc

#3
SELECT DISTINCT persona.id, persona.nome, persona.cognome, persona.posizione
FROM Persona, AttivitaProgetto as a1, attivitaprogetto as a2, progetto
WHERE progetto.nome='Pegasus' and (progetto.id= a1.progetto)and (persona.id= a1.persona) and (a1.persona=a2.persona and a1.id<>a2.id)
ORDER BY persona.cognome desc

#4
SELECT DISTINCT persona.id, persona.nome, persona.cognome, persona.posizione
FROM persona, Assenza
WHERE persona.posizione = 'Professore Ordinario' and persona.id=Assenza.persona and Assenza.tipo = 'Malattia'

#5
SELECT DISTINCT persona.id, persona.nome, persona.cognome, persona.posizione
FROM persona, Assenza as a1, assenza as a2
WHERE persona.posizione = 'Professore Ordinario' and persona.id=a1.persona and a1.tipo = 'Malattia' and (a1.persona=a2.persona and a1.id<>a2.id)

#6
SELECT DISTINCT persona.id, persona.nome, persona.cognome
FROM persona, AttivitaNonProgettuale
WHERE AttivitaNonProgettuale.tipo= 'Didattica' and persona.posizione= 'Ricercatore' and persona.id=AttivitaNonProgettuale.persona

#7
SELECT DISTINCT persona.id, persona.nome, persona.cognome
FROM persona, AttivitaNonProgettuale as a1 , AttivitaNonProgettuale as a2
WHERE AttivitaNonProgettuale.tipo= 'Didattica' and persona.posizione= 'Ricercatore' and persona.id=AttivitaNonProgettuale.persona and (a1.persona=a2.persona and a1.id<>a2.id)

#8
SELECT persona.id, persona.nome, persona.cognome
FROM persona, attivitaprogetto, AttivitaNonProgettuale
WHERE persona.id= attivitaprogetto.persona and persona.id= AttivitaNonProgettuale.persona and attivitaprogetto.giorno=AttivitaNonProgettuale.giorno

#9
SELECT persona.id, persona.nome, persona.cognome, attivitaprogetto.giorno, progetto.nome as prj, attivitaprogetto.oredurata as h_prj, AttivitaNonProgettuale.tipo as att_noprj, AttivitaNonProgettuale.oredurata as h_noprj
FROM persona, attivitaprogetto, AttivitaNonProgettuale, progetto
WHERE persona.id= attivitaprogetto.persona and persona.id= AttivitaNonProgettuale.persona and attivitaprogetto.giorno=AttivitaNonProgettuale.giorno and progetto.id=attivitaprogetto.progetto

#10
SELECT persona.id, persona.nome, persona.cognome
FROM persona, assenza, attivitaprogetto
WHERE assenza.giorno= attivitaprogetto.giorno and assenza.persona= persona.id and attivitaprogetto.persona=persona.id

#11
SELECT persona.id, persona.nome, persona.cognome, attivitaprogetto.giorno, progetto.nome as prj, attivitaprogetto.oredurata as h_prj
FROM persona, attivitaprogetto, assenza, progetto
WHERE assenza.giorno= attivitaprogetto.giorno and assenza.persona= persona.id and attivitaprogetto.persona=persona.id and progetto.id=attivitaprogetto.progetto

#12
SELECT DISTINCT wp.nome
FROM wp, wp as w
WHERE wp.nome = w.nome and wp.progetto<>w.progetto; 
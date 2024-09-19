#1
select Persona.cognome from Persona

#2
select id,nome,cognome 
from Persona
where Persona.posizione = 'Ricercatore'

#3
select id, nome, cognome 
from Persona
where posizione= 'Professore Associato' and cognome like 'V%'

#4
select id, nome, cognome
from Persona
where (posizione = 'Professore Associato' or posizione= 'Professore Ordinario') and cognome like 'V%'

#5
select id, nome, inizio, fine, budget
from Progetto
where fine < '2024-09-09'

#6
select id, nome
from Progetto
order by inizio asc

#7
select id,nome
from wp
order by nome asc

#8
select distinct tipo
from Assenza

#9
select distinct tipo
from AttivitaProgetto

#10
select giorno
from AttivitaNonProgettuale
where tipo = 'Didattica'
order by giorno asc
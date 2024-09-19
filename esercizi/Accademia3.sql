create type Strutturato as enum (
    'Ricercatore',
    'Professore Associato', 
    'Professore Ordinario');

create type LavoroProgetto as enum (
    'Ricerca e Sviluppo', 
    'Dimostrazione', 
    'Management', 
    'Altro')

create type LavoroNonProgettuale as enum (
    'Didattica', 
    'Ricerca', 
    'Missione', 
    'Incontro Dipartimentale', 
    'Incontro Accademico', 
    'Altro')

create type CausaAssenza as enum (
    'Chiusura Universitaria' ,
    'Maternita', 
    'Malattia')


create domain PosInteger as integer 
check (value≥ 0)

create type StringaM as varchar(100)

create domain NumeroOre as integer 
check (value>= 0 and value<= 8)

create domain Denaro as real
check (value>=0)



create table Persona (
    id PosInteger Primary key,
    nome StringaM not null, 
    cognome StringaM not null, 
    posizione Strutturato not null, 
    stipendio Denaro not null)

create table Progetto (
    id PosInteger primary key,
    nome StringaM not null,
    inizio date not null,
    fine date not null,
    budget Denaro not null
    inizio < fine,
    unique(nome)
)

create table WP (
    Progetto PosInteger primary key,
    id PosInteger primary key,
    nome StringaM not null,
    inizio date not null,
    fine date not null,
    foreign key Progetto references Progetto(id),
    inizio < fine,
    unique (Progetto, nome)
)

create table AttivitaProgetto (
    id PosInteger primary key,
    persona PosInteger not null,
    progetto PosInteger not null,
    wp PosInteger not null,
    giorno date not null,
    tipo LavoroProgetto not null,
    oreDurata NumeroOre not null,
    foreign key persona references Persona(id),
    foreign key (progetto,wp) references WP(progetto, id)
)

create table AttivitaNonProgettuale (
    id PosInteger primary key,
    persona PosInteger not null,
    tipo LavoroNonProgettuale not null,
    giorno date not null,
    oreDurata NumeroOre not null
)

docker exec -it postgres_container /bin/bash per entrare nel container

una volta nel container psql -U postgres(nome utente)

creare database con create database nomedatabase
per connetterci al database \c + nomedatabase in questo caso accademia

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
from Assenza.tipo

#9

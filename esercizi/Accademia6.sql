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
SELECT
FROM
WHERE


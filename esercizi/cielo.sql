#1
SELECT codice, comp
FROM volo
WHERE durataminuti > 180

#2
SELECT DISTINCT comp
FROM volo
where durataminuti > 180

#3
SELECT volo.codice, volo.comp
FROM volo, ArrPart
WHERE volo.codice =  ArrPart.codice and volo.comp = ArrPart.comp and ArrPart.partenza= 'CIA'

#4
SELECT volo.comp
FROM volo, ArrPart
WHERE volo.codice =  ArrPart.codice and volo.comp = ArrPart.comp and ArrPart.arrivo= 'FCO'

#5
SELECT volo.codice, volo.comp
FROM volo, ArrPart
WHERE volo.codice =  ArrPart.codice and volo.comp = ArrPart.comp and ArrPart.partenza= 'FCO' and ArrPart.arrivo='JFK'

#6
SELECT volo.comp
FROM volo, ArrPart
WHERE volo.codice =  ArrPart.codice and volo.comp = ArrPart.comp and ArrPart.partenza= 'FCO' and ArrPart.arrivo = 'JFK'

#7
SELECT ArrPart.comp
FROM ArrPart, luogoaeroporto
WHERE luogoaeroporto.citta = 'Roma' and luogoaeroporto.aeroporto= ArrPart.partenza and ArrPart.arrivo='JFK'

#8
SELECT DISTINCT ArrPart.partenza, aeroporto.nome, luogoaeroporto.citta
FROM ArrPart, luogoaeroporto, aeroporto
WHERE ArrPart.comp= 'MagicFly' and aeroporto.codice= ArrPart.partenza and luogoaeroporto,aeroporto=ArrPart.partenza

#9
SELECT ArrPart.codice, ArrPart.comp, ArrPart.partenza, ArrPart.arrivo
FROM ArrPart, luogoaeroporto
WHERE luogoaeroporto.citta='Roma' and luogoaeroporto.aeroporto=ArrPart.partenza and ArrPart.arrivo='JFK'

#10?
SELECT ArrPart.codice, ArrPart.comp, ArrPart.partenza, ArrPart.arrivo
FROM ArrPart, luogoaeroporto
WHERE luogoaeroporto.citta='Roma' and luogoaeroporto.aeroporto=ArrPart.partenza and ArrPart.arrivo='JFK'
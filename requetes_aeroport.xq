(: ----- 1) Dates de tous les vols ----- :)
/aeroport/vols/vol/date,

(: ----- 2) Référence de piste du premier vol ----- :)
/aeroport/vols/vol[1]/pisteRef,

(: ----- 3) Piste correspondant à la pisteRef du premier vol ----- :)
/aeroport/pistes/piste[@id = /aeroport/vols/vol[1]/pisteRef/text()],

(: ----- 4) Numéro de vol et pilotes associés ----- :)
for $v in /aeroport/vols/vol
return
  $v/numero || ': ' || 
  string-join(
    /aeroport/employes/employe[
      @id = tokenize($v/employesRefs, '\s+') and role = 'Pilote'
    ]/concat(prenom, ' ', nom),
    ', '
  ),

(: ----- 5) Références d’employés pour chaque vol ----- :)
/aeroport/vols/vol/employesRefs,

(: ----- 6) Prénom de l’employé dont l’id est "e1" ----- :)
/aeroport/employes/employe[@id = 'e1']/prenom,

(: ----- 7) Vols opérés par la compagnie "Air France" ----- :)
/aeroport/vols/vol[compagnieRef = /aeroport/compagnies/compagnie[nom='Air France']/@id],

(: ----- 8) Vols opérés par la compagnie avec code IATA "AF" ----- :)
/aeroport/vols/vol[compagnieRef = /aeroport/compagnies/compagnie[codeIATA='AF']/@id],

(: ----- 9) Immatriculations des avions avec capacité > 300 ----- :)
/aeroport/avions/avion[capacite > 300]/immatriculation

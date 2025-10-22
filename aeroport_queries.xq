(
  (: ----- 1) Vols Air France après le 1er janvier 2023 ----- :)
  let $root := doc("aeroport.xml")/aeroport
  let $afId := $root/compagnies/compagnie[nom = "Air France"]/@id/string()
  return
    <volsAirFranceApres2023>
    {
      for $v in $root/vols/vol
      where $v/compagnieRef = $afId
        and xs:date($v/date) > xs:date("2023-01-01")
      return $v
    }
    </volsAirFranceApres2023>,

  (: ----- 2) Employés affectés à plus d'un vol ----- :)
  let $root := doc("aeroport.xml")/aeroport
  let $emps := $root/employes/employe
  return
    <employesPlusieursVols>
    {
      for $e in $emps
      let $id := $e/@id/string()
      let $occ := count(
        for $v in $root/vols/vol
        where contains(concat(' ', normalize-space($v/employesRefs), ' '), concat(' ', $id, ' '))
        return $v
      )
      where $occ > 1
      return
        <employe id="{ $id }">
          { $e/nom, $e/prenom, <nbVols>{ $occ }</nbVols> }
        </employe>
    }
    </employesPlusieursVols>
)

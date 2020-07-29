declare option output:method 'html';
declare option db:chop 'no';
declare variable $mytitle as xs:string external;
declare variable $myrank as xs:integer external;
declare variable $mydate as xs:string external;

let $in :=
<ul>{
let $int:=
for $doc in collection('AllPublicXML')
let $t := $doc/clinical_study/condition_browse/mesh_term
let $i := $doc/clinical_study/intervention
let $wnames := $doc/clinical_study/condition_browse/mesh_term
for $n in $i 
let $names := $n/intervention_name
where $doc/clinical_study/condition_browse/mesh_term[contains(lower-case(.),lower-case($mytitle))]
  and $doc/clinical_study/intervention/intervention_type= 'Drug'
  and $doc/clinical_study/study_first_submitted[contains(.,$mydate)]
return <li>{lower-case($names)}</li>

for $mynames in $int
let $d := $mynames
group by $d
order by count($mynames) descending
count $rank
where $rank<=$myrank
return <li>
       <drug> {$d} </drug>
       <times> {count($mynames)} </times>
      </li>
}</ul>

let $style :=
  <xsl:stylesheet version='3.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'  href="table.css">
  <xsl:output method='xml'/>
    <xsl:template match="/">
<html>
  <body>
    <div>
    <table border="1" style="font-family: arial, sans-serif; border-collapse: collapse; width: 100%;">
    <thead>
    <tr style="  background-color: #dddddd">
      <th style="border: 1px solid #dddddd; text-align: left; padding: 8px;"> Drugs </th>
      <th style="border: 1px solid #dddddd; text-align: left; padding: 8px;"> Times Used </th>
    </tr>
    </thead>
    <tbody>
      <xsl:for-each select='ul'>
       <xsl:for-each select='li'>
       <tr>
        <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;"><xsl:value-of select='drug'/></td>
        <td style="border: 1px solid #dddddd; text-align: left; padding: 8px;"><xsl:value-of select='times'/></td>
       </tr>
       </xsl:for-each>
      </xsl:for-each>
        </tbody>
     </table>
    </div>
  </body>
</html>
    </xsl:template>
  </xsl:stylesheet>
  
return xslt:transform($in,$style)
  


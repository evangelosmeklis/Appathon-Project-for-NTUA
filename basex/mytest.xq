declare option output:method 'html';
declare option db:chop 'no';

let $in :=
<ul>{
for $doc in collection('AllPublicXML')
let $t := $doc/clinical_study/brief_title
where $doc/clinical_study/brief_title[contains(.,'Heart')]
  and $doc/clinical_study/intervention/intervention_type= 'Drug'
return <li>{$t}</li>
}
</ul>

let $style :=
  <xsl:stylesheet version='3.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
  <xsl:output method='xml'/>
    <xsl:template match="/">
<html>
  <body>
    <div>
    <table border="1">
    <tr><th> Titles </th></tr>
      <xsl:for-each select='ul'>
       <xsl:for-each select='li'>
       <tr><td><xsl:value-of select='brief_title'/></td></tr>
       </xsl:for-each>
      </xsl:for-each>
     </table>
    </div>
  </body>
</html>
    </xsl:template>
  </xsl:stylesheet>
  
return xslt:transform($in,$style)



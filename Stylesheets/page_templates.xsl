<?xml version="1.0"?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:tei="http://www.tei-c.org/ns/1.0" 
xpath-default-namespace="http://www.tei-c.org/ns/1.0"
xmlns="http://www.w3.org/1999/xhtml" 
version="2.0">

<xsl:template name="mainContent">

<!-- TESTING CODE ==================================================================== -->

<!--    <p>For testing, variable list:</p>
<ul>
<li>pagetype: <xsl:value-of select="$pagetype"/></li>
<li>subpagetype: <xsl:value-of select="$subpagetype"/></li>
<li>q: <xsl:value-of select="$q"/></li>
<li>fq: <xsl:value-of select="$fq"/></li>
<li>pageid: <xsl:value-of select="$pageid"/></li>
<li>searchtype: <xsl:value-of select="$searchtype"/></li>
<li>sort: <xsl:value-of select="$sort"/></li>

</ul> 
-->


<!-- Begin xsl:choose for page templates -->
<xsl:choose>
 
 <!-- =====================================================================================
Berlin Conference Topic Search Results
====================================================================================== -->
 
 <xsl:when test="$pageid = 'berlin'"><xsl:apply-templates/>
  
  <!-- Call solrsearchurl template -->
  <xsl:variable name="solrsearchurl">
   <xsl:call-template name="solrURL">
    <xsl:with-param name="rowstart">0</xsl:with-param>
    <xsl:with-param name="rowend">1700</xsl:with-param>
    <xsl:with-param name="searchfields">id,title,type,theme,author,authorSorting,persName,subtype,date,dateNormalized,person,place</xsl:with-param>
    <xsl:with-param name="facet"></xsl:with-param>
    <xsl:with-param name="facetfield"></xsl:with-param>
    <xsl:with-param name="other"></xsl:with-param>
    <xsl:with-param name="q"><xsl:text>*:*</xsl:text></xsl:with-param>
    <xsl:with-param name="fq"><xsl:value-of select="encode-for-uri('theme:&quot;Berlin Conference&quot; AND type:&quot;Document&quot;')"/></xsl:with-param>
    <xsl:with-param name="sort"><xsl:text>date</xsl:text></xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <h3>Browse by Document Type</h3>
  
  &#160;&#160;&#160;&#160;&#160; <select id="document">
   <option value="./berlin.html">Select Document</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Act&amp;sort=date">Act</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Book&amp;sort=date">Book</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Report&amp;sort=date">Government Report</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Journal&amp;sort=date">Journal Article</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Magazine&amp;sort=date">Magazine Article</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Newspaper&amp;sort=date">Newspaper Article</option>
   <option value="./search/?q=theme:&quot;Berlin Conference&quot; AND subtype:Pamphlet&amp;sort=date">Pamphlet</option>
  </select>
  <script type="text/javascript">
   var urlmenu = document.getElementById( 'document' );
   urlmenu.onchange = function() {
   window.open( this.options[ this.selectedIndex ].value,'_self',false );
   };
  </script>
  
  <p/>
  
  <h3>All Documents</h3>
  
  <!-- uncomment to see the solr url for testing -->
  <!--<xsl:value-of select="$solrsearchurl"/>-->
  
  <!-- Set the xpath default namespace because SOLR results don't have a namespace -->
  <xsl:for-each select="document($solrsearchurl)" xpath-default-namespace="">
   
   <!-- Offer alternate sorting, linked to search results. Built native sort later when we know which fields. -->
   <xsl:variable name="numFound" select="//result/@numFound"/>
   
   <!-- Search results list -->
   <ul>
    <xsl:for-each select="/response/result/doc">
     <li><a>
      <xsl:attribute name="href">
       <xsl:value-of select="$siteroot"/>
       <xsl:text>doc/</xsl:text>
       <xsl:value-of select="str[@name='id']"/>
       <xsl:text>.html</xsl:text>
      </xsl:attribute>
      
      <!-- pull title -->
      <xsl:if test="arr[@name='author']"><xsl:value-of select="arr[@name='author']"/>, </xsl:if><xsl:value-of select="str[@name='title']"/> (<xsl:value-of select="str[@name='dateNormalized']"/>) 
     </a></li>
     
    </xsl:for-each>
   </ul>
  </xsl:for-each>
 </xsl:when>
 
 <!-- =====================================================================================
Congo Free State Topic Search Results
===================================================================================== -->
 
 <xsl:when test="$pageid = 'congo'">
  <xsl:apply-templates/>
  
  <!-- Call solrsearchurl template -->
  <xsl:variable name="solrsearchurl">
   <xsl:call-template name="solrURL">
    <xsl:with-param name="rowstart">0</xsl:with-param>
    <xsl:with-param name="rowend">1700</xsl:with-param>
    <xsl:with-param name="searchfields">id,title,type,theme,author,authorSorting,persName,subtype,date,dateNormalized,person,place</xsl:with-param>
    <xsl:with-param name="facet"></xsl:with-param>
    <xsl:with-param name="facetfield"></xsl:with-param>
    <xsl:with-param name="other"></xsl:with-param>
    <xsl:with-param name="q"><xsl:text>*:*</xsl:text></xsl:with-param>
    <xsl:with-param name="fq"><xsl:value-of select="encode-for-uri('theme:&quot;Congo Free State&quot; AND type:&quot;Document&quot;')"/></xsl:with-param>
    <xsl:with-param name="sort"><xsl:text>date</xsl:text></xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <h3>Browse by Document Type</h3>
  
  &#160;&#160;&#160;&#160;&#160; <select id="document">
   <option value="./congo.html">Select Document</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Act&amp;sort=date">Act</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Book&amp;sort=date">Book</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Report&amp;sort=date">Government Report</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Journal&amp;sort=date">Journal Article</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Magazine&amp;sort=date">Magazine Article</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Newspaper&amp;sort=date">Newspaper Article</option>
   <option value="./search/?q=theme:&quot;Congo Free State&quot; AND subtype:Pamphlet&amp;sort=date">Pamphlet</option>
  </select>
  <script type="text/javascript">
   var urlmenu = document.getElementById( 'document' );
   urlmenu.onchange = function() {
   window.open( this.options[ this.selectedIndex ].value,'_self',false );
   };
  </script>
  
  <p/>
  
  <h3>All Documents</h3>
  
  <!-- uncomment to see the solr url for testing -->
  <!--<xsl:value-of select="$solrsearchurl"/>-->
  
  <!-- Set the xpath default namespace because SOLR results don't have a namespace -->
  <xsl:for-each select="document($solrsearchurl)" xpath-default-namespace="">
   
   <!-- Offer alternate sorting, linked to search results. Built native sort later when we know which fields. -->
   <xsl:variable name="numFound" select="//result/@numFound"/>
   
   <!-- Search results list -->
   <ul>
    <xsl:for-each select="/response/result/doc">
     <li><a>
      <xsl:attribute name="href">
       <xsl:value-of select="$siteroot"/>
       <xsl:text>doc/</xsl:text>
       <xsl:value-of select="str[@name='id']"/>
       <xsl:text>.html</xsl:text>
      </xsl:attribute>
      
      <!-- pull title -->
      <xsl:if test="arr[@name='author']"><xsl:value-of select="arr[@name='author']"/>, </xsl:if><xsl:value-of select="str[@name='title']"/> (<xsl:value-of select="str[@name='dateNormalized']"/>) 
     </a></li>
     
    </xsl:for-each>
   </ul>
  </xsl:for-each>
 </xsl:when>
 
 <!-- =====================================================================================
Document Index Page
===================================================================================== -->
 
 <xsl:when test="$subpagetype = 'index'">
  <!-- Call solrsearchurl template -->
  <xsl:variable name="solrsearchurl">
   <xsl:call-template name="solrURL">
    <xsl:with-param name="rowstart">0</xsl:with-param>
    <xsl:with-param name="rowend">1700</xsl:with-param>
    <xsl:with-param name="searchfields">id,title,type,theme,author,authorSorting,persName,subtype,date,dateNormalized,person,place</xsl:with-param>
    <xsl:with-param name="facet">true</xsl:with-param>
    <xsl:with-param name="facetfield">{!ex=dt}subtype</xsl:with-param>
    <xsl:with-param name="other">&amp;facet.limit=10</xsl:with-param>
    <xsl:with-param name="q"><xsl:text>*:*</xsl:text></xsl:with-param>
    <xsl:with-param name="fq"><xsl:value-of select="encode-for-uri('type:&quot;Document&quot;')"/></xsl:with-param>
    <xsl:with-param name="sort"><xsl:text>date</xsl:text></xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <!-- uncomment to see the solr url for testing -->
  <!--<xsl:value-of select="$solrsearchurl"/>-->
  <xsl:apply-templates/>
  
  <!-- Set the xpath default namespace because SOLR results don't have a namespace -->
  <xsl:for-each select="document($solrsearchurl)" xpath-default-namespace="">
   
   <!-- Offer alternate sorting, linked to search results. Built native sort later when we know which fields. -->
   <xsl:variable name="numFound" select="//result/@numFound"/>
   
   <form action="search/" method="get" enctype="application/x-www-form-urlencoded">
    
    <p align="right"><input id="basic-q" type="text" name="q"
     placeholder="Search texts" class="textField"/> <input type="submit" value="Search" class="submit"/></p>
    
   </form>
   
   <h2>All Documents</h2>
   
   <h3><xsl:value-of select="$numFound"/> <xsl:text> item</xsl:text>
    <xsl:if test="$numFound > 1"><xsl:text>s</xsl:text></xsl:if></h3>
   
   <!-- Search results list: what is being pulled up for doc list -->
   <ul>
    <xsl:for-each select="/response/result/doc">
     <li><a>
      <xsl:attribute name="href">
       <xsl:value-of select="$siteroot"/>
       <xsl:text>doc/</xsl:text>
       <xsl:value-of select="str[@name='id']"/>
       <xsl:text>.html</xsl:text>
      </xsl:attribute>
      
      <!-- pull title -->
      <xsl:if test="arr[@name='author']"><xsl:value-of select="arr[@name='author']"/>, </xsl:if><xsl:value-of select="str[@name='title']"/> (<xsl:value-of select="str[@name='dateNormalized']"/>) 
     </a></li>
     
    </xsl:for-each>
   </ul>
  </xsl:for-each>
 </xsl:when>
 
 <!-- =====================================================================================
Search Results Page
===================================================================================== -->
 
 <xsl:when test="$subpagetype = 'searchresults'">
  <xsl:call-template name="topnav"/>
  
  <xsl:variable name="solrsearchurl">
   <xsl:call-template name="solrURL">
    <xsl:with-param name="rowstart">0</xsl:with-param>
    <xsl:with-param name="rowend">1700</xsl:with-param>
    <xsl:with-param name="searchfields">id,title,type,theme,author,authorSorting,persName,subtype,date,dateNormalized,person,place</xsl:with-param>
    <xsl:with-param name="facet">false</xsl:with-param>
    <!--<xsl:with-param name="facetfield">{!ex=dt}subtype</xsl:with-param>-->
    <xsl:with-param name="other"></xsl:with-param>
    <xsl:with-param name="q"><xsl:value-of select="$q"/></xsl:with-param>
    <xsl:with-param name="fq"><xsl:value-of select="$fq"/></xsl:with-param>
    <xsl:with-param name="sort"><xsl:value-of select="$sort"/></xsl:with-param>
   </xsl:call-template>
   
  </xsl:variable>
  
  <!-- uncomment to see the solr url for testing -->
  <!--<xsl:value-of select="$solrsearchurl"/> -->
  
  <!-- Set the xpath default namespace because SOLR results don't have a namespace -->
  <xsl:for-each select="document($solrsearchurl)" xpath-default-namespace="">
   
   <form action="search/" method="get" enctype="application/x-www-form-urlencoded">
    
    <p align="right"><input id="basic-q" type="text" name="q"
     placeholder="Search texts" class="textField"/> <input type="submit" value="Search" class="submit"/></p>
    
   </form>
   
   <h2>Your search for &#8220;<xsl:value-of select="$q"/>&#8221; returned <xsl:value-of select="/response/result/@numFound"/> result<xsl:if test="not(/response/result/@numFound = 1)">s</xsl:if>:
   </h2>
   
   
   <!-- Search results list when search box is used -->
   <ul>
    <xsl:for-each select="/response/result/doc">
     <li><a>
      <xsl:attribute name="href">
       <xsl:value-of select="$siteroot"/>
       <xsl:text>doc/</xsl:text>
       <xsl:value-of select="str[@name='id']"/>
       <xsl:text>.html</xsl:text>
      </xsl:attribute>
      
      <!-- pull title -->
      <xsl:if test="arr[@name='author']"><xsl:value-of select="arr[@name='author']"/>, </xsl:if><xsl:value-of select="str[@name='title']"/> (<xsl:value-of select="str[@name='dateNormalized']"/>) 
     </a></li>
     
    </xsl:for-each>
   </ul>
  </xsl:for-each>
 </xsl:when>
 
 <!-- =====================================================================================
Individual Document Pages
===================================================================================== -->
 
 <xsl:when test="$subpagetype = 'documents'">

   <xsl:choose>
    <xsl:when test="//keywords[@n='type']/term = 'Analysis'">
     <xsl:text> </xsl:text>
    </xsl:when>
    <xsl:otherwise>

  <div class="callout bibliography" id="topBibl">
   
   <xsl:if test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/author)">
    
    <p><strong>Author<xsl:if
     test="count(/TEI/teiHeader/fileDesc/sourceDesc/bibl/author) &gt;= 2">
     <xsl:text>s</xsl:text>
    </xsl:if>: </strong>
     <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/author" separator=", "></xsl:value-of>
    </p>
   </xsl:if>
   
   <p><strong>Title: </strong>
    <xsl:choose>
     <xsl:when test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='m'][1])">
      <i><xsl:value-of
       select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='m']"/></i>
     </xsl:when>
     <xsl:when test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='a'][1])">
      "<xsl:value-of
       select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='a']"/>"
     </xsl:when>
    </xsl:choose>
   </p>
   
   <xsl:if test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j'])">
    <p><strong>Journal: </strong>
     <i><xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j']"/></i>
    </p>
   </xsl:if>
   
   <xsl:if test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/publisher[1])">
    <p><strong>Publisher: </strong><xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/publisher" separator=", "></xsl:value-of>
    </p>
   </xsl:if>
   
   <xsl:if test="string(/TEI/teiHeader/fileDesc/sourceDesc/bibl/pubPlace)">
    <p><strong>Place of Publication: </strong><xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/pubPlace"/>
    </p>
   </xsl:if>
   
   <!-- Date -->
   <!-- This is a for each to account for multiple bibls -->
   <xsl:for-each select="/TEI/teiHeader/fileDesc/sourceDesc/bibl">
    <xsl:if test="date and date != ''">
     <xsl:for-each select="date">
      <p>
       <strong>Date: </strong>
       <xsl:value-of select="." separator=" | "/>
      </p>
     </xsl:for-each>
    </xsl:if>
    
   </xsl:for-each>
   
   
   <xsl:if test="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='people']/term[1])">
    <p><strong>People: </strong>
     
     <xsl:for-each select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='people']/term"><xsl:if test="not(position() = 1)">; </xsl:if>
      
      <xsl:if test="string(.)">
       <xsl:if test=". != ''">
        <xsl:variable name="people"><xsl:value-of select="." /></xsl:variable>
        <span class="subjectLink">
         <a href="{$siteroot}search/result.html?q=person:&quot;{$people}&quot;">
          <xsl:value-of select="."/>
         </a>
        </span>
       </xsl:if>
      </xsl:if>
     </xsl:for-each>
     
    </p>
   </xsl:if>
   
   
   <xsl:if test="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='places']/term[1])">
    <p><strong>
     <xsl:text>Place</xsl:text>
     <xsl:if
      test="count(/TEI/teiHeader/profileDesc/textClass/keywords[@n='places']/term) &gt;= 2">
      <xsl:text>s</xsl:text>
     </xsl:if>
     <xsl:text>: </xsl:text></strong>
     
     <xsl:for-each select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='places']/term"><xsl:if test="not(position() = 1)">; </xsl:if>
      
      <xsl:if test="string(.)">
       <xsl:if test=". != ''">
        <xsl:variable name="place"><xsl:value-of select="." /></xsl:variable>
        <span class="subjectLink">
         <a href="{$siteroot}search/result.html?q=places:&quot;{$place}&quot;">
          <xsl:value-of select="."/>
         </a>
        </span>
       </xsl:if>
      </xsl:if>
     </xsl:for-each>
     
    </p>
   </xsl:if>
   
   
   <xsl:if test="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='ethnic_group']/term[1])">
    <p>
     <xsl:text>Ethnic Group</xsl:text>
     <xsl:if
      test="count(/TEI/teiHeader/profileDesc/textClass/keywords[@n='ethnic_group']/term) &gt;= 2">
      <xsl:text>s</xsl:text>
     </xsl:if>
     <xsl:text>:</xsl:text>
     
     <xsl:for-each select="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='ethnic_group']/term[1])">
      <xsl:if test="string(.)">
       <span class="subjectLink">
        <a>
         <xsl:attribute name="href">
          <xsl:value-of select="$siteroot"/>
          <xsl:text>search/result.html?q=ethnic_group:"</xsl:text>
          <xsl:value-of select="."/>
          <xsl:text>"</xsl:text>
         </xsl:attribute>
         <xsl:value-of select="."/>
        </a>
       </span>
      </xsl:if>
     </xsl:for-each>
     
    </p>
   </xsl:if>
   
   <xsl:if test="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='language']/term[1])">
    <p>
     <xsl:text>Language</xsl:text>
     <xsl:if
      test="count(/TEI/teiHeader/profileDesc/textClass/keywords[@n='language']/term) &gt;= 2">
      <xsl:text>s</xsl:text>
     </xsl:if>
     <xsl:text>:</xsl:text>
     
     <xsl:for-each select="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='language']/term[1])">
      <xsl:if test="string(.)">
       <span class="subjectLink">
        <a>
         <xsl:attribute name="href">
          <xsl:value-of select="$siteroot"/>
          <xsl:text>search/result.html?q=language:"</xsl:text>
          <xsl:value-of select="."/>
          <xsl:text>"</xsl:text>
         </xsl:attribute>
         <xsl:value-of select="."/>
        </a>
       </span>
      </xsl:if>
     </xsl:for-each>
     
    </p>
   </xsl:if>
   
   <xsl:if test="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='religion']/term[1])">
    <p>
     <xsl:text>Language</xsl:text>
     <xsl:if
      test="count(/TEI/teiHeader/profileDesc/textClass/keywords[@n='religion']/term) &gt;= 2">
      <xsl:text>s</xsl:text>
     </xsl:if>
     <xsl:text>:</xsl:text>
     
     <xsl:for-each select="string(/TEI/teiHeader/profileDesc/textClass/keywords[@n='religion']/term[1])">
      <xsl:if test="string(.)">
       <span class="subjectLink">
        <a>
         <xsl:attribute name="href">
          <xsl:value-of select="$siteroot"/>
          <xsl:text>search/result.html?q=religion:"</xsl:text>
          <xsl:value-of select="."/>
          <xsl:text>"</xsl:text>
         </xsl:attribute>
         <xsl:value-of select="."/>
        </a>
       </span>
      </xsl:if>
     </xsl:for-each>
    </p>
   </xsl:if>
   
  </div> 

</xsl:otherwise>
   </xsl:choose>
  


  <!-- Links to Analysis and back to document -KMD-->
  
  <!-- set the path to the xml documents -->
  <xsl:variable name="linked_doc_path"><xsl:text>../../xml/documents/</xsl:text></xsl:variable>
  
  <!-- set the linked document id - location differs slightly depending on whether file is a document or analysis type -->
  <xsl:variable name="linked_doc_id">
   <xsl:choose>
    <xsl:when test="//keywords[@n='type']/term = 'Document'">
     <xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/classCode/ref[@type='analysis']/@target"/>
    </xsl:when>
    <xsl:when test="//keywords[@n='type']/term = 'Analysis'">
     <xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/classCode/ref[@type='document']/@target"/>
    </xsl:when>
    <xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  
  <!-- set the document path-->
  <xsl:variable name="linked_doc_path">
   <xsl:value-of select="$linked_doc_path"/>
   <xsl:value-of select="$linked_doc_id"/>
   <xsl:text>.xml</xsl:text>
  </xsl:variable>
  
  <!-- set the document link -->
  <xsl:variable name="linked_doc_link">
   <xsl:value-of select="$linked_doc_id"/>
   <xsl:text>.html</xsl:text>
  </xsl:variable>
  
  <div class="callout-analysis">
    <xsl:choose>
     <!-- When file is a document, show first paragraph of analysis with a link to read more -->
     <xsl:when test="//keywords[@n='type']/term = 'Document'">
      <h1>Analysis</h1>
      <xsl:for-each select="document($linked_doc_path)">
       <xsl:choose>
        <xsl:when test="/TEI/text/body/div1/div2/p[1] != ''">
         <xsl:apply-templates select="/TEI/text/body/div1/div2/p[1]"/>
        </xsl:when>
        <xsl:otherwise><p>There is no analysis for this document yet.</p></xsl:otherwise>
       </xsl:choose>
       
      </xsl:for-each>
      <h5><a href="{$linked_doc_link}">Read More</a></h5>
     </xsl:when>
     <!-- When file is analysis, provide a link back to the document -->
     <xsl:when test="//keywords[@n='type']/term = 'Analysis'">
      <h5><a href="{$linked_doc_link}">Back to Document</a></h5>
     </xsl:when>
    </xsl:choose>
   
  </div><!-- /callout -->
  <!-- /Link to analysis and back to document -->
  
  
  
  <xsl:apply-templates/>
 
 </xsl:when>
 
 
 <xsl:otherwise>
  <xsl:apply-templates/>
 </xsl:otherwise>
 
</xsl:choose><!-- End xsl:choose for page templates -->
 
 
 <!-- Older code, delete after Kaci has determined everything is working correctly -KMD -->
<!-- <xsl:if test="$pageid = 'berlin'"></xsl:if>-->
<!--<xsl:if test=""></xsl:if>-->
<!-- =====================================================================================
Home Page
===================================================================================== -->
<!-- leave for "xsl:otherwise" -->
<!--<xsl:if test="$subpagetype = 'none'"><xsl:apply-templates/></xsl:if> -->
<!--<xsl:if test="$subpagetype = 'index'"></xsl:if> -->
<!-- =====================================================================================
Berlin Conference Theme Page
===================================================================================== -->
 <!-- leave for "xsl:otherwise" -->
<!--<xsl:if test="$subpagetype = 'page' and $pageid != 'berlin'"><xsl:apply-templates/></xsl:if>-->

<!-- =====================================================================================
Congo Free State Theme Page
===================================================================================== -->
 <!-- leave for "xsl:otherwise" -->
<!--<xsl:if test="$subpagetype = 'page' and $pageid != 'congo'"><xsl:apply-templates/></xsl:if>-->

<!-- Call solrsearchurl template -->
<!--<xsl:if test="$subpagetype = 'searchresults'"> </xsl:if> <!-\- /searchresults -\->-->
<!--<xsl:if test="$subpagetype = 'documents'"></xsl:if>-->

</xsl:template>


<!-- =====================================================================================
Templates
===================================================================================== -->

<!-- Constructs solr search URL -->
<xsl:template name="solrURL">
<xsl:param name="rowstart">0</xsl:param>
<xsl:param name="rowend">10</xsl:param>
<xsl:param name="searchfields">id,title,subtype,date,dateNormalized,titleOther,type,person,place,defendant,petitioner,attorneyp,attorneyd</xsl:param>
<xsl:param name="facet">false</xsl:param>
<xsl:param name="facetfield"></xsl:param>
<xsl:param name="other"></xsl:param>
<xsl:param name="q">*:*</xsl:param>
<xsl:param name="fq">*:*</xsl:param>
<xsl:param name="sort"></xsl:param>

<xsl:value-of select="$searchroot"/>

<!-- Add sort if not set to default -->
<xsl:choose>
<xsl:when test="$sort = 'relevance'"><!-- do nothing to leave as default sort --></xsl:when>
<xsl:otherwise>
<xsl:text>&amp;sort=</xsl:text>
<xsl:value-of select="$sort"></xsl:value-of>
<xsl:text>+asc,date+asc</xsl:text>
</xsl:otherwise>
</xsl:choose>
<!-- Add searchtype if not set to default or keyword -->
<!--<xsl:choose>
<xsl:when test="$searchtype = 'all'"><!-\- do nothing to leave as default display -\-></xsl:when>
<xsl:when test="$searchtype = 'keyword'"><!-\- do nothing to leave as default display -\-></xsl:when>
<xsl:otherwise>
<xsl:text>&amp;fq={!tag=dt}subtype:</xsl:text>
<xsl:value-of select="$searchtype"></xsl:value-of>
</xsl:otherwise>
</xsl:choose>-->

<!-- Start and rows -->
<xsl:text>&amp;start=</xsl:text>
<xsl:value-of select="$rowstart"></xsl:value-of>
<xsl:text>&amp;rows=</xsl:text>
<xsl:value-of select="$rowend"/>
<!-- Which fields to return -->
<xsl:text>&amp;fl=</xsl:text>
<xsl:value-of select="$searchfields"/>
<!-- faceting options -->
<xsl:text>&amp;facet=</xsl:text>
<xsl:value-of select="$facet"/>
<xsl:text>&amp;facet.field=</xsl:text>
<xsl:value-of select="$facetfield"/>
<!-- anything else, passed through the other variable -->
<xsl:value-of select="$other"/>
<!-- query -->
<xsl:text>&amp;q=%28</xsl:text>
<xsl:value-of select="encode-for-uri($q)"/>
<xsl:text>%29</xsl:text>
<!-- filter query -->
<xsl:if test="$fq != 'unset'">
<xsl:text>&amp;fq=</xsl:text>
<xsl:value-of select="$fq"/>
</xsl:if>

</xsl:template>

</xsl:stylesheet>

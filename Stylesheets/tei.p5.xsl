<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">


  <xsl:output method="text" indent="no" encoding="UTF-8"/>
  <xsl:param name="pagetype">unset</xsl:param>
  <xsl:param name="subpagetype">unset</xsl:param>
  <xsl:param name="q">unset</xsl:param>
  <xsl:param name="fq">unset</xsl:param>
  <xsl:param name="pageid">unset</xsl:param>

  <xsl:param name="searchtype">all</xsl:param>
  <xsl:param name="sort">relevance</xsl:param>

  <xsl:include href="../../config/config.xsl"/>

  <xsl:include href="common.xsl"/>
  <xsl:include href="page_templates.xsl"/>
  <xsl:include href="html_template.xsl"/>

  <!-- ***** Things to hide ***** -->

  <xsl:template match="teiHeader | revisionDesc | publicationStmt | sourceDesc | figDesc">
    <!-- hide -->
    <xsl:text> </xsl:text>
  </xsl:template>

  <!-- ***** Paragraphs and line breaks, add a rule check for nested paragraphs ***** -->

  <xsl:template match="p">
    <xsl:choose>
      <xsl:when test="ancestor::*[name() = 'p']">
        <div class="p">
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:when test="parent::body">
        <br/>
        <p>
          <xsl:apply-templates/>
        </p>
      </xsl:when>

      <xsl:when test="@rend='subtitle'">
        <h4>
          <xsl:apply-templates/>
        </h4>        
      </xsl:when>


      <xsl:otherwise>
        <p>
            <!-- To make anchor tags between Mapping Points and Exceprts work (temporary solution) -->
            <xsl:if test="./anchor">
                <xsl:for-each select="./child::anchor">
                    <span>
                        <xsl:attribute name="id"><xsl:value-of select="./@xml:id" /></xsl:attribute>
                    </span>
                </xsl:for-each>
            </xsl:if>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>


  </xsl:template>

  <xsl:template match="p[@rend='italics']">
    <p>
      <xsl:attribute name="class">
        <xsl:value-of select="name()"/>
      </xsl:attribute>
      <em>
        <xsl:apply-templates/>
      </em>
    </p>
  </xsl:template>

  <xsl:template match="lb">
    <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <!-- ***** Links ***** -->

  <xsl:template match="xref[@n]">
    <a href="{@n}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  
  <!-- ***** Link Image ***** -->
  
 <xsl:template match="ref[@type='extlink']">
    <a target="_blank" href="{@target}">
      <xsl:apply-templates/>
      <img>
        <xsl:attribute name="class">
          <xsl:text>ext</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="src">
        <xsl:value-of select="$externalfileroot"/>
        <xsl:text>files/design/link.png</xsl:text>
      </xsl:attribute>
    </img>
    </a>
</xsl:template>
  

  <!-- ***** Heads ***** -->

  <xsl:template match="head">
    <xsl:choose>
      <xsl:when test=".[@type='main']">
        <h1>
          <xsl:apply-templates/>
        </h1>
      </xsl:when>
      <xsl:when test=".[@type='sub']">
        <h2>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
      <xsl:when test=".[@type='sub-sub']">
        <h3>
          <xsl:apply-templates/>
        </h3>
      </xsl:when>
      <xsl:otherwise>
        <h3>
          <xsl:apply-templates/>
        </h3>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ***** Page Images ***** -->

  <xsl:template match="pb">
    <xsl:if test="@facs">
      <!-- <span class="hr">&#160;</span> -->
      <span>
        <xsl:attribute name="class">
          <xsl:text>pageimage</xsl:text>
        </xsl:attribute>

        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$externalfileroot"/>
            <xsl:text>files/figures/</xsl:text>
            <xsl:text>fullsize/</xsl:text>
            <xsl:value-of select="@facs"/>
          </xsl:attribute>
          <xsl:attribute name="rel">
            <xsl:text>prettyPhoto[pp_gal]</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:text>&lt;a href="</xsl:text>
            <xsl:value-of select="$externalfileroot"/>
            <xsl:text>files/figures/</xsl:text>
            <xsl:text>fullsize/</xsl:text>
            <xsl:value-of select="@facs"/>
            <xsl:text>" target="_blank" &gt;open image in new window&lt;/a&gt;</xsl:text>
          </xsl:attribute>

          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="$externalfileroot"/>
              <xsl:text>files/figures/</xsl:text>
              <xsl:text>thumbnails/</xsl:text>
              <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">
              <xsl:text>display</xsl:text>
            </xsl:attribute>
          </img>
        </a>
      </span>
    </xsl:if>
  </xsl:template>


  <!-- ***** Div types for styling ***** -->

  <xsl:template match="div1 | div2">
    <xsl:choose>
      <xsl:when test="@type='html'">
        <xsl:copy-of select="."/>
      </xsl:when>



<xsl:when test="@type='titles'">
<h2>
<xsl:apply-templates/>
</h2>        
</xsl:when>



      <xsl:otherwise>
        <div>
          <xsl:attribute name="class">
            <xsl:value-of select="@type"/>

            <xsl:attribute name="class">
              <xsl:if test="preceding-sibling::div1">
                <xsl:text> doublespace</xsl:text>
              </xsl:if>
              <xsl:text> </xsl:text>
              <xsl:value-of select="@subtype"/>
            </xsl:attribute>

          </xsl:attribute>       
   

          <!-- To make anchor tags between Mapping Points and Exceprts work (temporary solution) -->
          <xsl:if test="./anchor">
              <xsl:attribute name="id"><xsl:value-of select="./anchor/@xml:id" /></xsl:attribute>
          </xsl:if>

          <xsl:apply-templates/>
  <span class="hr">&#160;</span>
        </div>
      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>


  <!-- ***** Footnotes & References ***** -->
  
  <xsl:template match="note">
    <xsl:choose> <!-- This is to differentiate between <note> re. footnotes and <note> on Encyclopedia page. -->
      <xsl:when test="ancestor::p">               
        <small><sup>
          <xsl:attribute name="class">
            <xsl:text>foot</xsl:text>
          </xsl:attribute>
          <a>
            <xsl:attribute name="href">
              <xsl:text>javascript:unhide('</xsl:text>
              <xsl:value-of select="@xml:id"/>
              <xsl:text>');</xsl:text>
            </xsl:attribute>
            
            <xsl:text>(</xsl:text>
            <xsl:value-of select="substring(@xml:id, 2)"/>
            <xsl:text>)</xsl:text>
          </a>
        </sup></small>       
        <span>
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>hidden</xsl:text>
          </xsl:attribute>                          
          <xsl:apply-templates/>
        </span>               
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="ref">
    <xsl:choose>
      <xsl:when test="starts-with(@target, 'n')">
        <xsl:variable name="n" select="@target"/>
        <a>
          <xsl:attribute name="id">
            <xsl:text>ref</xsl:text>
            <xsl:value-of select="@target"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>inlinenote</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@target"/>
          </xsl:attribute>
          <xsl:text> [<!--note --></xsl:text>
          <xsl:apply-templates/>
          <xsl:text>] </xsl:text>
        </a>
      </xsl:when>
      <xsl:when test="starts-with(@target, 'edi')">
        <a href="{$siteroot}topics/{substring-before(@target, 'xml')}html">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <xsl:when test="ends-with(@target, '.xml')">
        <a href="{$siteroot}{substring-before(@target, 'xml')}html">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <xsl:when test="@type='link'">
        <a href="{@target}">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text> </xsl:text>
        <a href="{@target}" id="{@target}.ref" class="footnote">
          
          <xsl:choose>
            <xsl:when test="descendant::text()">
              <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@n"/>
            </xsl:otherwise>
          </xsl:choose>
          
        </a>
        <xsl:text> </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  



  <!-- ***** Rules for rendering text ***** -->

  <xsl:template
    match="term | foreign | emph | title[not(@level='a')] | biblScope[@type='volume'] | 
    hi[@rend='italic'] | hi[@rend='italics']">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>

  <xsl:template match="item/label">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="hi[@rend='bold']">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="hi[@rend='big']">
    <big>
      <xsl:apply-templates/>
    </big>
  </xsl:template>

  <xsl:template match="hi[@rend='underline']">
    <u>
      <xsl:apply-templates/>
    </u>
  </xsl:template>

  <xsl:template match="hi[@rend='quoted']">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="hi[@rend='small']">
    <small>
      <xsl:apply-templates/>
    </small>
  </xsl:template>

  <xsl:template match="hi[@rend='super']">
    <sup>
      <xsl:apply-templates/>
    </sup>
  </xsl:template>

  <xsl:template match="hi[@rend='subscript']">
    <sub>
      <xsl:apply-templates/>
    </sub>
  </xsl:template>

  <xsl:template match="hi[@rend='smallcaps']">
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="@rend"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="hi[@rend='right'] | hi[@rend='center']">
    <div>
      <xsl:attribute name="class">
        <xsl:value-of select="@rend"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <!-- ***** Lists ***** -->

  <xsl:template match="list[@type='map']">
    <div id="map" class="map">
      <ul>
        <xsl:apply-templates/>
      </ul>
    </div>
    <br style="clear:both"/>
  </xsl:template>
    
  <xsl:template match="list[@type='simple']">
     <ul style="list-style-type:none">
       <xsl:apply-templates/>
     </ul>
  </xsl:template>
  
  <xsl:template match="list[@type='bulleted']">
    <ul style="list-style-type:square">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  
  <xsl:template match="list[@type='ordered']">
    <ul style="list-style-type:decimal">
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <!-- ***** Quotes ***** -->

  <xsl:template match="q">
    <blockquote>
      <p>
        <xsl:apply-templates/>
      </p>
    </blockquote>
  </xsl:template>


  <xsl:template match="quote">
      <p class="quote">
          <!-- To make anchor tags between Mapping Points and Exceprts work (temporary solution) -->
          <xsl:if test="./anchor">
              <xsl:for-each select="./child::anchor">
                  <span>
                      <xsl:attribute name="id"><xsl:value-of select="./@xml:id" /></xsl:attribute>
                  </span>
              </xsl:for-each>
          </xsl:if>
          <xsl:apply-templates/>
      </p>
  </xsl:template>
  

  
 




  <xsl:template match="gap">
    <gap reason="sampling">
     <xsl:attribute name="class">
        <xsl:value-of select="@reason"/>
      </xsl:attribute>
      <xsl:apply-templates/>
      <xsl:text>[. . .]</xsl:text>
    </gap>
  </xsl:template> 

  <xsl:template match="desc">
    <desc>
<!-- nothing here so that desc field doesn't show up -->
    </desc>
  </xsl:template> 



  <xsl:template match="bibl">
    <bibl>
<!-- nothing here so that desc field doesn't show up -->
    </bibl>
  </xsl:template> 

 
  
  
  
<!-- FOR ENCYCLOPEDIA PAGE -->  
  
<!--  <xsl:template match="persName">
    <xsl:choose>
      <xsl:when test="@key">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>person.html#</xsl:text>
            <xsl:value-of select="@key"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>        
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template match="placeName">
    <xsl:choose>
      <xsl:when test="@key">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>person.html#</xsl:text>
            <xsl:value-of select="@key"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>        
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template match="orgName">
    <xsl:choose>
      <xsl:when test="@key">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>person.html#</xsl:text>
            <xsl:value-of select="@key"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>        
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>
  
  <xsl:template match="geogFeat">
    <xsl:choose>
      <xsl:when test="@key">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>person.html#</xsl:text>
            <xsl:value-of select="@key"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>        
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>
-->
</xsl:stylesheet>




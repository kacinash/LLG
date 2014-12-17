<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    
    
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" class="{$pagetype} {$subpagetype}">
            
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                
                <title>Locating Lord Greystoke: Race, Empire, and the African Question</title>
                
                <!-- Fonts and Stylesheets -->
                <link href="http://fonts.googleapis.com/css?family=IM+Fell+English" rel="stylesheet" type="text/css"/>
                <link href="http://fonts.googleapis.com/css?family=Esteban" rel="stylesheet" type="text/css"/>
                <link href="{$externalfileroot}files/css/reset.css" rel="stylesheet" type="text/css"/> 
                <link href="{$externalfileroot}files/css/style.css" rel="stylesheet" type="text/css"/>
                
            </head>
            
            <body>
              
                <div class="pagewrap">
                    
                    <div id="header" class="header">
                          
                        <div id="nav" class="nav">
                            <ul>
                                <li><a href="{$externalfileroot}about.html">About</a></li>
                                <li><a href="{$externalfileroot}documents.html">Documents</a></li>
                                <li><a href="{$externalfileroot}themes.html">Themes</a></li>
                                <li><a href="{$externalfileroot}maps.html">Maps</a></li>
                                <li><a href="{$externalfileroot}">Home</a></li>
							</ul>
                        </div><!-- /nav -->
                        
                    </div> <!-- /header -->
                    
                    <div id="main" class="main">
                        
                        <!-- Invoke rules in page_templates.xsl -->
                        <xsl:call-template name="mainContent"/>
                    
                    </div><!-- /main -->
                    
                    <div id="footer" class="footer">
                        
                        <div  class="footerinfo">
                            <p>&#169; Jeannette Eileen Jones, <a href="http://cdrh.unl.edu" target="new">University of Nebraska-Lincoln</a>, 2013-<script> document.write(new Date().getFullYear()) </script>.<br/> Published under a <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/" target="new">Creative Commons License</a>; maintained by Kaci Nash.</p>
                        </div> <!-- /footerinfo -->
                        
                        <div class="icon">
                            <a href="http://www.unl.edu/" target="new"><img src="{$externalfileroot}files/design/logo_unl.png" class="right" border="0"/></a>
                        </div> <!-- /icon -->
                        
                    </div> <!-- /footer -->
                </div><!-- /pagewrap -->
                
                
                <!-- JQuery -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"> &#160; </script>
                
                <!-- Pretty Photo -->
                <link rel="stylesheet" href="{$externalfileroot}files/js/prettyPhoto_compressed_3.1.3/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
                <script src="{$externalfileroot}files/js/prettyPhoto_compressed_3.1.3/js/jquery.prettyPhoto.js"> &#160; </script>
                
                <script src="{$externalfileroot}files/js/script.js"> &#160; </script>
                
                
            </body>
        </html>
        
        
        
    </xsl:template>

</xsl:stylesheet>

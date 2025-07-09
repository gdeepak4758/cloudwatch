<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/root">
    <xsl:call-template name="clean-text">
      <xsl:with-param name="text" select="."/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="clean-text">
    <xsl:param name="text"/>
    <!-- Remove curly braces and extra whitespace -->
    <xsl:value-of select="normalize-space(translate($text, '{}', ''))"/>
    <xsl:text>&#10;</xsl:text> <!-- newline -->
  </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/root">
    <xsl:call-template name="format-blocks">
      <xsl:with-param name="text" select="normalize-space(.)"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="format-blocks">
    <xsl:param name="text"/>

    <xsl:choose>
      <xsl:when test="contains($text, '},')">
        <xsl:variable name="block" select="substring-before($text, '},')"/>
        <xsl:variable name="rest" select="substring-after($text, '},')"/>

        <xsl:call-template name="format-one">
          <xsl:with-param name="block" select="concat($block, '}')"/>
        </xsl:call-template>
        <xsl:text>,&#10;</xsl:text>

        <xsl:call-template name="format-blocks">
          <xsl:with-param name="text" select="normalize-space($rest)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="format-one">
          <xsl:with-param name="block" select="$text"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="format-one">
    <xsl:param name="block"/>
    <xsl:text>{&#10;</xsl:text>
    <xsl:value-of select="normalize-space(substring-before(substring-after($block, '{'), '}'))"/>
    <xsl:text>&#10;}</xsl:text>
  </xsl:template>

</xsl:stylesheet>
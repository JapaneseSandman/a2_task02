<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">


        <html>
            <head>
                <title>
                    <xsl:value-of select="/Book/Title"/>
                </title>
            </head>
            <body>
                <h3>
                    <xsl:value-of select="/Book/Title"/>
                </h3>
                <p>by
                    <xsl:apply-templates select="/Book/Authors/Author"/>
                </p>
                <h3>Table of Contents</h3>
                <xsl:apply-templates select="/Book/Chapters/Chapter" mode="TOC"/>
                <xsl:apply-templates select="/Book/Chapters/Chapter" mode="fulltext"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Author">
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:if test="position() = last()-1">
            <xsl:text>and </xsl:text>
        </xsl:if>
        <xsl:if test="position() = last()">
            <xsl:text>.</xsl:text>
        </xsl:if>
    </xsl:template>


    <xsl:template match="Chapter" mode="TOC">
<a href="{concat('#Chapter', position())}">
    <p>
        <b><xsl:value-of select="@number"/>.
            <xsl:value-of select="@title"/>
        </b>
    </p>
</a>
        </xsl:template>


<xsl:template match="Chapter" mode="fulltext">
<a name="{concat('Chapter', position())}">
    <h3><xsl:value-of select="@number"/>.
        <xsl:value-of select="@title"/>
    </h3>
</a>
<p>
    <xsl:value-of select="."/>
</p>

</xsl:template>

        </xsl:stylesheet>
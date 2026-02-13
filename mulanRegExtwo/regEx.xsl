<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">

    <xsl:output method="xml" indent="yes"/>


    <!--    
   1 idty-->
    <xsl:template match="sp[matches(normalize-space(string(.)), '^\[[\s\S]*\]$')]">
        <stageDir>
            <xsl:apply-templates/>
        </stageDir>
    </xsl:template>

    <!-- 2) Tag speaker cues at the start of <sp> text -->
    <xsl:template match="sp/text()">
        <xsl:analyze-string select="."
            regex="^\s*([A-Z][A-Za-z]*(?:\s+[A-Z][A-Za-z]*)*)(\s*\[[^\]]+\])?\s*:\s*">

            <xsl:matching-substring>
                <speaker>
                    <xsl:value-of select="regex-group(1)"/>
                </speaker>

                <xsl:if test="normalize-space(regex-group(2))">
                    <stage>
                        <xsl:value-of select="normalize-space(regex-group(2))"/>
                    </stage>
                </xsl:if>

                <!-- space before dialogue -->
                <xsl:text> </xsl:text>
            </xsl:matching-substring>

            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>

        </xsl:analyze-string>
    </xsl:template>


</xsl:stylesheet>

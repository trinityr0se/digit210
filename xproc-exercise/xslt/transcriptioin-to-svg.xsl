<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg" expand-text="yes">

    <xsl:output method="xml" indent="yes"/>

    <xsl:mode on-no-match="shallow-skip"/>

    <xsl:template match="/">
        <xsl:variable name="segments"
            select="//*[(self::transcript or self::line or self::text or self::utterance)]"/>
        <xsl:variable name="barHeight" select="18"/>
        <xsl:variable name="gap" select="8"/>
        <xsl:variable name="maxWidth" select="700"/>
        <xsl:variable name="maxLen" select="max($segments ! string-length(normalize-space(.)))"/>

        <svg:svg width="1000" height="{count($segments) * ($barHeight + $gap) + 100}"
            viewBox="0 0 1000 {count($segments) * ($barHeight + $gap) + 100}">
            <svg:g transform="translate(40,40)">
                <svg:text x="0" y="-10" font-size="20">Transcript Segment Lengths</svg:text>

                <xsl:for-each select="$segments[normalize-space(.) != '']">
                    <xsl:variable name="len" select="string-length(normalize-space(.))"/>
                    <xsl:variable name="y" select="(position() - 1) * ($barHeight + $gap)"/>
                    <xsl:variable name="barWidth" select="
                            if ($maxLen gt 0) then
                                ($len div $maxLen) * $maxWidth
                            else
                                0"/>

                    <svg:text x="0" y="{$y + 13}" font-size="10">Seg {position()}</svg:text>
                    <svg:rect x="60" y="{$y}" width="{$barWidth}" height="{$barHeight}"/>
                    <svg:text x="{$barWidth + 70}" y="{$y + 13}" font-size="10">{$len}</svg:text>
                </xsl:for-each>
            </svg:g>
        </svg:svg>
    </xsl:template>

</xsl:stylesheet>

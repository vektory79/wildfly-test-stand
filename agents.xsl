<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsl module"
                xmlns:module="urn:jboss:module:1.3">
    <xsl:output indent="yes"/>

    <xsl:param name="exportRes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/module:module[not(module:dependencies)]">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <dependencies>
                <system export="true">
                    <paths>
                        <path>
                            <xsl:attribute name="name">
                                <xsl:value-of select="$exportRes"/>
                            </xsl:attribute>
                        </path>
                    </paths>
                </system>
            </dependencies>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="module:dependencies[not(module:system)]">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <system export="true">
                <paths>
                    <path>
                        <xsl:attribute name="name">
                            <xsl:value-of select="$exportRes"/>
                        </xsl:attribute>
                    </path>
                </paths>
            </system>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="module:dependencies/module:system[not(module:paths)]">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <paths>
                <path>
                    <xsl:attribute name="name">
                        <xsl:value-of select="$exportRes"/>
                    </xsl:attribute>
                </path>
            </paths>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="module:dependencies/module:system/module:paths">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <path>
                <xsl:attribute name="name">
                    <xsl:value-of select="$exportRes"/>
                </xsl:attribute>
            </path>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

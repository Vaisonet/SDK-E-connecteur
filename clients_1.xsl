<?xml version="1.0" encoding="UTF-8"?>
<!--
Rajout de code_erp pour avoir la valeur CL01493 et name pour avoir EVENDI
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Template générique pour copier tous les nœuds -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <!-- Template spécifique pour le nœud customer -->
    <xsl:template match="/prestashop/customer">
        <xsl:copy>
            <!-- Copie des nœuds enfants -->
            <xsl:apply-templates select="node()|@*"/>
            
            <!-- Ajout du nœud code_erp avec la valeur CL01493 -->
            <code_erp>
                <xsl:text>CL01493</xsl:text>
            </code_erp>
			<name>
                <xsl:text>EVENDI</xsl:text>
            </name>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
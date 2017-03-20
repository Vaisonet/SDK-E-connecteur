<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : produits.xsl
    Created on : 21 février 2017, 14:02
    Author     : mvarinard
    Description:
        Supprime le noeud catégorie par défaut Prestashop. 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/prestashop/product/id_category_default">
    </xsl:template>
</xsl:stylesheet>


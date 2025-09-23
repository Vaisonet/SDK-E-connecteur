<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Définir les paramètres pour l'URL dynamique -->
    <xsl:param name="apiKey" select="'WXBFXNDCUK5728H5XQACDR7NVE9MF6KC'"/>
    <xsl:param name="baseApiUrl" select="'https://achatnature.com/api/order_payments/'" />

    <!-- Copier tous les noeuds par défaut -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <!-- Ajouter la transaction_id dans <note> -->
    <xsl:template match="note">
        <note>
            <!-- Charger dynamiquement le deuxième XML basé sur la référence -->
            <xsl:variable name="reference" select="/prestashop/order/reference" />
            <xsl:variable name="secondXml" 
                          select="document(concat($baseApiUrl, '&amp;filter[order_reference]=', $reference, '&amp;display=full&amp;ws_key=', $apiKey))" />
            <xsl:value-of select="$secondXml/prestashop/order_payments/order_payment/transaction_id" />
        </note>
    </xsl:template>
</xsl:stylesheet>


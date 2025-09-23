<?php

// DOCUMENTATION
// https://www.gchagnon.fr/cours/xml/recapxsl.html
// https://www.w3.org/TR/2017/REC-xslt-30-20170608/

//Ce script permet de tester une transformation XSLT en php

//Paramètres
// $xsl_file = 'exemples/produits_1.xsl';
// $xml_file = 'exemples/produits_1.xml';

// $xsl_file = 'dev-client/ATL/SDK_f6f62d6c631034bc8846224273fd6d2b87a85d77_customers_get_after.xsl';
// $xml_file = 'dev-client/ATL/customers.xml';

// $xsl_file = 'dev-client/OZ/SDK_ID_addresses_get_after.xsl';
// $xml_file = 'dev-client/OZ/addresses.xml';

//$xsl_file = 'exemples/commandes_1.xsl';
//$xml_file = 'exemples/commandes_1.xml';

// $xsl_file = 'exemples/commandes_6.xsl';
// $xml_file = 'exemples/commandes_6.xml';

// $xsl_file = 'combinations_1.xsl';
// $xml_file = 'combinations_1.xml';

$xsl_file = 'orders_1.xsl';
$xml_file = 'orders_1.xml';

//Test de transformation
error_reporting(-1);
ini_set('display_errors', 'on');
$xmldoc = new DOMDocument();
$xmldoc->load($xml_file);
$XSL = new DOMDocument();
$XSL->load($xsl_file);
$xsl = new XSLTProcessor();
$xsl->importStyleSheet($XSL);
$xml = $xsl->transformToXML($xmldoc);
echo "<pre>";
print_r(simplexml_load_string($xml));
echo "</pre>";
file_put_contents('test.xml', $xml);

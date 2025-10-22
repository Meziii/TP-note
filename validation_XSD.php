<?php
libxml_use_internal_errors(true);
$doc = new DOMDocument();
$doc->load('aeroport.xml');

if ($doc->schemaValidate('aeroport.xsd')) {
    echo "Valid per XSD\n";
} else {
    echo "Invalid per XSD\n";
    foreach (libxml_get_errors() as $err) {
        echo $err->message;
    }
}
?>

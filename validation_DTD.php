<?php
$doc = new DOMDocument();
$doc->load('aeroport.xml');
// active validation DTD
libxml_use_internal_errors(true);
if ($doc->validate()) {
    echo "Valid per DTD\n";
} else {
    echo "Invalid per DTD\n";
    foreach (libxml_get_errors() as $err) {
        echo $err->message;
    }
}
?>

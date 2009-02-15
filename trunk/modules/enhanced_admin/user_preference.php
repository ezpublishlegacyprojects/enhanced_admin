<?php

$module = $Params['Module'];
$function = $Params['Function'];

$key = $Params['key'];
$value = $Params['value'];

$db = eZDB::instance();
$db->begin();
eZPreferences::setValue( $key, $value );
eZPreferences::storeInSession( $key, $value );
$db->commit();

$Result['pagelayout'] = 'design:fezajax_pagelayout.tpl';

$Result['content'] = '';

?>

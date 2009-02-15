<?php

$adminTreeMenuStatus = $Params['adminTreeMenuStatus'];
if( ! is_numeric( $adminTreeMenuStatus ) )
	$adminTreeMenuStatus = 0;

$Result = array();

$Result['path'] = array();

$Result['pagelayout'] = 'design:fezajax_pagelayout.tpl';

require_once( 'kernel/common/template.php' );
$tpl = templateInit();
$tpl->setVariable( 'admin_treemenu', $adminTreeMenuStatus );

$Result['content'] = $tpl->fetch('design:fezajax/admin_treemenu.tpl');
?>

<?php

require_once( 'kernel/common/template.php' );
$tpl = templateInit();

$nodeID = $Params['nodeID'];
$Offset = 0;

if( is_numeric( $Params['offset'] ) )
	$Offset = $Params['offset'];
if( ! is_numeric( $nodeID ) )
	$nodeID = 2;

$ViewParameters = array();
$ViewParameters['offset'] = $Offset;

$tpl->setVariable( 'node', eZContentObjectTreeNode::fetch( $nodeID ) );
$tpl->setVariable( 'view_parameters', $ViewParameters);

$Result = array();

$Result['path'] = array();
$Result['pagelayout'] = 'design:ajax_pagelayout.tpl';

$Result['content'] = $tpl->fetch('design:ajax/admin_children.tpl');

?>

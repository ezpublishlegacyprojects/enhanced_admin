<?php

$nodeID = $Params['nodeID'];

require_once( 'kernel/common/template.php' );
$tpl = templateInit();
$tpl->setVariable( 'node', eZContentObjectTreeNode::fetch( $nodeID ) );

$Result = array();

$Result['path'] = array();
$Result['pagelayout'] = 'design:fezajax_pagelayout.tpl';

$Result['content'] = $tpl->fetch('design:fezajax/window_controls/admin_navigation_locations.tpl');

?>

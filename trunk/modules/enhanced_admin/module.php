<?php

$Module = array( 'name' => 'enhanced_admin',
				 'variable_params' => false,
				 'ui_component_match' => 'enhanced_admin' );

$ViewList = array();

$ViewList['user_preferences'] = array(
								'script' => 'user_preference.php',
								'params' => array( 'key', 'value' ),
								);

$ViewList['admin_treemenu'] = array(
								'script' => 'admin_treemenu.php',
								'params' => array( 'adminTreeMenuStatus' ),
							);

$ViewList['admin_children'] = array(
								'script' => 'admin_children.php',
								'params' => array( 'nodeID' ),
								'unordered_params' => array( 'offset' => 'offset' ),
								);

$ViewList['admin_navigation_content'] = array(
								'script' => 'admin_navigation_content.php',
								'params' => array( 'nodeID' ),
								);

$ViewList['admin_navigation_details'] = array(
								'script' => 'admin_navigation_details.php',
								'params' => array( 'nodeID' ),
								);

$ViewList['admin_navigation_locations'] = array(
								'script' => 'admin_navigation_locations.php',
								'params' => array( 'nodeID' ),
								);

$FunctionList = array();

?>

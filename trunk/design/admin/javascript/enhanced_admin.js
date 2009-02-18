/**
 *
 * 	Global functions
 *
 */
window.addEvent( 'domready', function() {
	ez_initChildrenNumberOfItems();	
	ez_initChildrenViewMode();
} );

function ez_initChildrenNumberOfItems()
{
	if( $('numberofitems') )
	{
		$$('#numberofitems a').each( function (item, index) {
			item.setAttribute( 'onClick', 'return ez_adminChildrenNumberOfItems( ' + ( index + 1 ) + ')' );
		} );
	}
}

function ez_initChildrenViewMode()
{
	if( $( 'viewmode' ) )
	{
		var viewmode = [ 'list', 'thumbnail', 'detailded' ];
		$$('#viewmode a').each( function( item, index ) {
			item.setAttribute( 'onClick', 'return ez_adminChildrenViewMode(' + viewmode[index] + ')' );
		});
	}
}

function fez_adminRestartClassName( path )
{
	$$( path ).each( function( link ) { link.className = ''; } );
}

function fez_adminLoader( elementID )
{
	var elementHeight = $( elementID ).getStyle( 'height' ).toInt();
	if( elementHeight < 66 )
		elementHeight = 66;
	var paddingTop = ( elementHeight - 66 ) /2;
	$(elementID).innerHTML = '<div id="ajax-loader" style="height:' + elementHeight + 'px;"><img src="' + fez_loader + '" alt="" style="margin-top:' + paddingTop +'px;" /></div>';
}

/**
 *
 * Change the left menu width and the main area width
 *
 */
function fez_adminTreeMenu( link )
{
	var linkValue = link.href.charAt( link.href.length - 1 );
	var ajaxPage = new Ajax(fez_root + 'user/preferences/set/admin_treemenu/' + linkValue).request();

	if( linkValue == 1 )
	{
		link.innerHTML = link.innerHTML.replace( '+', '-');
		link.href = fez_root + 'user/preferences/set/admin_treemenu/0';
		fez_adminLoader( 'contentstructure' );
	}
	else
	{
		link.innerHTML = link.innerHTML.replace( '-', '+' );
		link.href = fez_root + 'user/preferences/set/admin_treemenu/1';
	}

	var ajaxRequest = new Ajax(fez_root + 'enhanced_admin/admin_treemenu/' + linkValue , { update:$('contentstructure') } ).request();
	return false;
}

function fez_adminLeftMenuWidth( size )
{
	menuWidth = 13 + size * 6;
	widthName = 'small';
	if( size == 1)
	{
		widthName = 'medium';
	}
	else if( size == 2 )
	{
		widthName = 'large';
	}

	fez_adminRestartClassName( "#leftmenu .widthcontrol a");
	ajaxWidth = new Ajax(fez_root + 'user/preferences/set/admin_left_menu_width/' + widthName).request();
	$('leftmenu').style.width = menuWidth + 'em';
	$('maincontent').style.marginLeft = menuWidth + '.5em';
	$( 'widthcontrol' + widthName ).className = 'current';

	return false;
}

/**
 *
 * Admin - Navigation - Onglet Content
 *
 */
function fez_adminNavigationContent( link )
{
	var preference= link.href.charAt( link.href.length - 1 );
	if( preference == 1 )
	{
		fez_adminLoader( 'admin_navigation_content_view' );
		$('admin_navigation_content').className = 'enabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_content/0';
	}
	else
	{
		$( 'admin_navigation_content_view').innerHTML = '';
		$('admin_navigation_content').className = 'disabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_content/1';
	}
	var ajaxAdminNavigationContent= new Ajax( fez_root + 'user/preferences/set/admin_navigation_content/' + preference, 
												{ onComplete: function() { 
													new Ajax( fez_root + 'enhanced_admin/admin_navigation_content/' + fez_node_id, { update:$('admin_navigation_content_view')} ).request();

										} }).request();
	
	return false;
}

/**
 *
 * Admin - Navigation - Onglet Details
 *
 */
function fez_adminNavigationDetails( link )
{
	var preference= link.href.charAt( link.href.length - 1 );
	if( preference == 1 )
	{
		$('admin_navigation_details').className = 'enabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_details/0';
	}
	else
	{
		$( 'admin_navigation_details_view').innerHTML = '';
		$('admin_navigation_details').className = 'disabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_details/1';
	}
	var ajaxAdminNavigationContent= new Ajax( fez_root + 'user/preferences/set/admin_navigation_details/' + preference, 
												{ onComplete: function() { 
													new Ajax( fez_root + 'enhanced_admin/admin_navigation_details/' + fez_node_id, { update:$('admin_navigation_details_view')} ).request();

										} }).request();
	return false;
}


/**
 *
 * Admin - Navigation - Onglet Emplacements
 *
 */
function fez_adminNavigationLocations( link )
{
	var preference= link.href.charAt( link.href.length - 1 );
	if( preference == 1 )
	{
		$('admin_navigation_locations').className = 'enabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_locations/0';
	}
	else
	{
		$( 'admin_navigation_locations_view').innerHTML = '';
		$('admin_navigation_locations').className = 'disabled';
		link.href= fez_root  + 'user/preferences/set/admin_navigation_locations/1';
	}
	var ajaxAdminNavigationContent= new Ajax( fez_root + 'user/preferences/set/admin_navigation_locations/' + preference, 
												{ onComplete: function() { 
													new Ajax( fez_root + 'enhanced_admin/admin_navigation_locations/' + fez_node_id, { update:$('admin_navigation_locations_view')} ).request();

										} }).request();
	return false;
}

/**
 *
 * Update the children
 *
 */
function ez_adminChildrenNumberOfItems( numberOfItems )
{
	fez_adminLoader( 'children_list' );
	fez_adminRestartClassName( "#numberofitems a" );
	var ajaxNumberOfItems = new Ajax( fez_root + 'user/preferences/set/admin_list_limit/' + numberOfItems , { onComplete: function() { fez_adminChildrenUpdate(); } }).request();
	return false;
}

function ez_adminChildrenViewMode( viewMode )
{
	fez_adminLoader( 'children_list' );
	fez_adminRestartClassName( "#viewmode a" );
	var ajaxViewMode = new Ajax( fez_root + 'user/preferences/set/admin_children_viewmode/' + viewMode, { onComplete:function() { fez_adminChildrenUpdate(); } } ).request();
	return false;
}

function fez_adminChildrenUpdate()
{
	var ajaxRequest = new Ajax( fez_root + 'enhanced_admin/admin_children/' + fez_node_id , { update:$('children_list') } ).request();
	return false;
}

function fez_adminChildrenOffset( offset )
{
	fez_adminLoader( 'children_list' );
	var ajaxRequest = new Ajax( fez_root + 'enhanced_admin/admin_children/' + fez_node_id + '/(offset)/' + offset , { update:$('children_list') } ).request();
	return false;
}

/**
 *
 * Navigator
 *
 */
function fez_adminGoToPage( )
{
}

function fez_adminClassSortable()
{
	new Sortables( $('class_attribute') , {
		handles : '#class_attribute table.list .sortable' ,
		onComplete: function() {
			var position = 1;
			$$('#class_attribute table.list input.sort_priority').each( function( elt ) {
				elt.value = position;
				position = position + 1;
			});
		}
	});
}

{let item_type=ezpreference( 'admin_list_limit' )
     number_of_items=min( $item_type, 3)|choose( 10, 10, 25, 50 )
     can_remove=false()
     can_edit=false()
     can_create=false()
     can_copy=false()
     children_count=fetch( content, list_count, hash( parent_node_id, $node.node_id,
                                                      objectname_filter, $view_parameters.namefilter ) )
     children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                          sort_by, $node.sort_array,
                                          limit, $number_of_items,
                                          offset, $view_parameters.offset,
                                          objectname_filter, $view_parameters.namefilter ) ) }
<div class="context-toolbar">
<div class="block">
<div class="left">
    <p id="numberofitems">
    	<a href={'/user/preferences/set/admin_list_limit/1'|ezurl} title="{'Show 10 items per page.'|i18n( 'design/admin/node/view/full' )}"{if $number_of_items|eq(10)} class="current"{/if} onClick="return fez_adminChildrenNumberOfItems(1)">10</a>
        <a href={'/user/preferences/set/admin_list_limit/2'|ezurl} title="{'Show 25 items per page.'|i18n( 'design/admin/node/view/full' )}"{if $number_of_items|eq(25)} class="current"{/if} onClick="return fez_adminChildrenNumberOfItems(2)">25</a>
		<a href={'/user/preferences/set/admin_list_limit/3'|ezurl} title="{'Show 50 items per page.'|i18n( 'design/admin/node/view/full' )}"{if $number_of_items|eq(50)} class="current"{/if} onClick="return fez_adminChildrenNumberOfItems(3)">50</a>
    </p>
</div>
<div class="right">
	<p id="viewmode">
		{def $fez_view_mode=ezpreference( 'admin_children_viewmode' )}
        <a onClick="return fez_adminChildrenViewMode( 'list' )"{if or($fez_view_mode|eq('list'), $fez_view_mode|eq(''))} class="current"{/if} href={'/user/preferences/set/admin_children_viewmode/list'|ezurl} title="{'Display sub items using a simple list.'|i18n( 'design/admin/node/view/full' )}">{'List'|i18n( 'design/admin/node/view/full' )}</a>
        <a  onClick="return fez_adminChildrenViewMode( 'thumbnail' )"{if $fez_view_mode|eq('thumbnail')} class="current"{/if} href={'/user/preferences/set/admin_children_viewmode/thumbnail'|ezurl} title="{'Display sub items as thumbnails.'|i18n( 'design/admin/node/view/full' )}">{'Thumbnail'|i18n( 'design/admin/node/view/full' )}</a>
        <a onClick="return fez_adminChildrenViewMode( 'detailed' )"{if $fez_view_mode|eq('detailed')} class="current"{/if} href={'/user/preferences/set/admin_children_viewmode/detailed'|ezurl} title="{'Display sub items using a detailed list.'|i18n( 'design/admin/node/view/full' )}">{'Detailed'|i18n( 'design/admin/node/view/full' )}</a>
		{undef $fez_view_mode}
	</p>
</div>

<div class="break"></div>

</div>
</div>

    {* Copying operation is allowed if the user can create stuff under the current node. *}
    {set can_copy=$node.can_create}

    {* Check if the current user is allowed to *}
    {* edit or delete any of the children.     *}
    {section var=Children loop=$children}
        {section show=$Children.item.can_remove}
            {set can_remove=true()}
        {/section}
        {section show=$Children.item.can_edit}
            {set can_edit=true()}
        {/section}
        {section show=$Children.item.can_create}
            {set can_create=true()}
        {/section}
    {/section}
{switch match=ezpreference( 'admin_children_viewmode' )}

{case match='thumbnail'}
    {include uri='design:children_thumbnail.tpl'}
{/case}

{case match='detailed'}
    {include uri='design:children_detailed.tpl'}
{/case}

{case}
    {include uri='design:children_list.tpl'}
{/case}
{/switch}

<div class="context-toolbar">
{include name=navigator
         uri='design:navigator/alphabetical.tpl'
         page_uri=$node.url_alias
         item_count=$children_count
         view_parameters=$view_parameters
         node_id=$node.node_id
         item_limit=$number_of_items}
</div>

{/let}

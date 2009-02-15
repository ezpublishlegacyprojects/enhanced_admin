{section show=ezpreference( 'admin_navigation_content'  )}
<div class="mainobject-window" title="{$node.name|wash} {'Node ID'|i18n( 'design/admin/node/view/full' )}: {$node.node_id}, {'Object ID'|i18n( 'design/admin/node/view/full' )}: {$node.object.id}">
<div class="fixedsize">{* Fix for overflow bug in Opera *}
<div class="holdinplace">{* Fix for some width bugs in IE *}
    {node_view_gui content_node=$node view=admin_preview}
</div>
</div>
<div class="break"></div>{* Terminate overflow bug fix *}
</div>
{/section}


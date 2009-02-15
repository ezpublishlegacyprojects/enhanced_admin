{section show=$admin_treemenu}
    {if ezini('TreeMenu','Dynamic','contentstructuremenu.ini')|eq('enabled')}
        {include uri='design:contentstructuremenu/content_structure_menu_dynamic.tpl'}
    {else}
        {include uri='design:contentstructuremenu/content_structure_menu.tpl'}
    {/if}
{/section}

<div id="content-tree">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

{section show=ezpreference( 'admin_treemenu' )}
<h4><a class="showhide" href={'/user/preferences/set/admin_treemenu/0'|ezurl} title="{'Hide content structure.'|i18n( 'design/admin/parts/content/menu' )}" onClick="return fez_adminTreeMenu( this );"><span class="bracket">[</span>-<span class="bracket">]</span></a> {'Content structure'|i18n( 'design/admin/parts/content/menu' )}</h4>
{section-else}
<h4><a class="showhide" href={'/user/preferences/set/admin_treemenu/1'|ezurl} title="{'Show content structure.'|i18n( 'design/admin/parts/content/menu' )}" onClick="return fez_adminTreeMenu( this );"><span class="bracket">[</span>+<span class="bracket">]</span></a> {'Content structure'|i18n( 'design/admin/parts/content/menu' )}</h4>
{/section}

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

{* Treemenu. *}
<div id="contentstructure">

{section show=ezpreference( 'admin_treemenu' )}
    {if ezini('TreeMenu','Dynamic','contentstructuremenu.ini')|eq('enabled')}
        {include uri='design:contentstructuremenu/content_structure_menu_dynamic.tpl'}
    {else}
        {include uri='design:contentstructuremenu/content_structure_menu.tpl'}
    {/if}
{/section}
</div>

{* Trashcan. *}
{section show=ne( $ui_context, 'browse' )}
<div id="trash">
<ul>
    <li><img src={'trash-icon-16x16.gif'|ezimage} width="16" height="16" alt="{'Trash'|i18n( 'design/admin/parts/content/menu' )}" />&nbsp;<a href={concat( '/content/trash/', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )|ezurl} title="{'View and manage the contents of the trash bin.'|i18n( 'design/admin/parts/content/menu' )}">{'Trash'|i18n( 'design/admin/parts/content/menu' )}</a></li>
</ul>
</div>
{/section}

{* Left menu width control. *}
<div class="widthcontrol">
<p>
<a href={'/user/preferences/set/admin_left_menu_width/small'|ezurl} id="widthcontrolsmall" onClick="return fez_adminLeftMenuWidth(0)"{if ezpreference( 'admin_left_menu_width' )|eq( 'small' )} class="current"{/if} title="{'Change the left menu width to small size.'|i18n( 'design/admin/parts/content/menu' )}">{'Small'|i18n( 'design/admin/parts/content/menu' )}</a>
<a href={'/user/preferences/set/admin_left_menu_width/medium'|ezurl} id="widthcontrolmedium" onCLick="return fez_adminLeftMenuWidth(1)"{if ezpreference( 'admin_left_menu_width' )|eq( 'medium' )} class="current"{/if} title="{'Change the left menu width to medium size.'|i18n( 'design/admin/parts/content/menu' )}">{'Medium'|i18n( 'design/admin/parts/content/menu' )}</a>
<a href={'/user/preferences/set/admin_left_menu_width/large'|ezurl} id="widthcontrollarge" onClick="return fez_adminLeftMenuWidth(2)"{if ezpreference( 'admin_left_menu_width' )|eq( 'large' )} class="current"{/if} title="{'Change the left menu width to large size.'|i18n( 'design/admin/parts/content/menu' )}">{'Large'|i18n( 'design/admin/parts/content/menu' )}</a>
</p>
</div>

{* DESIGN: Content END *}</div></div></div></div></div></div>

</div>

{* Window controls. *}
<div class="menu-block{section show=fetch( content, translation_list )|count|eq( 1 )} notranslations{/section}">

{def $translations_count=count($node.object.available_languages)
    $li_width="" }
{def $can_create_languages=fetch( content, prioritized_languages )}
{if le($can_create_languages, 1) }
    {set $li_width="_25"}
{/if}

<ul>
	{* Content preview. *}
	<li id="admin_navigation_content" class="{$li_width} {if ezpreference( 'admin_navigation_content' )}enabled{else}disabled{/if}">
		{section show=ezpreference( 'admin_navigation_content' )}
		    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        		<a href={'/user/preferences/set/admin_navigation_content/0'|ezurl} title="{'Hide preview of content.'|i18n( 'design/admin/node/view/full' )}" onClick="return fez_adminNavigationContent( this )">{'Preview'|i18n( 'design/admin/node/view/full' )}</a>
		    </div></div></div></div>
		{section-else}
		    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        		<a href={'/user/preferences/set/admin_navigation_content/1'|ezurl} title="{'Show preview of content.'|i18n( 'design/admin/node/view/full' )}" onClick="return fez_adminNavigationContent( this )">{'Preview'|i18n( 'design/admin/node/view/full' )}</a>
		    </div></div></div></div>
		{/section}
	</li>
    {* Details. *}
    {section show=ezpreference( 'admin_navigation_details' )}
    <li id="admin_navigation_details" class="enabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a href={'/user/preferences/set/admin_navigation_details/0'|ezurl} title="{'Hide details.'|i18n( 'design/admin/node/view/full' )}" onClick="return fez_adminNavigationDetails( this )">{'Details'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {section-else}
    <li id="admin_navigation_details" class="disabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a href={'/user/preferences/set/admin_navigation_details/1'|ezurl} title="{'Show details.'|i18n( 'design/admin/node/view/full' )}" onClick="return fez_adminNavigationDetails( this );">{'Details'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {/section}

    {section show=fetch( content, translation_list )|count|gt( 1 )}
    {* Translations. *}
    {if gt($can_create_languages, 1) }
    {section show=ezpreference( 'admin_navigation_translations' )}
    <li id="admin_navigation_translations" class="enabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a onClick="return fez_adminNavigationTranslations( this );" href={'/user/preferences/set/admin_navigation_translations/0'|ezurl} title="{'Hide available translations.'|i18n( 'design/admin/node/view/full' )}">{'Translations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {section-else}
    <li id="admin_navigation_translations" class="disabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
            <a onClick="return fez_adminNavigationTranslations( this );" href={'/user/preferences/set/admin_navigation_translations/1'|ezurl} title="{'Show available translations.'|i18n( 'design/admin/node/view/full' )}">{'Translations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {/section}
    {/if}
    {/section}

    {* Locations. *}
    {section show=ezpreference( 'admin_navigation_locations' )}
    <li id="admin_navigation_locations" class="enabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a onClick="return fez_adminNavigationLocations( this );"  href={'/user/preferences/set/admin_navigation_locations/0'|ezurl} title="{'Hide location overview.'|i18n( 'design/admin/node/view/full' )}">{'Locations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {section-else}
    <li id="admin_navigation_locations" class="disabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a onClick="return fez_adminNavigationLocations( this );" href={'/user/preferences/set/admin_navigation_locations/1'|ezurl} title="{'Show location overview.'|i18n( 'design/admin/node/view/full' )}">{'Locations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {/section}

    {* Relations. *}
    {section show=ezpreference( 'admin_navigation_relations' )}
    <li id="admin_navigation_relations" class="enabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a onClick="return fez_adminNavigationRelations( this )" href={'/user/preferences/set/admin_navigation_relations/0'|ezurl} title="{'Hide object relation overview.'|i18n( 'design/admin/node/view/full' )}">{'Relations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {section-else}
    <li id="admin_navigation_relations" class="disabled {$li_width}">
    <div class="button-bc"><div class="button-tl"><div class="button-tr"><div class="button-br">
        <a onClick="return fez_adminNavigationRelations( this );" href={'/user/preferences/set/admin_navigation_relations/1'|ezurl} title="{'Show object relation overview.'|i18n( 'design/admin/node/view/full' )}">{'Relations'|i18n( 'design/admin/node/view/full' )}</a>
    </div></div></div></div>
    </li>
    {/section}
</ul>

<div class="break"></div>

{undef $li_width $translations_count}

</div>

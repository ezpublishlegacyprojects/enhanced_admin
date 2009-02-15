{* Details window. *}
<div id="admin_navigation_details_view">
{section show=ezpreference( 'admin_navigation_details' )}
    {include uri='design:details.tpl'}
{/section}
</div>

{* Translations window. *}
<div id="admin_navigation_translations_view">
{section show=ezpreference( 'admin_navigation_translations' )}
    {include uri='design:translations.tpl'}
{/section}
</div>

{* Locations window. *}
<div id="admin_navigation_locations_view">
{section show=ezpreference( 'admin_navigation_locations' )}
    {include uri='design:locations.tpl'}
{/section}
</div>

{* Relations window. *}
<div id="admin_navigation_relations_view">
{section show=or( ezpreference( 'admin_navigation_relations' ),
                  and( is_set( $view_parameters.show_relations ), eq( $view_parameters.show_relations, 1 ) ) )}
    {include uri='design:relations.tpl'}
{/section}
</div>

{* Children window.*}
{section show=$node.object.content_class.is_container}
    {include uri='design:children.tpl'}
{section-else}
    {include uri='design:no_children.tpl'}
{/section}

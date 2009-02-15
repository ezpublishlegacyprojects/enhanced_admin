{section show=or( ezpreference( 'admin_navigation_relations' ),
                  and( is_set( $view_parameters.show_relations ), eq( $view_parameters.show_relations, 1 ) ) )}
    {include uri='design:relations.tpl'}
{/section}

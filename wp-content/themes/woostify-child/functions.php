<?php
/**
 * Woostify Child Theme — functions.php
 * Doze Crew
 */

add_action( 'wp_enqueue_scripts', function () {
    wp_enqueue_style(
        'woostify-child-style',
        get_stylesheet_uri(),
        [ 'woostify-style' ],
        wp_get_theme()->get( 'Version' )
    );
} );

<?php
/**
 * Astra Child Theme — Doze Crew
 */

add_action( 'wp_enqueue_scripts', 'astra_child_enqueue_styles' );
function astra_child_enqueue_styles() {
    wp_enqueue_style(
        'astra-theme-css',
        get_template_directory_uri() . '/style.css',
        array(),
        wp_get_theme()->parent()->get('Version')
    );
    wp_enqueue_style(
        'astra-child-css',
        get_stylesheet_directory_uri() . '/style.css',
        array('astra-theme-css'),
        wp_get_theme()->get('Version')
    );
}

<?php

function csreport_preprocess_html(&$variables) {
  drupal_add_css(drupal_get_path('theme', 'csreport') . '/css/ie.css', array(
									     'group' => CSS_THEME,
									     'browsers' => array(
												 'IE' => TRUE,
												 '!IE' => FALSE,
												 ),
  ));
}
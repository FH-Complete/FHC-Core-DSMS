<?php
// Add Header-Menu-Entry to Extension Page
$config['navigation_header']['extensions/FHC-Core-DSMS/Export/index']['FHComplete'] = base_url('index.ci.php');
$config['navigation_header']['extensions/FHC-Core-DSMS/Export/Anonymisierung']['FHComplete'] = base_url('index.ci.php');

// Add Menu-Entry to Main Page
$config['navigation_menu']['Vilesci/index']['Administration']['children']['Datenschutz'] = array(
			'link' => base_url('index.ci.php/extensions/FHC-Core-DSMS/Export'),
			'description' => 'Datenschutz',
			'icon' => 'legal',
			'expand' => true
);

// Add Menu-Entry to Extension Page
$menu = array(
	'Export' => array(
		'link' => site_url('extensions/FHC-Core-DSMS/Export/'),
		'description' => 'Export',
		'icon' => 'vcard'
	),
	'Anonymisierung' => array(
		'link' => site_url('extensions/FHC-Core-DSMS/Export/Anonymisierung'),
		'description' => 'Anonymisierung',
		'icon' => 'user-secret'
	)
);

$config['navigation_menu']['extensions/FHC-Core-DSMS/Export/index'] = $menu;
$config['navigation_menu']['extensions/FHC-Core-DSMS/Export/Anonymisierung'] = $menu;

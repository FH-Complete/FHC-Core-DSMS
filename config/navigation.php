<?php

// Add Menu-Entry to Main Page
$config['navigation_menu']['Vilesci/index']['Administration']['children']['Datenschutz'] = array(
			'link' => site_url('extensions/FHC-Core-DSMS/Export'),
			'description' => 'Datenschutz',
			'icon' => 'legal',
			'expand' => true
);

// Add Menu-Entry to Extension Page
$config['navigation_menu']['extensions/FHC-Core-DSMS/*'] = array(
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

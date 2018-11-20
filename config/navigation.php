<?php

// Add Menu-Entry to Main Page
$config['navigation_menu']['Vilesci/index']['administration']['children']['datenschutz'] = array(
			'link' => site_url('extensions/FHC-Core-DSMS/Export'),
			'description' => 'Datenschutz',
			'icon' => 'legal',
			'expand' => true,
			'requiredPermissions' => 'dsms/export:r'
);

// Add Menu-Entry to Extension Page
$config['navigation_menu']['extensions/FHC-Core-DSMS/*'] = array(
	'export' => array(
		'link' => site_url('extensions/FHC-Core-DSMS/Export/'),
		'description' => 'Export',
		'icon' => 'vcard'
	),
	'anonymisierung' => array(
		'link' => site_url('extensions/FHC-Core-DSMS/Export/Anonymisierung'),
		'description' => 'Anonymisierung',
		'icon' => 'user-secret'
	)
);

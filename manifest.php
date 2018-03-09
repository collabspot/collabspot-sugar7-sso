<?php
$manifest = array (
  'id' => 'collabspot-sso',
  'name' => 'Collabspot SSO Integration',
  'description' => 'Modifies AuthenticateParent.tpl to allow Collabspot to leverage the authentication tokens sent from the IdP to Sugar.',
  'version' => '1.0.0',
  'author' => 'Collabspot',
  'is_uninstallable' => 'true',
  'published_date' => '2018-03-09 11:00:00',
  'type' => 'module',
  'acceptable_sugar_versions' => array (
    'regex_matches' => array (
      0 => '^7.9.[\\d]+.[\\d]+$',
      1 => '^7.10.[\\d]+.[\\d]+$',
      2 => '^7.11.[\\d]+.[\\d]+$',
    ),
  ),
);
$installdefs = array (
  'mkdir' => array(
    array('custom/modules/Users/tpls/')
  ),
  'copy' => array (
    0 => array (
      'from' => '<basepath>/src/custom/modules/Users/tpls/AuthenticateParent.tpl',
      'to' => 'custom/modules/Users/tpls/AuthenticateParent.tpl',
    )
  ),
);


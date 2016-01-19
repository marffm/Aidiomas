<?php
session_start();
require_once 'config.php';
require_once DIR_SYSTEM . 'Startup.php';

$registry = new Registry();

$url = new Url($registry);
$registry->set('url', $url);

$load = new Loader($registry);
$registry->set('loader', $load);

$document = new Document($registry);
$registry->set('document', $document);

$breadcrumbs = new Breadcrumbs ($registry);
$registry->set('breadcrumbs', $breadcrumbs);

$Db = new Db($registry);
$registry->set('db', $Db);

$class = $url->getUrl();

if (file_exists(DIR_CONTROLLERS . $class[0]. '.php')) {
    $index = new $class[0]($registry);
    $registry->set('controller', $index);
    $index->index();
} else {
    $class[0]= 'error';
    $index = new $class[0]($registry);
    $registry->set('controller', $index);
    $index->index();
}


if (isset($class[2])){
	return $index->{$class[1]}($class[2]);
} else {
	if (isset($class[1])) {
		$index->{$class[1]}();		
	}
}





/* ---- Debug ---- */
//echo '<br/><br/><hr>';
//var_dump($document);
//echo '<br/>I\'m in index page';
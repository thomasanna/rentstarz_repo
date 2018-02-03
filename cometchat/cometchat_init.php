<?php

/*

CometChat
Copyright (c) 2016 Inscripts
License: https://www.cometchat.com/legal/license

*/

if(stripos(dirname(__FILE__),'/plugins/cometchat')){
	$trace = debug_backtrace();
}else{
	$trace[0]['file'] = '';
}
if(!stripos($trace[0]['file'], 'plugins/system/cometchat/cometchat.php') && !isset($_REQUEST['deny_sanitize'])){
	$requestKeyExceptions = array('message', 'statusmessage', 'social_details', 'receivedunreadmessages', 'readmessages', 'crreadmessages','appinfo');
	foreach($_REQUEST as $key => $val){
		if (!in_array($key, $requestKeyExceptions)) {
			$_REQUEST[$key] = str_replace('<','',str_replace('"','',str_replace("'",'',str_replace('>','',$_REQUEST[$key]))));
			if(!empty($_POST[$key])){
				$_POST[$key] = str_replace('<','',str_replace('"','',str_replace("'",'',str_replace('>','',$_POST[$key]))));
			}
			if(!empty($_GET[$key])){
				$_GET[$key] = str_replace('<','',str_replace('"','',str_replace("'",'',str_replace('>','',$_GET[$key]))));
			}
			if(!empty($_COOKIE[$key])){
				$_COOKIE[$key] = str_replace('<','',str_replace("'",'',str_replace('>','',$_COOKIE[$key])));
			}
		}
	}
}

include_once(dirname(__FILE__).DIRECTORY_SEPARATOR."config.php");
include_once(dirname(__FILE__).DIRECTORY_SEPARATOR."cometchat_shared.php");
include_once(dirname(__FILE__).DIRECTORY_SEPARATOR."cometchat_guests.php");
include_once(dirname(__FILE__).DIRECTORY_SEPARATOR."php4functions.php");

if (USE_COMET == 1) {
	include_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'transports'.DIRECTORY_SEPARATOR.TRANSPORT.DIRECTORY_SEPARATOR.'config.php');
	include_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'transports'.DIRECTORY_SEPARATOR.TRANSPORT.DIRECTORY_SEPARATOR.'comet.php');
}

if (CROSS_DOMAIN == 1) {
	header('P3P: CP="IDC DSP COR CURa ADMa OUR IND PHY ONL COM STA"');
}

if (defined('SET_SESSION_NAME') && SET_SESSION_NAME != '') {
	session_name(SET_SESSION_NAME);
}

if (empty($_REQUEST['basedata'])) {
	$_REQUEST['basedata'] = 'null';
} else {
	if (CROSS_DOMAIN == 1 || (!empty($_REQUEST['callbackfn']) && in_array($_REQUEST['callbackfn'],array('desktop','mobileapp')))) {
		if ($_REQUEST['basedata'] != 'null') {
			session_id(md5($_REQUEST['basedata']));
			session_start();
		}
	}
}

if(session_id() == '') {
    session_start();
}

function stripSlashesDeep($value) {
	$value = is_array($value) ? array_map('stripSlashesDeep', $value) : stripslashes($value);
	return $value;
}

if (get_magic_quotes_gpc() || (defined('FORCE_MAGIC_QUOTES') && FORCE_MAGIC_QUOTES == 1)) {
	$_GET = stripSlashesDeep($_GET);
	$_POST = stripSlashesDeep($_POST);
	$_REQUEST = stripSlashesDeep($_REQUEST);
	$_COOKIE = stripSlashesDeep($_COOKIE);
}

if (CROSS_DOMAIN == 1  || (!empty($_REQUEST['callbackfn']) && $_REQUEST['callbackfn'] == 'mobileapp')) {
    if (!empty($_REQUEST)) {
        foreach ($_REQUEST as $param => $value) {
            if (substr($param,0,7) == 'cookie_') {
                if ($value != 'null') {
                    $_COOKIE[substr($param,7)] = $value;
                }
            }
        }
    }
}

if (!empty($_REQUEST['basedata'])) {
	$_SESSION['basedata'] = $_REQUEST['basedata'];
}

if(get_magic_quotes_runtime()) {
    set_magic_quotes_runtime(false);
}


ini_set('log_errors', 'Off');
ini_set('display_errors','Off');

if (defined('ERROR_LOGGING') && ERROR_LOGGING == '1') {
	error_reporting(E_ALL);
	ini_set('error_log', 'error.log');
	ini_set('log_errors', 'On');
}

if (defined('DEV_MODE') && DEV_MODE == '1') {
	error_reporting(E_ALL);
	ini_set('display_errors','On');
}

cometchatDBConnect();

cometchatMemcacheConnect();

$chromeReorderFix = '_';

if(empty($bannedUserIPs)) { $bannedUserIPs = array(); }
$userid = getUserID();

if($guestsMode && $userid == 0 && (empty($_REQUEST['callbackfn']) ||  ($_REQUEST['callbackfn'] <> 'mobileapp' && $_REQUEST['callbackfn'] <> 'desktop'))) {
	if (empty($noguestlogin) && empty($_SESSION['noguestmode'])) {
		$username = '';
		if(!empty($_REQUEST['username'])){
			$username = $_REQUEST['username'];
		}
		$userid = getGuestID($username);
	}
}

if(empty($_SESSION['cometchat'])||empty($_SESSION['cometchat']['user'])||empty($_SESSION['cometchat']['user']['n'])){
	getStatus();
}

if(empty($_SESSION['cometchat']['userid']) || $_SESSION['cometchat']['userid'] <> $userid) {
	unset($_SESSION['cometchat']);
	unset($_SESSION['CCAUTH_SESSION']);
	$_SESSION['cometchat']['userid'] = $userid;
	setcookie ($cookiePrefix."state", "", time() - 3600,'/');
}
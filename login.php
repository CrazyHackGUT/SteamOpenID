<?PHP
if (!defined('IN_OPENID')) die("Hacking Attempt!");

$Data = SteamAuthorize(OPENID_SITE);
if (strpos($Data, 'steamcommunity') !== false) {
	$Template->load_template('AuthPage.tpl');
	$Template->set('{AuthURL}', $Data);
	$Template->compile('page');
	echo($Template->result['page']);
} else {
	setcookie('steamid', $Data);
	Header('Location: /Steam_OpenID/');
}
?>
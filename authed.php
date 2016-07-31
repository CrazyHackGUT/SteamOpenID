<?PHP
if (!defined('IN_OPENID')) die("Hacking Attempt!");

$Template->load_template('AuthSuccess.tpl');
$Template->set('{SteamID}', $_COOKIE['steamid']);
$Template->compile('page');
echo($Template->result['page']);
?>
<?PHP
// Defines
define('IN_OPENID', true);
define('ENGINE_DIR', dirname(__FILE__));
define('OPENID_SITE', $_SERVER['HTTP_HOST']);

// Special actions: Deauthorize
if (isset($_GET['act'])) {
	if ($_GET['act'] == 'deauthorize') {
		setcookie('steamid', null);
		Header("Location: /Steam_OpenID/");
		exit();
	}
}

// Libraries
require_once(sprintf('%s/lib/OpenID.php', ENGINE_DIR));
require_once(sprintf('%s/lib/Steam.php', ENGINE_DIR));
require_once(sprintf('%s/lib/Templator.php', ENGINE_DIR));

// Setting templator
$Template = new Template();
$Template->dir = "templates/";

// Router
if (!isset($_COOKIE['steamid'])) {
	require_once(sprintf('%s/login.php', ENGINE_DIR));
} else {
	require_once(sprintf('%s/authed.php', ENGINE_DIR));
}
?>
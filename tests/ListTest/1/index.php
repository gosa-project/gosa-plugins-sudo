<?php
require_once("../../../include/autoload.inc");
restore_error_handler();
session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Blubb</title>
<style type="text/css">@import url('../ObjectListViewport.css');</style>
<script language="javascript" src="../ObjectListViewport.js" type="text/javascript"></script>
</head>
<body>
<button onclick='updateObjectListViewportSize();'>Tester</button>
<?php

/* This is good for testing... */
error_reporting (E_ALL | E_STRICT);

/* Escape all preg_* relevant characters */
function normalizePreg($input)
{
  return (addcslashes($input, '[]()|/.*+-'));
}


function get_smarty()
{
	echo "Smarty fake in each ./tests/ListTest[1-9]/index.php";
	date_default_timezone_set("europe/berlin");
	$smarty = new smarty;
	/* Set template compile directory */
	$smarty->compile_dir= '/var/spool/gosa/';
	$smarty->template_dir = '../';
	$smarty->caching= false;
	$smarty->php_handling= SMARTY_PHP_REMOVE;
	return($smarty);
}


try {

	/* Get new test instance of the Configuration */
	$cr= Registry::getInstance("ConfigManager");
	$cr->load("../../../gosa.conf");

    /* Get a new test instance of ObjectListViewports */
    if(!isset($_SESSION['vp3'])){
        $_SESSION['vp3'] = new ObjectListViewport("plugin/sample",TRUE);
    }
    $vp = $_SESSION['vp3'];
	$content= $vp->render();

} catch (Exception $e) {
	echo "\n-GOsa Exception-----------------------------------------------------------\n\n".
		 $e->__toString().
		 "\n\n--------------------------------------------------------------------------\n\n";
}

?>
    <table style='height:90%;width:90%;' cellpadding=0>
        <tr>
            <td>
               <?php echo $content; ?>
				
            </td>
        </tr>
    </table>
</body>
</html>
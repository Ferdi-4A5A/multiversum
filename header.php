<?php
include 'class/class.DbHandler.php';
$crud = new DbHandler('192.168.56.1','multiversum','mainuser','dev01dev');
header("Content-Type: text/html; charset=ISO-8859-1");
session_start();
?>

<div class="col-12 header-text">
    <img src="img/logo.svg" class="img-logo" />
    MULTIVERSUM
</div>

<div class="col-4 navmenu nopadding">
    <a href="index.php">Home</a>
</div>
<div class="col-4 navmenu nopadding">
    <a href="products.php">Products</a>
</div>
<div class="col-4 navmenu nopadding">
    <a href="">Contact</a>
</div>

<div class="col-11 navbar">
    <form method="post" action="">
        <button type="submit" name="btn-delete-order">Verwijder order</button>
    </form>
</div>
<div class="col-1 navbar">
    <a href="shopping_card.php">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    </a>
</div>
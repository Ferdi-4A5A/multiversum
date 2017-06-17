<!DOCTYPE html>
<html>

<head>
    <?php include 'head.php' ?>
</head>

<!--    Checken voor file extensie, max filesize, random filename generator, image resizing php(product page) en mss nog wat-->

<body>

<?php include 'header.php' ?>

<div class="col-m-12">
    Hier kunt u uw producten invoeren
</div>


<?php

    $dbName = 'multiversum';
    $tableName = 'products';
    $tableID = 'productID';

    $paginationStartFrom = 0;
    $paginationRowPerPage = 5;

    $paginationPageNumber = (isset($_GET['page'])) ? $_GET['page'] : '1';

    $crud = new DbHandler('192.168.56.1',$dbName,'mainuser','dev01dev');

    if (isset($_POST['btn-product-insert'])) {
        $sql = "INSERT INTO products (productEAN, productTitle, productHighlight1, productHighlight2, productHighlight3, productDetails, productImage, productStock, productExpectedDeliveryDays, productPrice, productAfmeting, productGewicht, productKleur, productSequence, productIsOnline, productIsSale, productSalePrice) VALUES ('".$_POST['input-product-insert-ean']."', '".$_POST['input-product-insert-title']."', '".$_POST['input-product-insert-highlight1']."', '".$_POST['input-product-insert-highlight2']."', '".$_POST['input-product-insert-highlight3']."', '".$_POST['input-product-insert-details']."', '".$_FILES['userfile']['name']."', '".$_POST['input-product-insert-stock']."', '".$_POST['input-product-insert-expected-delivery-days']."', '".$_POST['input-product-insert-price']."', '".$_POST['input-product-insert-dimension']."', '".$_POST['input-product-insert-weight']."', '".$_POST['input-product-insert-color']."', '".$_POST['input-product-insert-position']."', '".$_POST['input-product-insert-status']."', '".$_POST['input-product-insert-sale']."', '".$_POST['input-product-insert-sale-price']."')";
        $res = $crud->createData($sql);
    }

    if(isset($_POST['btn-product-insert'])) {
        $uploaddir = '/media/sf_www/multiversum/img/product/';
        $uploadfile = $uploaddir . basename($_FILES['userfile']['name']);

        move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile);
        echo 'Product successfully added';

//        // The file
//        $filename = $_FILES['userfile']['name'];
////        $percent = 0.5;
//
//        // Content type
////        header('Content-Type: image/jpeg');
//
//        // Get new dimensions
//        list($width, $height) = getimagesize('../img/product/' . $_FILES['userfile']['name']);
//        $new_width = 180;
//        $new_height = 101;
//        // Resample
//        $image_p = imagecreatetruecolor($new_width, $new_height);
////        $image = imagecreatefromjpeg('../img/product/' . $_FILES['userfile']['name']);
//
////        imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
//
//        // Output
//        imagejpeg($image_p, null, 100);

    }
?>

    <div class="col-3"></div>
    <div class="col-6">
        <form enctype="multipart/form-data" method="post" action="" class="form-product-insert">
            <input type="text" name="input-product-insert-ean" placeholder="EAN"/>
            <input type="text" name="input-product-insert-title" placeholder="Title"/>
            <input type="text" name="input-product-insert-highlight1" placeholder="Highlight 1"/>
            <input type="text" name="input-product-insert-highlight2" placeholder="Highlight 2"/>
            <input type="text" name="input-product-insert-highlight3" placeholder="Highlight 3"/>
            <textarea style="width: 100%;height: 150px;" type="text" name="input-product-insert-details" placeholder="Details"></textarea>
            <input type="text" name="input-product-insert-stock" placeholder="Stock"/>
            <input type="text" name="input-product-insert-expected-delivery-days" placeholder="Expected delivery days"/>
            <input type="text" name="input-product-insert-price" placeholder="Prijs"/>
            <input type="text" name="input-product-insert-dimension" placeholder="Afmeting"/>
            <input type="text" name="input-product-insert-weight" placeholder="Gewicht"/>
            <input type="text" name="input-product-insert-color" placeholder="Kleur"/>
            <input type="text" name="input-product-insert-position" placeholder="Positie"/>
            <input type="text" name="input-product-insert-status" placeholder="Offline=0 / Online=1"/>
            <input type="text" name="input-product-insert-sale" placeholder="Nosale=0 / Sale=1"/>
            <input type="text" name="input-product-insert-sale-price" placeholder="Sale prijs"/>
            Send this file: <input name="userfile" type="file" />
            <button type="submit" name="btn-product-insert">Insert</button>
        </form>
    </div>

<?php

?>

</body>
</html>
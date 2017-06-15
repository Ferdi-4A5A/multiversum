<!DOCTYPE html>
<html>

<head>
    <?php include 'head.php' ?>
    <link rel="stylesheet" type="text/css" href="css/products.css">
</head>

<body>

    <?php
    include 'header.php';

    $tableID = 'product_id';
    $tableName = 'products';

    $paginationStartFrom = 0;
    $paginationRowPerPage = 10;

    $paginationPageNumber = (isset($_GET['page'])) ? $_GET['page'] : '1';

    if (isset($paginationPageNumber)) {
        $paginationStartFrom = ($paginationPageNumber - 1) * $paginationRowPerPage;

        $sql = "SELECT * FROM `$tableName`";
        $res = $crud->readData($sql);
        $paginationPageLimit = ceil(count($res) / $paginationRowPerPage);

        $sql = "SELECT * FROM `$tableName` LIMIT $paginationStartFrom, $paginationRowPerPage";
    }

    if (isset($_POST['previous'])) {
        if ($paginationPageNumber <= 1) {
            $paginationPageNumber = $paginationPageLimit + 1;
        }

        $paginationPageNumber = $paginationPageNumber - 1;
        $pageDir = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
        $baseUrl = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$page_link";

        header('Location:' . $baseUrl . $pageDir . '?page=' . $paginationPageNumber);
    }

    if (isset($_POST['next'])) {
        if ($paginationPageNumber == $paginationPageLimit) {
            $paginationPageNumber = 0;
        }

        $paginationPageNumber = $paginationPageNumber + 1;
        $page_link = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
        $baseUrl = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$page_link" . '?page=' . $paginationPageNumber;

        header('Location:' . $baseUrl);
    }
    $res = $crud->readData($sql);

    foreach ($res as $row) {
        echo '<form method="get" action="product_detail.php">';
            echo '<div class="col-m-4 product-thumbnail-width">';
                echo '<button type="submit" name="name" value="' . $row["productID"] . '" class="col-m-12 col-12 page-product-button">';
                    echo '<div class="product-header">';
                        echo '<div class="product-thumbnail-title">';
                            echo $row['productTitle'];
                        echo '</div>';
                        echo '<div style="max-width:500px;" class="div-img-product-info">';
                            echo '<img src="img/product/' . $row['productImage'] . '  " class="img-product-info" />';
                        echo '</div>';

                        echo '<div class="div-product-info">';
                            echo '<span class="product-description">';
                                echo '* ' . $row['productHighlight1'] . '<br />';
                                echo '* ' . $row['productHighlight2'] . '<br />';
                                echo '* ' . $row['productHighlight3'];
                            echo '</span>';

                            echo '<span class="product-price" >';
                                echo '<span class="product-price-total">';
                                    echo 'Totaal: &euro;' . number_format($row['productPrice'], 2, ',', '');
                                echo '</span>';
                                echo '<span class="product-price-btw">';
                                    echo 'excl. btw: &euro;' . number_format(($row['productPrice'] / 1.21), 2, ',', '');
                                echo '</span>';

                                echo '<span class="product-stock">';
                                    echo 'Stock: ' . $row['productStock'];
                                echo '</span>';
                                // a href in button met in winkelwagen, requesturi + name=id?
                                echo '<span class="product-add-to-cart">';
                                    echo 'In winkelwagen';
                                echo '</span>';

                            echo '</span>';
                        echo '</div>';
                    echo '</div>';
                echo '</button>';
            echo '</div>';
        echo '</form>';
    }

    $sql = "SELECT * FROM $tableName";
    $res = $crud->readData($sql);
    $paginationPageLimit = ceil(count($res) / $paginationRowPerPage);
    $PaginationPagePlus = $paginationPageNumber +1;
    $PaginationPageMin = $paginationPageNumber -1;

    echo '<div class="col-m-12">';
        echo '<div class="div-table">';
            echo '<div class="div-tr">';
                echo '<div class="div-td">';

                    echo '<form method="get" action="">';
                        for ($paginationPages = 1; $paginationPages <= $paginationPageLimit; $paginationPages++) {
                            echo '<button type="submit" name="page" value="' . $paginationPages . '">' . $paginationPages .'</button>';
                        }
                    echo '</form>';

                    echo '<form method="post" action="">';
                        echo '<button type="submit" name="previous" value=' . $PaginationPageMin . '>Previous</button>';
                        echo '<button type="submit" name="next" value=' . $PaginationPagePlus . '>Next</button>';
                    echo '</form>';

                echo '</div>';
            echo '</div>';
        echo '</div>';
    echo '</div>';

    ?>

</body>
</html>
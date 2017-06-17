<!DOCTYPE html>
<html>

<head>
    <?php include 'head.php' ?>
    <link rel="stylesheet" type="text/css" href="css/product_detail.css">
</head>

<body>

    <?php
    include 'header.php';

    $sql = "SELECT * FROM products WHERE productID = '" . $_GET['name'] . "'";
    $res = $crud->readData($sql);

        foreach ($res as $row) {

            echo '<div class="col-12 product-detail-div-image">';
                echo '<img src="img/product/'.$row['productImage'].'" class="img-product-detail" />';
            echo '</div>';

            echo '<div class="col-2"></div>';
            echo '<div class="col-8">';

                echo '<table cellspacing="0" class="table-product-details">';

                    echo '<h3>Productgegevens</h3>';

                    echo '<tr>';
                        echo '<td>' . 'Naam' . '</td>';
                        echo '<td style="width: 100%;">' . $row['productTitle'] . '</td>';
                    echo '</tr>';
                    echo '<tr>';
                        echo '<td>' . 'Voorraad' . '</td>';
                        echo '<td>' . $row['productStock'] . '</td>';
                    echo '</tr>';
                    echo '<tr>';
                        echo '<td>' . 'Prijs' . '</td>';
                        echo '<td>' . $row['productPrice'] . '</td>';
                    echo '</tr>';
                    echo '<tr>';
                        echo '<td>' . 'Highlight' . '</td>';
                        echo '<td>' . $row['productHighlight1'] . '</td>';
                    echo '</tr>';
                    echo '<tr>';
                        echo '<td>' . 'Highlight' . '</td>';
                        echo '<td>' . $row['productHighlight2'] . '</td>';
                    echo '</tr>';
                    echo '<tr>';
                        echo '<td>' . 'Highlight' . '</td>';
                        echo '<td>' . $row['productHighlight3'] . '</td>';
                    echo '</tr>';

                echo '</table>';

                echo '<div class="product-detail-description">';
                    echo $row["productDetails"];
                echo '</div>';

                echo '<form method="post" action="shopping_card.php">';
                    echo '<button type="submit" name="add-product" value="' . $row["productID"] . '" class="btn-shopping-cart"> In winkelwagen</button>';
                echo '</form>';
        };
            echo '</div>';
?>


</body>
</html>
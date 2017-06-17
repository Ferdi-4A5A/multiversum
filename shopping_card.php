<!DOCTYPE html>
<html>

<head>
    <?php include 'head.php' ?>
    <link rel="stylesheet" type="text/css" href="css/shopping_card.css">
</head>

<!--

// gaat iets niet goed met aantal aanpassen, word product ook toegevoegd als die nog niet bestaat

-->

<body>

    <?php
    include 'header.php' ;

    // Add a product
    if (isset($_GET['add-product'])) {

        // if there is a shopping card
        if (isset($_SESSION['orderID'])) {
            $sql = "SELECT productID FROM ordersProducts WHERE OrderID = '" . $_SESSION['orderID'] . "' ";
            $res = $crud->readData($sql);

            $product_found = 0;
            foreach($res as $row) {
                // hij moet ALTIJD door alles loopen en updaten dus gewoon zo laten
                if (in_array($_GET['add-product'], $row)) {
                    $sql = "UPDATE ordersProducts SET productAmount = productAmount +1 WHERE productID = '" . $_GET['add-product'] . "' AND orderID = '" . $_SESSION['orderID'] . "' ";
                    $crud->createData($sql);
                    $product_found = "1";
                }
            }
            if ($product_found != "1") {
                $sql = "INSERT INTO ordersProducts (orderID, productID, productAmount) VALUES ('" . $_SESSION['orderID'] . "', '" . $_GET['add-product'] . "', 1) ";
                $crud->createData($sql);
            }



        // if there is no shopping card
        } elseif (!isset($_SESSION['orderID'])) {
            $_SESSION = array();
            $sql = "INSERT INTO orders (orderCode) VALUES ('" . $_GET['add-product'] . "') ";
            $_SESSION['orderID'] = $crud->createData($sql);
            $sql = "INSERT INTO ordersProducts (orderID, productID, productAmount) VALUES ('" . $_SESSION['orderID'] . "', '" . $_GET['add-product'] . "', 1) ";
            $crud->createData($sql);
        }
    }

    if (isset($_POST['btn-amount'])) {
        $sql = "UPDATE ordersProducts SET productAmount = '" . $_POST['input-amount'] . "' WHERE orderProductID = '" . $_POST['btn-amount'] . "' ";
        $crud->updateData($sql);
    }

    if (isset($_POST['btn-delete'])) {
        $sql = "DELETE FROM ordersProducts WHERE orderProductID = '" . $_POST['btn-delete'] . "'";
        $crud->deleteData($sql);
    }

    $sql = "SELECT ordersProducts.orderProductID, ordersProducts.productID, ordersProducts.productAmount, products.productTitle, products.productPrice FROM ordersProducts 
                    INNER JOIN products ON ordersProducts.productID = products.productID WHERE orderID = '".$_SESSION['orderID']. "'";
    $res = $crud->readData($sql);


    // je MOET eerst een order aanmaken en dat orderID meenemen naar ordersProducts !?

    // je moet eerst een order toevoegen (wss) en dan ordersProductsID toevoegen in orders en als die dan al bestaat dan anders..?  -> nee een order heeft meerdere ordersProductsID's dan...





    // een INNER JOIN van products en orderProducts en dan op die manier selecten uit products en de where van orderProducts?! :D
    // De winkelwagen button uit header.php in een FORM zetten en als daar op geklikt word dan de isset op die pagina de inner join gebruiken


    // er moet een nieuwe order aangemaakt worden, als de order al bestaat dan dus niet, gaat om die crosstable link





    if (isset($_SESSION['orderID'])) {
        echo '<div class="col-m-12">';
            echo '<table border="1" class="table-products">';
                echo '<tr>';
                    echo '<th>Aantal</th>';
                    echo '<th>Product</th>';
                    echo '<th>Prijs</th>';
                    echo '<th>Totaal</th>';
                    echo '<th>Verwijder</th>';
                echo '</tr>';
                foreach ($res as $row) {
                    echo '<tr>';
                        echo '<td><form method="post" action=""><input type="number" name="input-amount" value="' . $row['productAmount'] . '"/><button type="submit" name="btn-amount" value="'. $row['orderProductID'] . '">Submit</button></form></td>';
                        echo '<td>' . "<a href=http://multiversum.dev/product_detail.php?name=".$row['productID'].">".$row['productTitle']."</a>" . '</td>';
                        echo '<td>&euro; ' . $row['productPrice'] . '</td>';
                        echo '<td>&euro; ' . $row['productPrice'] * $row['productAmount'] . '</td>';
                        echo '<td><form method="post" action=""><button type="submit" name="btn-delete" value="'. $row['orderProductID'] . '">X</button></form></td>';
                    echo '</tr>';
                }
            echo '</table>';
        echo '</div>';


        echo '<div class="col-m-12">';
            echo 'Verzendwijze';
            echo '<select class="select-payment-method">';
                echo '<option value="volvo">iDeal</option>';
                echo '<option value="saab">PayPal</option>';
                echo '</select>';
            echo '</div>';

        $order_price = 0;
        foreach ($res as $row) {
            $order_price += $row['productPrice'] * $row['productAmount'];
        }

        echo '<div class="col-m-12">';
            echo '<table border="1" class="table-products">';
                echo '<tr>';
                    echo '<td>Orderkosten</td>';
                    echo '<td>&euro; ' . $order_price . '</td>';
                    echo '</tr>';
                echo '<tr>';
                    echo '<td>Totaalprijs excl. BTW (21%)</td>';
                    echo '<td>&euro; ' . round($order_price / 1.21, 2) . '</td>';
                    echo '</tr>';
                echo '<tr>';
                    echo '<td>Totaalprijs incl. BTW</td>';
                    echo '<td>&euro; ' . $order_price . '</td>';
                    echo '</tr>';
                echo '</table>';
            echo '</div>';

        echo '<div class="col-m-12">';
            echo '<button type="submit">Afrekenen</button>';
        echo '</div>';
    } elseif(!isset($_SESSION['orderID'])) {
        echo '<div class="col-m-12">';
        echo 'U heeft nog geen artikelen in uw winkelwagen';
        echo '</div>';
    }


?>
</body>
</html>
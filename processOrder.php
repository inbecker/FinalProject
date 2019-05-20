<?php
// Initialize the session
session_start();
include 'config.php';
?>

<?php

if (isset($_GET['checkout']) && isset($_GET['cart_id'])) {
    $cart_id = $_GET['cart_id'];
    $query = $link->query("SELECT * FROM `cart` WHERE  cart_id = '$cart_id' ");
    if($query->num_rows > 0){ 

        // create order
        $order_sql = "INSERT INTO orders (orderDate, shippedDate, status, comments, customerId) VALUES (?, ?, ?, ?, ?)";
        $orderDate = date("Y-m-d");
        $shippedDate = date("Y-m-d");
        $status = 'Shipped';
        $comments = "";
        $customerId = $_SESSION['id'];
        if($order_stmt = mysqli_prepare($link, $order_sql)){
            mysqli_stmt_bind_param($order_stmt, "ssssi", $orderDate, $shippedDate, $status, $comments, $customerId);
            if(mysqli_stmt_execute($order_stmt)){
                $order_id = $link->insert_id;

                // create order details
                while($row = $query->fetch_assoc()){
                    $order_details_sql = "INSERT INTO orderDetails (orderID, beerID, quantityOrdered) VALUES (?, ?, ?)";
                    $beer_id = $row["beer_id"];
                    $quantity_ordered = $row["quantity"];
                    if($order_details_stmt = mysqli_prepare($link, $order_details_sql)){
                        mysqli_stmt_bind_param($order_details_stmt, "iii", $order_id, $beer_id, $quantity_ordered);
                        if(mysqli_stmt_execute($order_details_stmt)){
                            // pass
                        } else{
                            echo "Something went wrong with order details creation. Please try again later.";
                        }
                    }
                    $i = $i + 1;
                    mysqli_stmt_close($order_details_stmt);
                }
                // finished creating order details
                // delete cart id
                $delete_sql = "DELETE FROM cart WHERE cart_id = ?";
                if($delete_stmt = mysqli_prepare($link, $delete_sql)){
                    mysqli_stmt_bind_param($delete_stmt, "s", $_GET['cart_id']);
                    if(mysqli_stmt_execute($delete_stmt)){
                        unset($_SESSION['cart_id']);
                    } else{
                        echo "Something went wrong with checkout. Please try again later.";
                    }
                }
                mysqli_stmt_close($delete_stmt);
                header("location: order.php?order_id=".$order_id); // go to order page

                } else{
                echo "Something went wrong with order creation. Please try again later.";
            }
        }
        mysqli_stmt_close($order_stmt);
    } else {
        header("location: main.php?cart_id=false");
    }
} else {
    header("location: main.php");
}
?>

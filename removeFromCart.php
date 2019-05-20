<?php
// Initialize the session
session_start(); 
// Include config file
require_once "config.php";
?>


<?php
    $cart_id = $_SESSION["cart_id"];
    if (isset($_GET['action']) && $_GET['action'] == "removeFromCart" && isset($_GET['beer_id'])) {
        $delete_sql = "DELETE FROM cart WHERE cart_id = ? and beer_id = ?";
        if($delete_stmt = mysqli_prepare($link, $delete_sql)){
            mysqli_stmt_bind_param($delete_stmt, "si", $cart_id, $_GET['beer_id']);
            if(mysqli_stmt_execute($delete_stmt)){
                echo 'here';
                echo $cart_id;
                echo $_GET['beer_id'];
                header("location: viewCart.php?cart_id=".$cart_id); // go back to cart page
            } else{
                header("location: viewCart.php?error=true&cart_id=".$cart_id); // go back to cart page
            }
        }
    }

?>

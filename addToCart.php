<?php
// Initialize the session
session_start(); 
// Include config file
require_once "config.php";
?>

<?php
if (empty($_SESSION["cart_id"])) {
    $chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $_SESSION["cart_id"] = substr(str_shuffle($chars), 0, 12);    
}
if (isset($_GET['action']) && $_GET['action'] == 'addToCart') {
    $cart_id = $_SESSION["cart_id"];
    $param_beer_id = $_GET['beer_id'];
    $param_quantity = 1;
    $user_id = $_SESSION["id"];

    // $query = $link->query("SELECT * FROM `cart` WHERE cart_id = ". $cart_id ." and beer_id = ". $param_beer_id);
    $query = $link->query("SELECT * FROM `cart` WHERE cart_id = '$cart_id' and beer_id = ". $param_beer_id);
    echo 'here';
    if($query->num_rows > 0){ 
        echo 'here 1';
        $update_sql = "UPDATE cart SET quantity = ? WHERE cart_id = '$cart_id' and beer_id = ". $param_beer_id;
        if($update_stmt = mysqli_prepare($link, $update_sql)){
            while($row = $query->fetch_assoc()){
                $new_quantity = $row["quantity"] + 1;
                mysqli_stmt_bind_param($update_stmt, "i", $new_quantity);
                if(mysqli_stmt_execute($update_stmt)){
                    header("location: ". basename(parse_url($_SERVER['HTTP_REFERER'],PHP_URL_PATH)). "?updated_cart=true&cart_id=". $cart_id);
                } else{
                    header("location: ". basename(parse_url($_SERVER['HTTP_REFERER'],PHP_URL_PATH)). "?error=true");
                }
            }
        }
        mysqli_stmt_close($update_stmt);
    } else {
        $insert_sql = "INSERT INTO cart (cart_id, beer_id, quantity, user_id) VALUES (?, ?, ?, ?)";
        if($insert_stmt = mysqli_prepare($link, $insert_sql)){
            mysqli_stmt_bind_param($insert_stmt, "siii", $cart_id, $param_beer_id, $param_quantity, $user_id);
            if(mysqli_stmt_execute($insert_stmt)){
                header("location: ". basename(parse_url($_SERVER['HTTP_REFERER'],PHP_URL_PATH)). "?added_to_cart=true&cart_id=". $cart_id);
            } else{
                header("location: ". basename(parse_url($_SERVER['HTTP_REFERER'],PHP_URL_PATH)). "?error=true");
            }
        }
        mysqli_stmt_close($insert_stmt);
    }

} else {
    header("location: ". basename(parse_url($_SERVER['HTTP_REFERER'],PHP_URL_PATH)). "?error=true");
}

?>

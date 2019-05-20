<?php 
    if (isset($_GET['cart_id']) && $_GET['cart_id'] == $_SESSION['cart_id']) {
        $cart_id = $_SESSION['cart_id'];
        $query = $link->query("SELECT * FROM `cart` WHERE  cart_id = '$cart_id'");
        if($query->num_rows > 0){ 
        if(isset($_GET['added_to_cart'])){ ?>

            <div class="alert alert-success alert-dismissible fade show w-50" role="alert">
            Beer added to cart: <a href="/viewCart.php?cart_id=<?php echo $_SESSION['cart_id'] ?>">View cart</a>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
        
        <?php } else if (isset($_GET['updated_cart'])) { ?>

            <div class="alert alert-success alert-dismissible fade show w-50" role="alert">
            Cart has been updated: <a href="/viewCart.php?cart_id=<?php echo $_SESSION['cart_id'] ?>">View cart</a>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        
        <?php }
        }
    } else if (isset($_GET['error'])) { ?>
        <div class="alert alert-danger alert-dismissible fade show w-50" role="alert">
            Something went wrong. Please try again.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
   <?php }
?>

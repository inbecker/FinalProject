<?php
// Initialize the session
session_start();
include 'config.php';
?>
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
         <link rel="stylesheet" href="style.css">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

  
        <Title>Beer Hall</Title>
    </head>
    <body>
	<!-- HEADER 
        <div id="site">
            <div id="header">
                <img src="images/beer1.jpeg"/>    
            </div> -->
        <!-- </div> -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="Main.php">Home </a>
              </li>
                <li class="nav-item active">
                <a class="nav-link" href="About.php">About </a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Beers
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <img src="images/beerSelector2.jpg" alt=""/>
                  <a class="dropdown-item" href="americanAle.php">American Ale</a>
                  <a class="dropdown-item" href="americanLager.php">American Lager</a>
                  <a class="dropdown-item" href="belgianAndFrenchAle.php">Belgian and French Ale</a>
                  <a class="dropdown-item" href="irishAle.php">Irish Ale</a>
                  <a class="dropdown-item" href="britshAle.php">English Ale</a>
                  <a class="dropdown-item" href="otherStyles.php">Other Styles</a>
                </div>
              </li>
             
            </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">     
                         <?php if (isset($_SESSION['id'])) { ?>
                <li><a class="nav-link" href="">Signed in as <?php echo $_SESSION['username']; ?></a></li>&nbsp;
                      <li><a class="nav-link" href="Checkout.php">Check Out</a></li>
                      <li><a class="nav-link" href="logout.php">Log Out</a></li>
            <?php } else { ?>
                <li><a class="nav-link" href="login.php">Login</a></li>
             <?php } ?>  
                </ul>
          </div>
        </nav>
        
        <br />

  
        <main>

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
                        //    echo "Order process complete, now checkout";
                        } else{
                            echo "Something went wrong with order details creation. Please try again later.";
                        }
                    }
                    mysqli_stmt_close($order_details_stmt);
                }
                // finished creating order details
                // delete cart id
                $delete_sql = "DELETE FROM cart WHERE cart_id = ?";
                if($delete_stmt = mysqli_prepare($link, $delete_sql)){
                    mysqli_stmt_bind_param($delete_stmt, "s", $_GET['cart_id']);
                    if(mysqli_stmt_execute($delete_stmt)){
                        unset($_SESSION['cart_id']);
                        echo '<h4 class="text-success">Order and check out process complete, you can add a payment gateway</h4>';
                        echo '<a href="/main.php">Go to home page</a>';
                    } else{
                        echo "Something went wrong with checkout. Please try again later.";
                    }
                }
                mysqli_stmt_close($delete_stmt);
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
        </main>
    </body>
</html>

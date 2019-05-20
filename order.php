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

  
        <main class="ml-3">

<?php

if (isset($_GET['order_id'])) {
    $order_id = $_GET['order_id'];
    $query = $link->query("SELECT * FROM `orderDetails` WHERE  orderId = '$order_id' ");
    if($query->num_rows > 0){ 
        $order_details = array();
        $total_price = 0;
        $i = 0;
        while($row = $query->fetch_assoc()){
            $beer_id = $row["beerID"];

            // create array of order details
            $price_query = $link->query("Select price from beerStyle where styleID = (Select styleID from beer where beerID =". $beer_id. ")");
            $beer_price = $price_query->fetch_assoc()['price'];
            $beer_query = $link->query("Select beerName, description from beer where beerID =". $beer_id);
            $beer_name = $beer_query->fetch_assoc()['beerName'];
            $beer_query = $link->query("Select beerName, description from beer where beerID =". $beer_id);
            $beer_description = $beer_query->fetch_assoc()['description'];
            $order_details[$i]->beer['name'] = $beer_name;
            $order_details[$i]->beer['description'] = $beer_description;
            $order_details[$i]->beer['price'] = $beer_price;
            $order_details[$i]->beer['quantity'] = $row['quantityOrdered'];
            $total_price = $total_price + ($beer_price * $row['quantityOrdered']);
            $i = $i + 1;

            
      }
      echo "<h5>Your order number is ". $order_id. "</h5>"; ?>
        <h5>Order Details</h5>
        <div class="row">
            <div class="col-6">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col">Beer name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price/Unit</th>
                        <th scope="col">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php for ($x = 0; $x < count($order_details); $x++) { ?>
                            <tr>
                                <th scope="row"> <?php echo $order_details[$x]->beer['name'] ?> </th>
                                <td> <?php echo substr($order_details[$x]->beer['description'],0,50).'...' ?> </td>
                                <td> <?php echo $order_details[$x]->beer['price'] ?> </td>
                                <td> <?php echo $order_details[$x]->beer['quantity'] ?> </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <p>Total price: $<?php echo $total_price ?> </p>
                <h4 class="text-success">Order created, you can checkout by making payment</h4>
                <a href="/main.php">Go to home page</a>
            </div>
        </div>
    <?php } else {
        header("location: main.php?order_id=false");
    }
} else {
    header("location: main.php");
}
?>
        </main>
    </body>
</html>

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

  
        <main >
        <h4 class="pl-3">Cart Page</h4>
        <?php
            $cart_id = $_GET['cart_id'];
            $query = $link->query("SELECT * FROM `cart` WHERE cart_id = '$cart_id' and user_id =".$_SESSION['id']);
            if($query->num_rows > 0){ 
                while($row = $query->fetch_assoc()){
            ?>
            <div class="item col-lg-4">
                <div class="thumbnail">
                    <div class="caption">
                        <h4 class="list-group-item-heading">Beer id: <?php echo $row["beer_id"]; ?></h4>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="lead">Quantity: <?php echo '$'.$row["quantity"]; ?></p>
                            </div>
                            <div class="col-md-6">
                                <a class="btn btn-success" href="addToCart.php?action=addToCart&beer_id=<?php echo $row["beer_id"]; ?>">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <?php }
                echo "<a class='pl-4' href='/checkout.php?checkout=true&cart_id=".$_GET['cart_id']."'>Checkout</a>";
            }else{
                header("location: main.php?cart_id=false");
            ?>
            <?php } ?>
        </main>
    </body>
</html>

<?php
// Initialize the session
session_start();

?>

<!DOCTYPE html>
<html>
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
                  <a class="dropdown-item" href="britishAle.php">English Ale</a>
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
        <br>
<main>
    <?php 
        if (isset($_GET['cart_id']) && $_GET['cart_id'] == 'false') {
          echo '<div class="alert alert-danger alert-dismissible fade show w-50" role="alert">
                Cart does not exist!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>';
        }
    ?>
        <p align="center" class="main">"Thank you for shopping at BEER HALL. Remember you have a 25% discount on your first order!"</p>
    
		<br>
    </main>
    <hr>
        <div class="container">
            <center>
            <div class="row">
                <div class="col-sm-4"> 
                    <p class="style2">American Ale</p>
                    <img src="images/americanAle.png"><br><br>
                    <button type="button" class="btn btn-outline-secondary" onclick="window.location='americanAle.php';">Start Shopping</button>
                </div>
                <div class="col-sm-4">
                    <p class="style2">American Lager</p>
                    <img src="images/americanLager.png"><br><br>
                    <button type="button" class="btn btn-outline-secondary" onclick="window.location='americanLager.php';">Start Shopping</button>
                </div>
                <div class="col-sm-4">
                    <p class="style2">Belgian and French Ale</p>      
                    <img src="images/belgianAle.png"><br><br>
                     <button type="button" class="btn btn-outline-secondary" onclick="window.location='belgianAndFrenchAle.php';">Start Shopping</button>
                </div>
                <div class="col-sm-4">
                    <p class="style2">Irish Ale</p>      
                    <img src="images/irishAle.png"><br><br>
                     <button type="button" class="btn btn-outline-secondary" onclick="window.location='irishAle.php';">Start Shopping</button>
                </div>
                <div class="col-sm-4">
                    <p class="style2">British Ale</p>      
                    <img src="images/englishAle.png"><br><br>
                     <button type="button" class="btn btn-outline-secondary" onclick="window.location='britishAle.php';">Start Shopping</button>
                </div>
                <div class="col-sm-4">
                    <p class="style2">Other Styles</p>      
                    <img src="images/otherStyles.png"><br><br>
                     <button type="button" class="btn btn-outline-secondary" onclick="window.location='otherStyles.php';">Start Shopping</button>
                </div>

  
            </div>
            </center>
        </div>
    <br>
    <br>
    

  </body>   
</html>
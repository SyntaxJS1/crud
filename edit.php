<?php
require_once("db.php");
require_once("header.php");
?>
<?php
//query
if(isset($_POST["submit"])){
    $fname = htmlspecialchars($_POST["fname"]);
    $lname = htmlspecialchars($_POST["lname"]);
    $email = htmlspecialchars($_POST["email"]);
    $phone = htmlspecialchars($_POST["phone"]);
    $image = htmlspecialchars($_POST["profile_image"]);
    $sql = "UPDATE users "; 
    $sql .= "SET fname = " . "$fname";
    $sql .= ", lname = " . "$lname";
    $sql .= ", email = " . "$email";
    $sql .= ", profile_image = " . "$image";
    $sql .= ", phone = " . "$phone";
    $sql .= " WHERE users_id = " . $_GET["users_id"];
    $result = mysqli_query($conn, $sql);
    if(!$result){
        die("Database Query Failed" . mysqli_error($conn));
    }else{
        if($result && mysqli_affected_rows($conn)){
            echo "Update Successful...redirecting to users";?>
            <script>
                setTimeout(()=>{
                    window.location.href = "https://localhost/crud/users.php"
                })
            </script>
        <?php }
    }
     
}

?>
    <span class="second user">
            <h1>USERS UPDATE</h1><br/>
            <form action="add.php" method="post">
                <input type="text" name="firstname" value="<?php echo $_GET["fname"] ?>" placeholder="your firstname" required/><br/><br/>
                <input type="text" name="lastname" value="<?php echo $_GET["lname"] ?>" placeholder="your lastname" required/><br/><br/>
                <input type="email" name="email" value="<?php echo $_GET["email"] ?>" placeholder="your email" required/><br/><br/>
                <input type="number" name="phone" value="<?php echo $_GET["phone"] ?>" placeholder="your phone number" required/><br/><br/>
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br/><br/>
                <img src="<?php echo "./assets/images/" . $_GET["profile_image"] ?>" width="64px" height="64px"/><br/>
                Upload new Profile image:<input type="file" name="image" accept="image/*" value=""/><br/><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </span>
</main>
<?php
include("footer.php");
?>
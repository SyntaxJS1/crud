<?php
// require_once("functions.php");
require_once("db.php"); 
require_once("header.php");
?>
<?php
//perform database query
if(isset($_POST["submit"])): ?>
    <pre>
        <?php  //print_r($_POST); 
            //echo gettype($_POST["firstname"])  
        ?>
    <pre>
    <?php
    $firstname = htmlspecialchars(trim($_POST["firstname"]));
    $lastname = htmlspecialchars(trim($_POST["lastname"]));
    $email = htmlspecialchars(trim($_POST["email"]));
    $phone = htmlspecialchars(trim($_POST["phone"]));
    $gender = htmlspecialchars(trim($_POST["gender"]));
    //for the image we use file system variable $_FILES
    $image = $_FILES["image"]["name"];
    $tempimage = $_FILES["image"]["tmp_name"];
    $folder = "./assets/images/" . $image;
    $sql = "INSERT INTO users VALUES
            (DEFAULT, '{$firstname}', '{$lastname}', '{$email}', '{$phone}', '{$gender}', '{$image}')";
    $result = mysqli_query($conn, $sql);

    //move uploaded image to it folder: assets/images
    if(move_uploaded_file($tempimage, $folder)): ?>
        <?php if($result && mysqli_affected_rows($conn)):?>
            <aside title="USER UPLOADED">
                <?php
                $sql = "SELECT * FROM users";
                $result = mysqli_query($conn, $sql);
                while($row = mysqli_fetch_assoc($result)){
                    $id = mysqli_insert_id($conn);
                    if($row["users_id"] === $id){
                        echo "<b style='color:green'>" . 
                        $row["fname"] . " " . $row["lname"] . "Added Successfully". 
                        "</b>";
                    }
                }
                ?>
            </aside>
            <script>
                    setTimeout(()=>{
                    window.location.href = "http://localhost/crud/users.php";
                }, 5000)
                
            </script>
        <?php else : ?>
            <?php die("Database Query Failed" . mysqli_error($conn));?>
        <?php endif ?>  
    <?php endif ?>
<?php endif ?>
        <span class="second user">
            <h1>USERS CRUD</h1><br/>
            <form action="add.php" method="post" enctype="multipart/form-data">
                <input type="text" name="firstname" value="" placeholder="your firstname" required/><br/><br/>
                <input type="text" name="lastname" value="" placeholder="your lastname" required/><br/><br/>
                <input type="email" name="email" value="" placeholder="your email" required/><br/><br/>
                <input type="number" name="phone" value="" placeholder="your phone number" required/><br/><br/>
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br/><br/>
                <input type="file" name="image" accept="image/*" value=""/><br/><br/>
                <input type="submit" name="submit" value="Submit"/>
            </form>
        </span>
</main>
<?php
include("footer.php");
?>
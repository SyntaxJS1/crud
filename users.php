<?php
require_once("db.php");
require_once("header.php");
$url = rawurlencode("edit.php");
?>
<?php 
//perform database query
$sql = "SELECT * FROM users";
$result = mysqli_query($conn, $sql);
if(!$result){
    die("Database Query Failed" . mysqli_error($conn));
}
if(isset($_GET["id"])): ?>
    <?php $id = $_GET["id"];
    $delete_qry = "DELETE FROM users
                WHERE users_id = {$id}";
    $result = mysqli_query($conn, $delete_qry);
    if($result && mysqli_affected_rows($conn)): ?>
        <script>
            window.location.href = "http://localhost/crud/users.php"
        </script>
    <?php endif ?>
<?php endif ?>

        <span class="second user">
                
                <button>Add User</button><br/>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Profile Image</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                            <?php 
                            while($row = mysqli_fetch_assoc($result)):
                            ?>
                            <tr>
                                <td><?php echo $row["users_id"] ?></td>
                                <td><img src='<?php echo "./assets/images/" . $row["profile_image"] ?>' width="64px" height="64px"/></td>
                                <td><?php echo $row["fname"] ?></td>
                                <td><?php echo $row["lname"] ?></td>
                                <td><?php echo $row["email"] ?></td>
                                <td><?php echo $row["phone"] ?></td>
                                <td><?php echo $row['gender']?></td>
                            
                                <td>
                                    <button><a href="<?php echo $url?>?id=<?php echo urlencode($row["users_id"]) ?>&profile_image=<?php echo $row['profile_image'] ?>&fname=<?php echo $row['fname'] ?>&lname=<?php echo $row['lname'] ?>&email=<?php echo $row['email'] ?>&phone=<?php echo $row['phone'] ?>&gender=<?php echo $row['gender'] ?>">Edit</a></button>
                                    <button><a href="<?php echo "users.php"?>?id=<?php echo urlencode($row["users_id"]) ?>">Delete</a></button>
                                </td>
                            </tr>
                            <?php endwhile ?>
                    </tbody>
                </table>
        </span>
</main>
<?php
include("footer.php");
?>
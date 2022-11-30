<?php
    use OOP\App\controller\HomeController;
?>

<main class="container">
    <div class="card">
        <div class="card-header">Data User</div>
        <div class="card-body">
            <table class="table">
                <tr>
                    <th width='5%'>No</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
    
                <?php
                    $no = 1;
                    foreach(HomeController::$dataUser as $row){
                ?>

                <tr>
                    <td><?php print $no++;?></td>
                    <td><?php print $row->username;?></td>
                    <td><?php print $row->email;?></td>
                    <td><?php print $row->password;?></td>
                </tr>

                <?php
                    }
                ?>
            </table>
        </div>
    </div>
</main>
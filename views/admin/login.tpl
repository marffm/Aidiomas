<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="login">
        <div class="row">

            <div class="col-sm-4 col-sm-offset-4">
                <form action="login/verify" method="POST">
                    <span>Usuário</span>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">@</span>
                        <input type="text" name="username" id="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>

                    <span>Senha</span>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">@</span>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Senha" aria-describedby="basic-addon1">
                    </div>
                    <p><?php echo $this->data['login_error']; ?></p>                    
                    <input type="submit" class="btn btn-default" type="button" value="Login">

                </form>

            </div>

        </div>
    </div>

</div>

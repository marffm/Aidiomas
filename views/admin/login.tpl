<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="login">
        <div class="row">

            <div class="col-sm-4 col-sm-offset-4">
                <form action="<?php echo $verify ?>" method="POST">
                    <span>Usuário</span>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">@</span>
                        <input type="text" name="username" id="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>

                    <span>Senha</span>
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><i class="fa fa-unlock-alt"></i></span>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Senha" aria-describedby="basic-addon1">
                    </div>

                    <div class="radio-inline">
                        <label class="radio-inline">
                            <input type="radio" name="category" id="category" value="admin"> Admin                            
                        </label>
                    </div>
                    
                    <div class="radio-inline">
                        <label class="radio-inline">
                            <input type="radio" name="category" id="category" value="professor"> Professor                            
                        </label>
                    </div>
                    
                    <div class="radio-inline">
                        <label class="radio-inline">
                            <input type="radio" name="category" id="category" value="aluno"> Aluno
                        </label>
                    </div>


                    <?php if (isset($this->data['error'])) { ?>
                    <p class="alert alert-danger" role="alert"><?php echo $this->data['error'] ?></p>
                    <?php } ?>
                    </br>
                    <input type="submit" class="btn btn-default" type="button" value="Login">

                </form>

            </div>

        </div>
    </div>

</div>

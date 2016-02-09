<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">

        <div class="col-sm-3">
            <div class="admin_user">                
                <h4>Área Administrativa</h4>
                <hr />
                <div class="icon"><i class="fa fa-user fa-4x"></i></div>
                <p class="admin_name"><?php echo $data['username'] ?></p>
                <p class="admin-name-category">Usuário administrativo</p>
                <p class="admin-logoff"><a href="<?php echo $destroy ?>">Sair</a></p>
            </div>
        </div>

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Cadastro Aluno: <strong><?php echo $aluno['nome'] ?> <?php echo $aluno['sobrenome'] ?></strong></h3>
                </div>

                <div class="panel-body">
                    <p>Código: <strong><?php echo $aluno['codigo'] ?></strong></p>

                    <div class="panel panel-default">

                        <form action="<?php echo PATH_URL ?>aluno/updateAluno" method="POST" class="panel-body">
                            <input type="hidden" name="codigo" id="codigo" value="<?php echo $aluno['codigo'] ?>" />
                            <input type="hidden" name="nivel" id="nivel" value="<?php echo $aluno['nivel'] ?>" />

                            <div class="row">
                                <div class="col-sm-3">
                                    <span>Nome</span>
                                    <input type="text" name="nome" id="nome" required="" maxlength="25" value="<?php echo $aluno['nome'] ?>" placeholder="<?php echo $aluno['nome'] ?>" class="form-control" />
                                </div>
                                <div class="col-sm-6">
                                    <span>Sobrenome</span>
                                    <input type="text" required maxlength="50" name="sobrenome" id="sobrenome" value="<?php echo $aluno['sobrenome'] ?>" placeholder="<?php echo $aluno['sobrenome'] ?>" class="form-control"/>
                                </div>
                                <div class="col-sm-3">
                                    <span>Data Nascimento</span>
                                    <input type="date" required name="nascimento" id="nascimento" value="<?php echo $aluno['nascimento'] ?>" class="form-control" />
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-sm-4">
                                    <span>Telefone</span>
                                    <input type="text" name="telefone" id="telefone" value="<?php echo $aluno['telefone'] ?>" maxlength="16" class="form-control" />
                                </div>
                                <div class="col-sm-8">
                                    <span>E-mail</span>
                                    <input type="text" name="email" id="email" maxlength="50" class="form-control" value="<?php echo $aluno['email'] ?>" />
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-sm-4">
                                    <span>Usuário</span>
                                    <input type="text" name="usuario" id="usuario" required value="<?php echo $aluno['usuario'] ?>" maxlength="10" class="form-control" />
                                </div>
                                <div class="col-sm-4">
                                    <span>Senha</span>
                                    <input type="text" name="senha" id="senha" value="<?php echo $aluno['senha'] ?>" maxlength="9" class="form-control" required="" />
                                </div>
                                <div class="col-sm-2" id="button-inserirAluno">
                                    <button type="submit" class="btn btn-info">Atualizar Aluno</button>
                                </div>
                                <div class="col-sm-2" id="button-inserirAluno">
                                    <a href="<?php echo PATH_URL ?>aluno/deleteAluno/<?php echo $aluno['codigo'] ?>" class="btn btn-danger">Deletar</a>
                                </div>
                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

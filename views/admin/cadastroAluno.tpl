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
                <p class="admin-logoff"><a href="<?php echo $data['destroy'] ?>">Sair</a></p>
            </div>
            
        </div>
        
        <div class="col-sm-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Cadastrar Aluno</h4>
                </div>
                
                <div class="panel-body">
                    <form action="<?php echo PATH_URL ?>cadastroAluno/checkAluno" method="POST">
                        <input type="hidden" name="nivel" id="nivel" value=3 />
                        
                        <div class="row">
                            <div class="col-sm-2">
                                <label>Código do Aluno</label>
                                <input type="text" name="codigo" id="codigo" placeholder="00000000" class="form-control" required="" />
                            </div>
                            <div class="col-sm-4">
                                <label>Nome do Aluno</label>
                                <input type="text" required maxlength="25" name="nome" id="nome" placeholder="Nome do Aluno" class="form-control"/>
                            </div>
                            <div class="col-sm-6">
                                <label>Sobrenome do Aluno</label>
                                <input type="text" required maxlength="50" name="sobrenome" id="sobrenome" placeholder="Sobrenome do Aluno" class="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Data de Nascimento</label>
                                <input type="date" required name="nascimento" id="nascimento" class="form-control" />
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Telefone</label>
                                <input type="text" name="telefone" id="telefone" placeholder="(00) 00000 - 0000" maxlength="16" class="form-control" />
                            </div>
                            <div class="col-sm-8">
                                <label>E-mail</label>
                                <input type="text" name="email" id="email" maxlength="50" class="form-control" placeholder="seuemail@provedoremail.com.br" />
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Usuário</label>
                                <input type="text" name="usuario" id="usuario" required placeholder="usuario" maxlength="10" class="form-control" /> 
                            </div>
                            <div class="col-sm-4">
                                <label>Senha</label>
                                <input type="text" name="senha" id="senha" placeholder="123456789" maxlength="9" class="form-control" required="" />
                            </div>
                            <div class="col-sm-1 col-sm-offset-2" id="button-inserirAluno">
                                <button type="submit" class="btn btn-info">Inserir Aluno</button>
                            </div>                            
                        </div>
                        
                        <?php if (isset($error)) { ?>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-8">
                                <p class="alert alert-danger" role="alert"><?php echo $error ?></p>
                            </div>
                        </div>
                        <?php } ?>
                        
                    </form>
                </div>
                
            </div>
        </div>
        
        
    </div>
    
</div>

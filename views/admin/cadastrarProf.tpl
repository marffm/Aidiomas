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

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Alunos</h4>
                </div>
                <div class="panel-body">
                    <?php foreach ($data['alunoList'] as $alunos) { ?>
                    <a href="<?php echo PATH_URL ?>aluno/setAluno/<?php echo $alunos['codigo'] ?>" class="list-group-item"><?php echo $alunos['codigo'] ?> - <?php echo $alunos['nome'] ?> <?php echo $alunos['sobrenome'] ?></a>
                    <?php } ?>
                    <a href="#" class="list-group-item active">Cadastrar Aluno</a>
                </div>
            </div>
        </div>

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Cadastro de Professor</h4>
                </div>
                <div class="panel-body">
                    <form action="<?php echo PATH_URL ?>cadastrarProf/insertProf" method="POST">
                        <input type="hidden" nome="nivel" id="nivel" value=2 />
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Nome</label>
                                <input type="text" name="nome_prof" id="nome_prof" required max-length="25" class="form-control" placeholder="Nome" /> 
                            </div>

                            <div class="col-sm-6">
                                <label>Sobrenome</label>
                                <input type="text" name="sobrenome_prof" id="sobrenome_prof" required max-length="50" class="form-control" placeholder="Sobrenome" /> 
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-4">
                                <label>Telefone</label>
                                <input type="text" name="telefone_prof" id="telefone_prof" max-length="15" class="form-control" placeholder="(00) 0000-0000" />
                            </div>
                            <div class="col-sm-5">
                                <label>E-mail</label>
                                <input type="text" name="email_prof" id="email_prof" max-length="30" class="form-control" placeholder="nome@servidordeemail.com.br" />
                            </div>
                            <div class="col-sm-3">
                                <label>Idioma</label>
                                <select id="idioma" name="idioma" class="form-control" required>
                                    <?php foreach ($data['idiomaslist'] as $idiomas) { ?>
                                    <option value="<?php echo $idiomas['id'] ?>"><?php echo utf8_encode($idiomas['nome_idioma']) ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-5">
                                <label>Usuário</label>
                                <input type="text" name="usuario_prof" id="usuario_prof" required max-length="15" class="form-control" placeholder="Usuário" /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <label>Senha</label>
                                <input type="text" name="senha_prof" id="senha_prof" required max-length="8" class="form-control" placeholder="12345678" />
                            </div>
                        </div>

                        <div class="article_buttons">
                            <button type="submit" class="btn btn-default">Salvar</button>
                        </div>


                    </form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Professores Cadastrados</h4>
                </div>
                <div class="panel-body">
                    
                    <?php foreach ($data['profList'] as $professores) { ?>
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <form action="<?php echo PATH_URL ?>cadastrarProf/updateProf/<?php echo $professores['id'] ?>" method="POST" class="panel-body">
                                <input type="hidden" name="id" id="id" value="<?php echo $professores['id'] ?>">
                                <span>Nome</span>
                                <input name="nome_prof" id="nome_prof" required max-length="25" class="form-control" placeholder="Nome" value="<?php echo $professores['nome_prof'] ?>" />
                                <span>Sobrenome</span>
                                <input type="text" name="sobrenome_prof" id="sobrenome_prof" required max-length="50" class="form-control" placeholder="Sobrenome" value="<?php echo $professores['sobrenome_prof'] ?>" />
                                <span>Telefone</span>
                                <input type="text" name="telefone_prof" id="telefone_prof" max-length="15" class="form-control" placeholder="(00) 0000-0000" value="<?php echo $professores['telefone_prof'] ?>" />
                                <span>E-mail</span>
                                <input type="text" name="email_prof" id="email_prof" max-length="30" class="form-control" placeholder="nome@servidordeemail.com.br" value="<?php echo $professores['email_prof'] ?>" />
                                <span>Idioma</span>
                                <select id="idioma" name="idioma" class="form-control">
                                    <option value="<?php echo $professores['idioma'] ?>" selected><?php echo utf8_encode(strtoupper($professores['nome_idioma'])) ?></option>
                                    <?php foreach ($data['idiomaslist'] as $idiomas) { ?>
                                    <option value="<?php echo $idiomas['id'] ?>"><?php echo utf8_encode($idiomas['nome_idioma']) ?></option>
                                    <?php } ?>ion>
                                </select>
                                <span>Usuário</span>
                                <input type="text" name="usuario_prof" id="usuario_prof" required max-length="15" class="form-control" placeholder="Usuário" value="<?php echo $professores['usuario_prof'] ?>" />
                                <span>Senha</span>
                                <input type="text" name="senha_prof" id="senha_prof" required max-length="8" class="form-control" placeholder="12345678" value="<?php echo $professores['senha_prof'] ?>" />
                                <div class="article_buttons">
                                    <button type="submit" class="btn btn-default">Salvar</button>
                                    <a href="<?php echo PATH_URL ?>cadastrarProf/deleteProf/<?php echo $professores['id']; ?>" class="btn btn-default">Deletar</a>
                                </div>
                            </form>
                        </div>                        
                    </div>
                    <?php } ?>
                </div>
            </div>

        </div>

    </div>



</div>